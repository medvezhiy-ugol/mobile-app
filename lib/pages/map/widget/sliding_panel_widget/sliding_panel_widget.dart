import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/ui/primary_button.dart';

import '../../../../services/theme_service.dart';
import '../../../../utils/app_colors.dart';
import '../../map_page.dart';

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
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                color: AppColors.color191A1F,
                child: TextField(
                  onTap: () {
                    MapPage.panelController.open();
                    print('${MapPage.pageController.page}');
                  },
                  cursorColor: AppColors.colorFFB627,
                  controller: controller,
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
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 39,
                      vertical: 20,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: 3,
                shrinkWrap: true,
                itemBuilder: (ctx, index) => listRestaurantInfo[index],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> listRestaurantInfo = [
    RestaurantInfo(
      openInfo: 'Открыто до 23:00',
      distance: '1,3 км',
      adress: 'Ул. Свободы, д. 46/3',
      index: 0,
      onTap: () {
        if (MapPage.panelController.isAttached) {
          MapPage.panelController.animatePanelToPosition(
            0,
            duration: const Duration(milliseconds: 300),
          );
        }
        MapPage.pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      },
    ),
    RestaurantInfo(
      openInfo: 'Откроется в 9:00',
      distance: '1,3 км',
      adress: 'Ул. Свободы, д. 46/3',
      index: 1,
      onTap: () {
        MapPage.pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceIn,
        );
      },
    ),
    RestaurantInfo(
      openInfo: 'Открыто до 23:00',
      distance: '1,3 км',
      adress: 'Ул. Свободы, д. 46/3',
      index: 2,
      onTap: () {
        MapPage.pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 200),
          curve: Curves.bounceIn,
        );
      },
    ),
  ];
}

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    super.key,
    required this.openInfo,
    required this.distance,
    required this.adress,
    required this.index,
    required this.onTap,
  });

  final String openInfo;
  final String distance;
  final String adress;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
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
                    '$openInfo',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.color32CD43,
                    ),
                  ),
                  Text(
                    ' - $distance',
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.colorEFEFEF,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                '$adress',
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
          ),
        ],
      ),
    );
  }
}
