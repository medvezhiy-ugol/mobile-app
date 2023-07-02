import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common_setup/routes.dart';
import '../utils/icons/bottom_bar_icons.dart';

import 'home/home_page/home_page.dart';
import 'more/auth/bloc/more_bloc.dart';

class MainPage extends StatefulWidget {

  static const double navBarHeight = 76.0;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MoreBloc(),
          ),
        ],
        child: HomePage(),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  void _onItemTapped(BuildContext context, MenuRoute menuRoute) {
    if (menuRoute.index != _currentIndex) {
      Navigator.of(context).pushNamed(menuRoute.path);
    }
  }

  Widget _buildBottomNavigationBar() {
    return SafeArea(
      child: SizedBox(
        height: MainPage.navBarHeight,
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.main),
                ),
                label: "Главная",
              ), //'Главная'
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.stock),
                ),
                label: "Акции",
              ), //'Акции'
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.menu),
                ),
                label: "Меню",
              ), //'Меню'
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(
                    BottomBarIcons.map,
                  ),
                ),
                label: "Карта",
              ), //'Карта'
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(
                    BottomBarIcons.more,
                  ),
                ),
                label: "Еще",
              ) // 'Еще'
            ],
            onTap: (index) => _onItemTapped(context, MenuRoute.values[index]),
            currentIndex: _currentIndex,
            selectedItemColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
