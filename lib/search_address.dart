import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SearchAddress extends StatefulWidget {
  const SearchAddress({super.key});

  @override
  State<SearchAddress> createState() => _SearchAddressState();
}

class _SearchAddressState extends State<SearchAddress> {
  TextEditingController controller = TextEditingController();
  List<SearchItem> streets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111216),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 30),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: const BoxDecoration(
                    color: Color(0xff191A1F)
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 8),
                    const Icon(
                        Icons.search_rounded,
                        color: Color(0xff808080)
                    ),
                    const SizedBox(width: 11),
                    Expanded(
                      child: TextField(
                        onChanged: (value) async {
                          setState(() {});
                          final resultWithSession = YandexSearch.searchByText(
                            searchText: value,
                            geometry: Geometry.fromBoundingBox(
                                const BoundingBox(
                                  southWest: Point(latitude: 55.76996383933034, longitude: 37.57483142322235),
                                  northEast: Point(latitude: 55.785322774728414, longitude: 37.590924677311705),
                                )
                            ),
                            searchOptions: const SearchOptions(
                              searchType: SearchType.geo,
                              geometry: false,
                            ),
                          );

                          final result = await resultWithSession.result;
                          streets = result.items!;
                        },
                        style: const TextStyle(color: Colors.white),
                        controller: controller,
                        decoration: const InputDecoration(
                          hintText: 'Введите адрес',
                          hintStyle: TextStyle(color: Color(0xff808080)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: controller.text.isNotEmpty
                          ? GestureDetector(onTap: () {
                        controller.clear();
                        setState(() {});
                      },
                          child: const Icon(
                            Icons.clear,
                            size: 25,
                            color: Color(0xff808080),
                          )
                      )
                          : null,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: streets.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(onTap: () {
                          // Navigator.of(context).pop(MapModel(
                          //     adress: streets[index].name,
                          //     lat: streets[index].geometry.first.point!.latitude,
                          //     lon: streets[index].geometry.first.point!.longitude
                          // ));
                        },
                          child: Container(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              color: Colors.transparent,
                              child: Text(
                                  streets[index].name,
                                  style: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.white
                                  )
                              )
                          ),
                        );
                      }
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
