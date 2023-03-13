import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/common_setup/routes.dart';
import 'package:medvezhiy_ugol/pages/main/more/more_page.dart';

import '../../utils/bottom_bar_icons.dart';
import '../menu/detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(_selectedIndex),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return TempPage();
      // case 1:
      //   return StocksPage();
      // case 2:
      //   return MenuPage();
      // case 3:
      //   return MapPage();
      default:
        return Container();
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
          onTap: (i) => setState(() {
            _selectedIndex = i;
          }),
          currentIndex: _selectedIndex,
        ),
      ),
    );
  }
}

//exapmle redirect to detail page
class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: InkWell(
          onTap: () {
            context.push(
              Uri(
                path: Routes.detail,
                queryParameters: {'id': '001'},
              ).toString(),
            );
          },
          child: Container(
            height: 80,
            color: Colors.blue,
            child: Center(child: Text('Detail page')),
          ),
        ),
      ),
    );
  }
}
