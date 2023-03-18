import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/pages/menu/toggle_switcher/module_toggle_switcher.dart';


import 'package:medvezhiy_ugol/services/theme_service.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class ToggleSwitcher extends StatefulWidget {
  const ToggleSwitcher({super.key});

  @override
  State<ToggleSwitcher> createState() => _ToggleSwitcherState();
}

class _ToggleSwitcherState extends State<ToggleSwitcher> {
  int _tabTextIndexSelected = 1;

  List<String> _listTextTabToggle = [
    'Доставка',
    'Самовывоз',
  ];

  @override
  Widget build(BuildContext context) {
    return ToggleSwitcherWidget(
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
      selectedLabelIndex: (index) {},
      isScroll: false,
      isShadowEnable: false,
    );
  }
}
