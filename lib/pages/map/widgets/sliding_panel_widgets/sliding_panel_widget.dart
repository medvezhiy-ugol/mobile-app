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
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                color: AppColors.color191A1F,
                child: TextField(
                  cursorColor: AppColors.colorFFB627,
                  controller: controller,
                  // ignore: prefer_const_constructors
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
        MapPage.pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: 50),
          curve: Curves.bounceIn,
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
          duration: const Duration(milliseconds: 50),
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
          duration: const Duration(milliseconds: 50),
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
              Text(
                '$openInfo - $distance',
                style: ThemeService.choiceRestaurantButtonTextStyle(),
              ),
              Spacer(),
              Text(
                '$adress',
                style: ThemeService.detailPageStatusBarItemCountTextStyle(),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            width: 75,
            child: PrimaryButton(
              onTap: () {},
              height: 28,
              child: Text(
                'Выбрать',
                style: ThemeService.choiceRestaurantButtonTextStyle(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
