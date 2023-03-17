import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/pages/menu/tabbar/tabbar_widget.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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
        backgroundColor:AppColors.color111216,
        tabs: tabs,
        pages: pages,
      ),
    );
  }

//Ne otnosyasheesya k auto scroll
  List<Widget> tabs = <Widget>[
    const Tab(
      text: 'Пицца',
    ),
    const Tab(
      text: 'Суши',
    ),
    const Tab(
      text: 'Снеки',
    ),
    const Tab(
      text: 'Напитки',
    ),
  ];

  List<Widget> pages = <Widget>[
    Container(
        color: Colors.black.withOpacity(0.9),
        child: GridView.count(
            childAspectRatio: 0.7,
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            children:
                List.generate(10, (index) => Container(color: Colors.red)))),
    GridView.count(
        childAspectRatio: 0.7,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: List.generate(10, (index) => Container(color: Colors.red))),
    GridView.count(
        childAspectRatio: 0.7,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: List.generate(10, (index) => Container(color: Colors.red))),
    GridView.count(
        childAspectRatio: 0.7,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: List.generate(10, (index) => Container(color: Colors.red)))
  ];

}