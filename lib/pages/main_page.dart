import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/pages/menu/bloc/menu_bloc.dart';
import 'package:medvezhiy_ugol/services/menu_service.dart';
import '../generated/l10n.dart';

import '../common_setup/routes.dart';
import '../utils/icons/bottom_bar_icons.dart';
import 'more/bloc/more_bloc.dart';

class MainPage extends StatefulWidget {
  final Widget child;
  final String location;

  const MainPage({required this.child, required this.location, super.key});

  static const double navBarHeight = 76.0;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int get _currentIndex => MenuRoute.values
      .firstWhere((e) => widget.location.contains(e.path))
      .index;

  final MenuService menuService = Injector().get<MenuService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MoreBloc(),
          ),
          BlocProvider(
            create: (context) => MenuBloc(menuService: menuService),
          )
        ],
        child: widget.child,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  void _onItemTapped(BuildContext context, MenuRoute menuRoute) {
    if (menuRoute.index != _currentIndex) {
      context.go(menuRoute.path);
    }
  }

  Widget _buildBottomNavigationBar() {
    return SafeArea(
      child: SizedBox(
        height: MainPage.navBarHeight,
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.main),
                ),
                label: S.current.bottomBarMainText), //'Главная'
            BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.stock),
                ),
                label: S.current.bottomBarStockText), //'Акции'
            BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.menu),
                ),
                label: S.current.bottomBarMenuText), //'Меню'
            BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.map),
                ),
                label: S.current.bottomBarMapText), //'Карта'
            BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(bottom: 6),
                  child: Icon(BottomBarIcons.more),
                ),
                label: S.current.bottomBarMoreText) // 'Еще'
          ],
          onTap: (index) => _onItemTapped(context, MenuRoute.values[index]),
          currentIndex: _currentIndex,
        ),
      ),
    );
  }
}
