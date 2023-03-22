import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/pages/menu/tabbar/tabbar_widget.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../generated/l10n.dart';

import '../../common_setup/routes.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PrimaryTabBar(
        backgroundColor: AppColors.color111216,
        tabs: tabs,
        onAddressTap: () {},
      ),
    );
  }

//Ne otnosyasheesya k auto scroll
  List<Widget> tabs = <Widget>[
    Tab(
      text: S.current.menuScreenPizza,//'Пицца',
    ),
    Tab(
      text: S.current.menuScreenSushi,//'Суши',
    ),
    Tab(
      text: S.current.menuScreenSnacks//'Снеки',
    ),
    Tab(
      text: S.current.menuScreenDrinks//'Напитки',
    ),
  ];
}
