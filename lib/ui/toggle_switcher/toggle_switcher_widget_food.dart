import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import '../../services/theme_service.dart';
import 'module/toggle_switcher_module.dart';

class ToggleSwitcherFood extends StatefulWidget {
  const ToggleSwitcherFood({super.key});

  @override
  State<ToggleSwitcherFood> createState() => _ToggleSwitcherFoodState();
}

class _ToggleSwitcherFoodState extends State<ToggleSwitcherFood> {
  final int _tabTextIndexSelected = 1;

  final List<String> _listTextTabToggle = [
    'Целая',
    'Половина',
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: ToggleSwitcherWidget(
        width: 70,
        borderRadius: 30,
        height: 40,
        marginSelected: EdgeInsets.all(5),
        selectedIndex: _tabTextIndexSelected,
        selectedBackgroundColors: [AppColors.color2D2D2D],
        unSelectedBackgroundColors: [Colors.black],
        selectedTextStyle: ThemeService.selectedToggleSwitcherTextStyle(),
        unSelectedTextStyle: ThemeService.unselectedToggleSwitcherTextStyle(),
        labels: _listTextTabToggle,
        selectedLabelIndex: (index) {
          //delivery unavalible
          if (index == 0) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Доставка в данный момент недоступна',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.color111216,
                    fontSize: 15,
                  ),
                ),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        isScroll: false,
        isShadowEnable: false,
      ),
    );
  }
}
