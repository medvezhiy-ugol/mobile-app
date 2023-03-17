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
}
