import 'package:flutter/material.dart';
import '../../../../common_setup/routes.dart';
import '../../../../ui/close_circle_button.dart';
import '../../../../ui/primary_button.dart';
import '../../../../utils/app_colors.dart';
import '../../../pages/map_page.dart';

class ViewRestaurantWidget extends StatelessWidget {
  const ViewRestaurantWidget({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 27,
              ),
              Row(
                children: [
                  Container(
                    child: Flexible(
                      child: Text(
                        'Медвежий угол Свободы Ярославль',
                        style: TextStyle(
                          fontFamily: 'Unbounded',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  CloseCircleButton(
                    onTap: () => MapPage.pageController.animateToPage(
                      0,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    ),
                  ),
                ],
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
              PrimaryButton(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.menu);
                },
                color: AppColors.colorFFB627,
                child: Text(
                  'Посмотреть меню',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
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
}
