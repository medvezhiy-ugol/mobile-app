import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/common_setup/routes.dart';
import 'package:medvezhiy_ugol/pages/home/home_page.dart';
import 'package:medvezhiy_ugol/pages/map/map_page.dart';
import 'package:medvezhiy_ugol/pages/menu/menu_page.dart';
import 'package:medvezhiy_ugol/pages/more/more_page.dart';
import 'package:medvezhiy_ugol/pages/stock/stock_page.dart';

import '../utils/bottom_bar_icons.dart';
import 'menu/detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = MainRoute.home.index;
  MainRoute _screen = MainRoute.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
        switch (index) {
          case 0:
            _screen = MainRoute.home;
            break;
          case 1:
            _screen = MainRoute.stock;
            break;
          case 2:
            _screen = MainRoute.menu;
            break;
          case 3:
            _screen = MainRoute.map;
            break;
          case 4:
            _screen = MainRoute.more;
            break;
        }
      },
    );
  }

  Widget _buildBody() {
    switch (_screen) {
      case MainRoute.home:
        return const HomePage();
      case MainRoute.stock:
        return const StockPage();
      case MainRoute.menu:
        return const MenuPage();
      case MainRoute.map:
        return const MapPage();
      case MainRoute.more:
        return const MorePage();
      default:
        return const HomePage();
    }
  }

  Widget _buildBottomNavigationBar() {
    return SafeArea(
      child: SizedBox(
        height: 76,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.main),
                ),
                label: 'Главная'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.stock),
                ),
                label: 'Акции'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.menu),
                ),
                label: 'Меню'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.map),
                ),
                label: 'Карта'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.more),
                ),
                label: 'Еще')
          ],
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}
