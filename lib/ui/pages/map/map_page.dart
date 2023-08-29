import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medvezhiy_ugol/ui/map/sliding_panel_widget/full_view_restaurant_widget.dart';
import 'package:medvezhiy_ugol/ui/map/sliding_panel_widget/view_restaurant_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import '../../../utils/app_colors.dart';
import '../../primary_button.dart';
import '../../widgets/map/restaurant_info.dart';

class MapPage extends StatefulWidget {
  MapPage({super.key, required this.isOrder, required this.isDelivery});

  final bool isOrder;
  final bool isDelivery;

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
  bool isDeliver = true;
  bool isAddress = false;
  String adress = '';
  static final PageController pageController = PageController(initialPage: 0);
  static final PanelController panelController = PanelController();

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
  bool isCenter = false;

  void getPosition() async {
    Position position = await _determinePosition();
    lat = position.latitude;
    lon = position.longitude;
    _mapController.moveCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
        target: Point(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
        zoom: 14.4746,
      ),
      ),
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _minSlidingPanelHeight = MediaQuery.of(context).size.height * 0.4;
    final _maxSlidingPanelHeight = MediaQuery.of(context).size.height * 0.7;

    return Scaffold(
      body: Stack(
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
                    if (!isDeliver)
                      PlacemarkMapObject(
                        mapId: const MapObjectId('org_1'),
                        point: const Point(latitude: 57.693521, longitude: 39.772742),
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
                    if (isDeliver) {
                      lat = position.target.latitude;
                      lon = position.target.longitude;
                      final searchResult = YandexSearch.searchByPoint(
                        point: position.target,
                        zoom: 15,
                        searchOptions: const SearchOptions(
                          searchType: SearchType.geo,
                          geometry: false,
                        ),
                      );
                      final result = await searchResult.result;
                      adress = result.items!.first.name;
                      setState(() {
                      });
                    }
                  }
              )
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
            minHeight: _minSlidingPanelHeight,
            maxHeight: _maxSlidingPanelHeight,
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  height: 50,
                                  color: AppColors.color191A1F,
                                  child: TextField(
                                    cursorColor: AppColors.colorFFB627,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white
                                    ),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: AppColors.color808080,
                                        size: 30,
                                      ),
                                      filled: true,
                                      fillColor: AppColors.color191A1F,
                                      hintText: 'Название улицы или ресторана',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.color808080),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 39,
                                        vertical: 20,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
                                  builder: (context, state) {
                                    return state.adress.isEmpty
                                        ? Container()
                                        : Text(
                                      'Ваш адрес: ${state.adress}',
                                      style: const TextStyle(
                                          color: Colors.white
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 24),
                                PrimaryButton(
                                  onTap: () {
                                    panelController.open();
                                    //context.read<CustomNavbarCubit>().deliverHere(adress);
                                  },
                                  color: AppColors.colorFFB627,
                                  child: const Text(
                                    'Доставить сюда',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                const SizedBox(height: 12),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  height: 50,
                                  color: AppColors.color191A1F,
                                  child: TextField(
                                    cursorColor: AppColors.colorFFB627,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white
                                    ),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: AppColors.color808080,
                                        size: 30,
                                      ),
                                      filled: true,
                                      fillColor: AppColors.color191A1F,
                                      hintText: 'Название улицы или ресторана',
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.color808080),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 39,
                                        vertical: 20,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.transparent),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
                                  builder: (context, state) {
                                    return state.adress.isEmpty
                                        ? Container()
                                        : Text(
                                      'Ваш адрес: ${state.adress}',
                                      style: const TextStyle(
                                          color: Colors.white
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: 24),
                                PrimaryButton(
                                  onTap: () {
                                    context.read<CustomNavbarCubit>().deliverHere(adress);
                                  },
                                  color: AppColors.colorFFB627,
                                  child: const Text(
                                    'Доставить сюда',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
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
                                        if (panelController.isAttached) {
                                          panelController.animatePanelToPosition(
                                            0,
                                            duration: const Duration(milliseconds: 300),
                                          );
                                          await _mapController.moveCamera(
                                            CameraUpdate.newCameraPosition(
                                              CameraPosition(target: Point(latitude: 57.625636, longitude: 39.879540), zoom: 15),
                                            ),
                                            animation: MapAnimation(
                                              type: MapAnimationType.smooth,
                                              duration: 0.5,
                                            ),
                                          );
                                        }
                                        latEnd = 57.625636;
                                        lonEnd = 39.879540;
                                        isCenter = true;
                                        pageController.animateToPage(
                                          2,
                                          duration: const Duration(milliseconds: 200),
                                          curve: Curves.bounceIn,
                                        );
                                        setState(() {

                                        });
                                      },
                                    ),
                                    RestaurantInfo(
                                      openInfo: DateTime.now().hour > 23 || DateTime.now().hour < 11 ? 'Откроется в 11:00' : 'Открыто до 23:00',
                                      color: DateTime.now().hour > 23 || DateTime.now().hour < 11
                                          ? Color(0xffFF3838)
                                          : Color(0xff32CD43),
                                      distance: '1,3 км',
                                      adress: 'Ленинградский просп., 62',
                                      index: 1,
                                      onTap: () async {
                                        if (panelController.isAttached) {
                                          panelController.animatePanelToPosition(
                                            0,
                                            duration: const Duration(milliseconds: 300),
                                          );
                                        }
                                        await _mapController.moveCamera(
                                          CameraUpdate.newCameraPosition(
                                            CameraPosition(target: Point(
                                              latitude: 57.693521,
                                              longitude: 39.772742,
                                            ), zoom: 15),
                                          ),
                                          animation: MapAnimation(
                                            type: MapAnimationType.smooth,
                                            duration: 0.5,
                                          ),
                                        );
                                        latEnd = 57.693521;
                                        lonEnd = 39.772742;
                                        pageController.animateToPage(
                                          2,
                                          duration: const Duration(milliseconds: 300),
                                          curve: Curves.linear,
                                        );
                                        isCenter = false;
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
                              isCenter: isCenter,
                            )
                                : FullViewRestaurantWidget(
                              latEnd: latEnd,
                              lonEnd: lonEnd,
                              isCenter: isCenter,
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
          Positioned(
            top: 60,
            child: Column(
              children: [
                Container(
                  height: 38,
                  width: 240,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: const Color(0xff000000),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Stack(
                      fit: StackFit.expand,
                      children: [
                        AnimatedPositioned(
                          left: isDeliver ? 0 : 118,
                          duration: const Duration(milliseconds: 100),
                          child: Container(
                            height: 30,
                            width: 114,
                            decoration: BoxDecoration(
                                color: const Color(0xff2D2D2D),
                                borderRadius: BorderRadius.circular(30)
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            GestureDetector(onTap: () {
                              pageController.animateToPage(
                                0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                              getPosition();
                              isDeliver = true;
                              setState(() {

                              });
                            },
                              child: Container(
                                width: 114,
                                height: 30,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Доставка',
                                  style: TextStyle(
                                    fontFamily: 'Unbounded',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 4),
                            GestureDetector(onTap: () {
                              isDeliver  = false;
                              lat = 57.625636;
                              lon = 39.879540;
                              _mapController.moveCamera(
                                CameraUpdate.newCameraPosition(CameraPosition(
                                  target: Point(
                                    latitude: 57.625636,
                                    longitude: 39.879540,
                                  ),
                                  zoom: 14.4746,
                                ),
                                ),
                              );
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.bounceIn,
                              );
                              setState(() {

                              });
                            },
                              child: Container(
                                width: 114,
                                height: 30,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: const Text(
                                  'Самовывоз',
                                  style: TextStyle(
                                    fontFamily: 'Unbounded',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
                SizedBox(height: 34),
                Text(
                  adress,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 24,
                      color: Color(0xffEFEFEF),
                      fontFamily: 'Unbounded'
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
