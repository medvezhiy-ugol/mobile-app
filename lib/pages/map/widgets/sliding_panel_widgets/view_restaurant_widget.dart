import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class ViewRestaurantWidget extends StatelessWidget {
  ViewRestaurantWidget({super.key});

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
                height: 27,
              ),
              Text(
                'Медвежий угол Свободы Ярославль',
                style: TextStyle(
                  fontFamily: 'Unbounded',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '1,3 км - 150023, Ярославль, улица Свободы, 45',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Открыто до 23:00',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color32CD43,
                ),
              ),
              SizedBox(
                height: 22,
              ),
              RestaurantAttributes(),
              SizedBox(
                height: 22,
              ),
              PrimaryButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget RestaurantAttributes() {
    return Container(
      height: 30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: AppColors.color26282F,
            child: Center(
              child: Text(
                'Есть завтрак',
                style: TextStyle(
                  fontFamily: 'Unbounded',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: AppColors.color26282F,
            child: Center(
              child: Text(
                'Драйв',
                style: TextStyle(
                  fontFamily: 'Unbounded',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget PrimaryButton() {
    return Container(
      height: 50,
      color: AppColors.colorFFB627,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            //GO TO MENU
          },
          child: Container(
            child: Center(
              child: Text(
                'Посмотреть меню',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}