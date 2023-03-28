import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/pages/menu/toggle_switcher/module/toggle_switcher_module.dart';

import 'package:medvezhiy_ugol/services/theme_service.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import '../../../generated/l10n.dart';

class ToggleSwitcher extends StatefulWidget {
  const ToggleSwitcher({super.key});

  @override
  State<ToggleSwitcher> createState() => _ToggleSwitcherState();
}

class _ToggleSwitcherState extends State<ToggleSwitcher> {
  final int _tabTextIndexSelected = 1;

  final List<String> _listTextTabToggle = [
    S.current.deliveryButtonText, //'Доставка',
    S.current.pickUpButtonText //'Самовывоз',
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
