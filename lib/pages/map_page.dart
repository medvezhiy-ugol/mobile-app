import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:medvezhiy_ugol/ui/map/sliding_panel_widget/full_view_restaurant_widget.dart';
import 'package:medvezhiy_ugol/ui/map/sliding_panel_widget/sliding_panel_widget.dart';
import 'package:medvezhiy_ugol/ui/map/sliding_panel_widget/view_restaurant_widget.dart';
import 'package:medvezhiy_ugol/ui/widgets/delivery_switcher.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../utils/app_colors.dart';

class MapPage extends StatefulWidget {
  MapPage({super.key});

  static final PageController pageController = PageController();
  static final PanelController panelController = PanelController();
  static bool fullViewIsVisible = true;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {

  late final YandexMapController _mapController;
  double lat = 0;
  double lon = 0;
  bool isLoading = true;

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

  @override
  void initState() {
    super.initState();
    getPosition();
  }

  void getPosition() async {
    Position position = await _determinePosition();
    lat = position.latitude;
    lon = position.longitude;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _minSlidingPanelHeight = MediaQuery.of(context).size.height * 0.35;
    final _maxSlidingPanelHeight = MediaQuery.of(context).size.height * 0.7;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : SizedBox(
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
                    // final result = await searchResult.result;
                  }
              )
          ),
          SlidingUpPanel(
            onPanelSlide: (double point) {
              isFadeAnimated = false;
              _isDraged = false;
              if ((MapPage.pageController.page == 1.0) &&
                  (!_isDraged == true) &&
                  (point > 0.0)) {
                setState(() {
                  isFadeAnimated = true;
                });
                _isDraged = true;
              }
              if ((MapPage.pageController.page == 1.0) &&
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
            controller: MapPage.panelController,
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
                        controller: MapPage.pageController,
                        children: <Widget>[
                          SlidingPanelWidget(),
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
                                ? ViewRestaurantWidget()
                                : FullViewRestaurantWidget(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const Positioned(
            top: 60,
            child: DeliverySwitcher(),
          ),
        ],
      ),
    );
  }
}
