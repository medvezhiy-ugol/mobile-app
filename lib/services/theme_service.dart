import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ThemeService {
  BottomNavigationBarThemeData bottomNavigationBarTheme() {
    return const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.color111216,
      unselectedItemColor: AppColors.color808080,
      selectedItemColor: AppColors.colorEFEFEF,
      unselectedLabelStyle: TextStyle(fontSize: 10),
      selectedLabelStyle: TextStyle(fontSize: 10),
      elevation: 0,
    );
  }

  static TextStyle detailPageTitleProductTextStyle() {
    return const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      fontFamily: 'Unbounded',
    );
  }
  static TextStyle detailPageAddButtonTextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle detailPageProductIngredientsTextStyle() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.color808080
    );
  }
  static TextStyle detailPageStatusBarItemTextStyle() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.color808080
    );
  }
  static TextStyle detailPageStatusBarItemCountTextStyle() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Colors.white
    );
  }
  static TextStyle tabBarCardWeightTextStyle() {
    return const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      color: AppColors.color808080
    );
  }
  static TextStyle tabBarCardIngrTextStyle() {
    return const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: AppColors.color808080
    );
  }
    static TextStyle tabBarTitleSectionTextStyle() {
    return const TextStyle(
       fontFamily: 'Unbounded',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.colorE3E3E3
    );
  }
}
