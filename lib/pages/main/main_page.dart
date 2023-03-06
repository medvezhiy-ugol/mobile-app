import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/pages/main/more/more_page.dart';
import 'package:medvezhiy_ugol/pages/main/more/registated_profile_page.dart';

import '../../utils/bottom_bar_icons.dart';

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
      body: RegisteredPage(),//MorePage(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
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
