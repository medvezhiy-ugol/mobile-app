import 'package:flutter/material.dart';

import '../../../../services/theme_service.dart';
import '../../../../utils/app_colors.dart';

class SlidingPanelWidget extends StatelessWidget {
  SlidingPanelWidget({super.key});

  final TextEditingController controller = TextEditingController();

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
                    prefixIcon: Icon(Icons.search, color: AppColors.color808080, size: 30,),
                    filled: true,
                    fillColor: AppColors.color191A1F,
                    hintText: 'Название улицы или ресторана',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.color808080
                    ),
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
                // Row(
                //   children: [
                //     Icon(
                //       Icons.search,
                //     ),
                //     SizedBox(
                //       width: 10,
                //     ),
                //     Text('Название улицы или ресторана'),
                //   ],
                // ),
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
    ),
    RestaurantInfo(
      openInfo: 'Откроется в 9:00',
      distance: '1,3 км',
      adress: 'Ул. Свободы, д. 46/3',
      index: 1,
    ),
    RestaurantInfo(
      openInfo: 'Открыто до 23:00',
      distance: '1,3 км',
      adress: 'Ул. Свободы, д. 46/3',
      index: 2,
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
  });

  final String openInfo;
  final String distance;
  final String adress;
  final int index;

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
          Container(
            color: AppColors.color26282F,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  print('is tapped');
                  // _selectedRestaurant = index;
                },
                child: Container(
                  width: 75,
                  height: 28,
                  child: Center(
                    child: Text(
                      'Выбрать',
                      style: ThemeService.choiceRestaurantButtonTextStyle(),
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
