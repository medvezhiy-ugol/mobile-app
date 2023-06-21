import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/pages/discounts/discounts_page/discounts_page.dart';
import 'package:medvezhiy_ugol/pages/map/map_page/map_page.dart';

import '../pages/home/home_page/home_page.dart';
import '../pages/menu/menu_page/menu_page.dart';
import '../pages/more/more_page.dart';
import '../utils/icons/bottom_bar_icons.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  final GlobalKey<NavigatorState> homeKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> stocksKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> menuKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> mapKey = GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> moreKey = GlobalKey<NavigatorState>();
  
  bool isLoading = false;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          switch (_currentIndex) {
            case 0:
              if (homeKey.currentState!.canPop()) {
                homeKey.currentState?.pop();
              }
              break;
            case 1:
              if (stocksKey.currentState!.canPop()) {
                stocksKey.currentState?.pop();
              }
              break;
            case 2:
              if (menuKey.currentState!.canPop()) {
                menuKey.currentState?.pop();
              }
              break;
            case 3:
              if (mapKey.currentState!.canPop()) {
                mapKey.currentState?.pop();
              }
              break;
            case 4:
              if (moreKey.currentState!.canPop()) {
                moreKey.currentState?.pop();
              }
              break;
          }
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.grey,
            body: Stack(
                children: [
                  CupertinoTabView(
                    builder: (BuildContext context) {
                      switch (_currentIndex) {
                        case 0:
                          return MaterialApp(
                            navigatorKey: homeKey,
                            home: const HomePage(),
                          );
                        case 1:
                          return MaterialApp(
                              navigatorKey: stocksKey,
                              home: StockPage()
                          );
                        case 2:
                          return MaterialApp(
                              navigatorKey: menuKey,
                              home: const MenuPage()
                          );
                        case 3:
                          return MaterialApp(
                              navigatorKey: mapKey,
                              home: MapPage()
                          );
                        case 4:
                          return MaterialApp(
                              navigatorKey: moreKey,
                              home: MorePage()
                          );
                        default:
                          return Container();
                      }
                    },
                  ),
                  Positioned(
                    bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                      height: 80,
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(4, 0),
                                blurRadius: 40,
                                color: Colors.black.withOpacity(0.05)
                            )
                          ]
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  if (_currentIndex == 0) {
                                    homeKey.currentState?.popUntil((route) => route.isFirst);
                                  }
                                  else {
                                    _currentIndex = 0;
                                    setState(() {

                                    });
                                  }
                                },
                                child: const Icon(
                                    BottomBarIcons.main,
                                  color: Color(0xffEFEFEF),
                                )
                            ),
                            GestureDetector(
                                onTap: () {
                                  if (_currentIndex == 1) {
                                    stocksKey.currentState?.popUntil((route) => route.isFirst);
                                  }
                                  else {
                                    _currentIndex = 1;
                                    setState(() {

                                    });
                                  }
                                },
                                child: const Icon(
                                    BottomBarIcons.stock,
                                  color: Color(0xffEFEFEF),
                                )
                            ),
                            GestureDetector(
                                onTap: () {
                                  if (_currentIndex == 2) {
                                    moreKey.currentState?.popUntil((route) => route.isFirst);
                                  }
                                  else {
                                    _currentIndex = 2;
                                    setState(() {

                                    });
                                  }
                                },
                                child: const Icon(
                                    BottomBarIcons.menu,
                                  color: Color(0xffEFEFEF),
                                )
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_currentIndex == 3) {
                                  mapKey.currentState?.popUntil((route) => route.isFirst);
                                }
                                else {
                                  _currentIndex = 3;
                                  setState(() {

                                  });
                                }
                              },
                              child: const Icon(
                                BottomBarIcons.map,
                                color: Color(0xffEFEFEF),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_currentIndex == 4) {
                                  moreKey.currentState?.popUntil((route) => route.isFirst);
                                }
                                else {
                                  _currentIndex = 4;
                                  setState(() {

                                  });
                                }
                              },
                              child: const Icon(
                                BottomBarIcons.more,
                                color: Color(0xffEFEFEF),
                              ),
                            ),
                          ]
                      )
                  )
                  )
                ]
            )
        )
    );
  }
}