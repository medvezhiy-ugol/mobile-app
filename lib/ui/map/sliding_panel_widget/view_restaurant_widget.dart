import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import '../../../../ui/close_circle_button.dart';
import '../../../../ui/primary_button.dart';
import '../../../../utils/app_colors.dart';

class ViewRestaurantWidget extends StatelessWidget {
  const ViewRestaurantWidget({super.key, required this.pageController});

  final PageController pageController;

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
                    onTap: () => pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.linear,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                '150023, Ярославль, улица Свободы, 45',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                DateTime.now().hour > 22 || DateTime.now().hour < 10
                    ? 'Откроется в 10:00'
                    : 'Открыто до 22:00',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: DateTime.now().hour > 22 || DateTime.now().hour < 10
                        ? const Color(0xffFF3838)
                        : const Color(0xff32CD43)
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      color: AppColors.color26282F,
                      child: const Center(
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
              ),
              SizedBox(
                height: 22,
              ),
              PrimaryButton(
                onTap: () {
                  context.read<CustomNavbarCubit>().changeIndex(2);
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
}
