import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/ui/map/map_widget.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../services/theme_service.dart';
import '../../../utils/app_colors.dart';
import '../../../pages/map_page.dart';

class SlidingPanelWidget extends StatefulWidget {
  const SlidingPanelWidget({super.key});
  @override
  State<SlidingPanelWidget> createState() => _SlidingPanelWidgetState();
}

class _SlidingPanelWidgetState extends State<SlidingPanelWidget> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
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
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                color: AppColors.color191A1F,
                child: TextField(
                  onTap: () {
                    MapPage.panelController.open();
                  },
                  cursorColor: AppColors.colorFFB627,
                  controller: controller,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                  decoration: const InputDecoration(
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
              const SizedBox(height: 12),
              RestaurantInfo(
                openInfo: DateTime.now().hour > 23 ? 'Откроется в 10:00' : 'Открыто с 10:00 до 23:00',
                color: DateTime.now().hour > 23 ? const Color(0xffFF3838) : const Color(0xff32CD43),
                distance: '1,3 км',
                adress: 'Улица Свободы, 16',
                index: 0,
                onTap: () async {
                  if (MapPage.panelController.isAttached) {
                    MapPage.panelController.animatePanelToPosition(
                      0,
                      duration: const Duration(milliseconds: 300),
                    );
                    await MapWidget.mapController.moveCamera(
                      CameraUpdate.newCameraPosition(
                        CameraPosition(target: MapWidget.points[1], zoom: 15),
                      ),
                      animation: animation,
                    );
                  }
                  MapPage.pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.bounceIn,
                  );
                },
              ),
              RestaurantInfo(
                openInfo: DateTime.now().hour > 22 ? 'Откроется в 9:00' : 'Открыто с 9:00 до 22:00',
                color: DateTime.now().hour > 22 ? const Color(0xffFF3838) : const Color(0xff32CD43),
                distance: '1,3 км',
                adress: 'Ленинградский просп., 62',
                index: 1,
                onTap: () async {
                  if (MapPage.panelController.isAttached) {
                    MapPage.panelController.animatePanelToPosition(
                      0,
                      duration: const Duration(milliseconds: 300),
                    );
                  }
                  await MapWidget.mapController.moveCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(target: MapWidget.points[0], zoom: 15),
                    ),
                    animation: animation,
                  );

                  MapPage.pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  static const animation = MapAnimation(
    type: MapAnimationType.smooth,
    duration: 0.5,
  );
}

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    super.key,
    required this.openInfo,
    required this.distance,
    required this.adress,
    required this.index,
    required this.onTap,
    required this.color,
  });
  final Color color;
  final String openInfo;
  final String distance;
  final String adress;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 68,
      color: AppColors.color191A1F,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    openInfo,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: color,
                    ),
                  ),
                  // Text(
                  //   ' - $distance',
                  //   style: const TextStyle(
                  //     fontSize: 10,
                  //     fontWeight: FontWeight.w400,
                  //     color: AppColors.colorEFEFEF,
                  //   ),
                  // ),
                ],
              ),
              Spacer(),
              Text(
                adress,
                style: ThemeService.detailPageStatusBarItemCountTextStyle(),
              ),
            ],
          ),
          Spacer(),
          Container(
            color: AppColors.color26282F,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  width: 75,
                  height: 28,
                  child: Center(
                    child: Text(
                      'Выбрать',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorEFEFEF,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
