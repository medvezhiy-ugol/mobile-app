import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/ui/pages/map/search_page.dart';
import 'package:medvezhiy_ugol/ui/widgets/map/sliding_panel_widget/full_view_restaurant_widget.dart';
import 'package:medvezhiy_ugol/ui/widgets/map/sliding_panel_widget/view_restaurant_widget.dart';
import 'package:medvezhiy_ugol/ui/widgets/sheets/map_sheet/deliver_here.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../../models/map_model.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/buttons/custom_button.dart';
import '../../widgets/delivery_switcher.dart';
import '../../widgets/map/restaurant_info.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, required this.fromPage});

  final bool fromPage;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {

  late final YandexMapController _mapController;
  double lat = 57.625636;
  double lon = 39.879540;
  double latEnd = 0;
  double lonEnd = 0;
  bool isLoading = true;
  bool isAddress = false;
  String adress = '';
  late final PageController pageController;
  final PanelController panelController = PanelController();

  Future<Position> _determinePosition() async {

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  bool _isDraged = false;
  bool isFadeAnimated = false;

  Future<void> getPosition() async {
    Position position = await _determinePosition();
    lat = position.latitude;
    lon = position.longitude;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: context.read<CustomNavbarCubit>().state.isTakeaway ? 1 : 0);
    if (!context.read<CustomNavbarCubit>().state.isTakeaway) {
      getPosition();
    }
    else {
      isLoading = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
  builder: (context, state) {
    return isLoading ? const Center(child: CircularProgressIndicator()) : Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: YandexMap(
                  mapObjects: [
                    PlacemarkMapObject(
                      mapId: const MapObjectId('org_0'),
                      point: Point(latitude: lat, longitude: lon),
                      opacity: 1,
                      isDraggable: false,
                      icon: PlacemarkIcon.single(
                        PlacemarkIconStyle(
                          scale: 0.7,
                          image: BitmapDescriptor.fromAssetImage('assets/images/map_page/point.png'),
                          rotationType: RotationType.noRotation,
                          anchor: const Offset(0.5, 1),
                        ),
                      ),
                    ),
                  ],
                  nightModeEnabled: true,
                  onMapCreated: (YandexMapController controller) {
                    _mapController = controller;
                    _mapController.moveCamera(
                      CameraUpdate.newCameraPosition(CameraPosition(
                        target: Point(
                          latitude: lat,
                          longitude: lon,
                        ),
                        zoom: 14.4746,
                      ),
                      ),
                    );
                  },

                  onCameraPositionChanged: (CameraPosition position, CameraUpdateReason reason, bool value) async {
                    if (!state.isTakeaway) {
                      panelController.animatePanelToPosition(0);
                      lat = position.target.latitude;
                      lon = position.target.longitude;
                      setState(() {
                      });
                      final searchResult = YandexSearch.searchByPoint(
                        point: position.target,
                        zoom: 15,
                        searchOptions: const SearchOptions(
                          searchType: SearchType.geo,
                          geometry: false,
                        ),
                      );
                      final result = await searchResult.result;
                      if (result.items != null) {
                        adress = result.items!.first.name;
                        setState(() {});
                      }
                    }
                  }
              )
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  DeliverySwitcher(
                    onDelivery: () {
                      panelController.animatePanelToPosition(0);
                      pageController.jumpToPage(0);
                      getPosition().then((value) {
                        _mapController.moveCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                            target: Point(
                              latitude: lat,
                              longitude: lon,
                            ),
                            zoom: 14.4746,
                          ),
                          ),
                        );
                      });
                    },
                    onTakeaway: () {
                      panelController.animatePanelToPosition(0.5);
                      pageController.jumpToPage(1);
                      _mapController.moveCamera(
                        CameraUpdate.newCameraPosition(const CameraPosition(
                          target: Point(
                            latitude: 57.625636,
                            longitude: 39.879540,
                          ),
                          zoom: 14.4746,
                        ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 34),
                  Text(
                    adress,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: Color(0xffEFEFEF),
                        fontFamily: 'Unbounded'
                    ),
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () async {
                      panelController.animatePanelToPosition(0);
                      MapModel? mapModel = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage(address: adress)));
                      if (mapModel != null) {
                        adress = mapModel.name;
                        lat = mapModel.lat;
                        lon = mapModel.lon;
                        _mapController.moveCamera(
                          CameraUpdate.newCameraPosition(CameraPosition(
                            target: Point(
                              latitude: lat,
                              longitude: lon,
                            ),
                            zoom: 14.4746,
                          ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 24,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.colorEFEFEF,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: const Text(
                        'Изменить адрес доставки',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: AppColors.color26282F,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      panelController.animatePanelToPosition(1);
                    },
                      child: const CustomButton(text: 'Готово'),
                  ),
                  const SizedBox(height: 84),
                ],
              ),
            ),
          ),
          SlidingUpPanel(
            onPanelSlide: (double point) {
              isFadeAnimated = false;
              _isDraged = false;
              if ((pageController.page == 2.0) &&
                  (!_isDraged == true) &&
                  (point > 0.0)) {
                setState(() {
                  isFadeAnimated = true;
                });
                _isDraged = true;
              }
              if ((pageController.page == 2.0) &&
                  (_isDraged == true) &&
                  (point < 0.3)) {
                setState(() {
                  isFadeAnimated = false;
                });
              }
            },
            defaultPanelState: PanelState.CLOSED,
            minHeight: 0,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            controller: panelController,
            color: AppColors.color111216,
            panelBuilder: (sc) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSwatch(
                    accentColor: AppColors.color191A1F,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 48,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppColors.colorD9D9D9,
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: <Widget>[
                          DeliverHere(
                              onTap: () async {
                                panelController.animatePanelToPosition(0);
                                MapModel? mapModel = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage(address: adress)));
                                if (mapModel != null) {
                                  adress = mapModel.name;
                                  lat = mapModel.lat;
                                  lon = mapModel.lon;
                                  _mapController.moveCamera(
                                    CameraUpdate.newCameraPosition(CameraPosition(
                                      target: Point(
                                        latitude: lat,
                                        longitude: lon,
                                      ),
                                      zoom: 14.4746,
                                    ),
                                    ),
                                  );
                                  setState(() {

                                  });
                                }
                          },
                            address: adress,
                            fromPage: widget.fromPage,
                          ),
                          MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.fromSwatch(
                                    accentColor: AppColors.color191A1F,
                                  ),
                                ),
                                child: ListView(
                                  physics: ClampingScrollPhysics(),
                                  children: <Widget>[
                                    const SizedBox(height: 12),
                                    RestaurantInfo(
                                      openInfo: DateTime.now().hour > 22 || DateTime.now().hour < 10 ? 'Откроется в 10:00' : 'Открыто до 22:00',
                                      color: DateTime.now().hour > 22 || DateTime.now().hour < 10
                                          ? Color(0xffFF3838)
                                          : Color(0xff32CD43),
                                      distance: '1,3 км',
                                      adress: 'Улица Свободы, 16',
                                      index: 0,
                                      onTap: () async {
                                        await _mapController.moveCamera(
                                          CameraUpdate.newCameraPosition(
                                            const CameraPosition(
                                                target: Point(
                                                    latitude: 57.625636,
                                                    longitude: 39.879540
                                                ),
                                                zoom: 15,
                                            ),
                                          ),
                                          animation: const MapAnimation(
                                            type: MapAnimationType.smooth,
                                            duration: 0.5,
                                          ),
                                        );
                                        latEnd = 57.625636;
                                        lonEnd = 39.879540;
                                        pageController.animateToPage(
                                          2,
                                          duration: const Duration(milliseconds: 200),
                                          curve: Curves.bounceIn,
                                        );
                                        setState(() {

                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            switchInCurve: Curves.easeInOut,
                            switchOutCurve: Curves.easeInOut,
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: !isFadeAnimated
                                ? ViewRestaurantWidget(
                              pageController: pageController,
                            )
                                : FullViewRestaurantWidget(
                              latEnd: latEnd,
                              lonEnd: lonEnd,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      );
  },
),
    );
  }
}
