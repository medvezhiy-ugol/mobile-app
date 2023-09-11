import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/pages/discounts/discounts_page/discounts_page.dart';
import 'package:medvezhiy_ugol/ui/pages/map/map_page.dart';
import '../../utils/app_colors.dart';
import 'home/home_page.dart';
import 'menu/menu_page.dart';
import 'more/more_page.dart';
import '../../utils/icons/bottom_bar_icons.dart';

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

  bool isTitle = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .then((value) {
      isTitle = true;
      setState(() {});
    })
        .then((value) => Future.delayed(const Duration(seconds: 2))
        .then((value) {
      isLoading = false;
      setState(() {});
    }));
    context.read<CustomNavbarCubit>().getContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
      builder: (context, state) {
        return Stack(
          children: [
            WillPopScope(
                onWillPop: () async {
                  switch (state.index) {
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
                    body: BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
                      builder: (context, state) {
                        return Stack(
                            children: [
                              CupertinoTabView(
                                builder: (BuildContext context) {
                                  return BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
                                    buildWhen: (previous, current) => previous.index != current.index,
                                    builder: (context, state) {
                                      switch (state.index) {
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
                                              home: MapPage(
                                                isDelivery: false,
                                                isOrder: false,
                                              )
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
                                  );
                                },
                              ),
                              Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                      height: 80,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: Color(0xff111216),
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
                                                  if (state.index == 0) {
                                                    homeKey.currentState?.popUntil((route) => route.isFirst);
                                                  }
                                                  else {
                                                    context.read<CustomNavbarCubit>().changeIndex(0);
                                                  }
                                                },
                                                child: Icon(
                                                  BottomBarIcons.main,
                                                  color: Color(state.index == 0 ? 0xffEFEFEF : 0xff808080),
                                                )
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  if (state.index == 1) {
                                                    stocksKey.currentState?.popUntil((route) => route.isFirst);
                                                  }
                                                  else {
                                                    context.read<CustomNavbarCubit>().changeIndex(1);
                                                  }
                                                },
                                                child: Icon(
                                                  BottomBarIcons.stock,
                                                  color: Color(state.index == 1 ? 0xffEFEFEF : 0xff808080),
                                                )
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  if (state.index == 2) {
                                                    moreKey.currentState?.popUntil((route) => route.isFirst);
                                                  }
                                                  else {
                                                    context.read<CustomNavbarCubit>().changeIndex(2);
                                                  }
                                                },
                                                child: Icon(
                                                  BottomBarIcons.menu,
                                                  color: Color(state.index == 2 ? 0xffEFEFEF : 0xff808080),
                                                )
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                if (state.index == 3) {
                                                  mapKey.currentState?.popUntil((route) => route.isFirst);
                                                }
                                                else {
                                                  context.read<CustomNavbarCubit>().changeIndex(3);
                                                }
                                              },
                                              child: Icon(
                                                BottomBarIcons.map,
                                                color: Color(state.index == 3 ? 0xffEFEFEF : 0xff808080),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                if (state.index == 4) {
                                                  moreKey.currentState?.popUntil((route) => route.isFirst);
                                                }
                                                else {
                                                  context.read<CustomNavbarCubit>().changeIndex(4);
                                                }
                                              },
                                              child: Icon(
                                                BottomBarIcons.more,
                                                color: Color(state.index == 4 ? 0xffEFEFEF : 0xff808080),
                                              ),
                                            ),
                                          ]
                                      )
                                  )
                              )
                            ]
                        );
                      },
                    )
                )
            ),
            if (isLoading)
              Scaffold(
                  body: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          height: isTitle ? 146 : 256,
                          width: isTitle ? 146 : 256,
                          duration: const Duration(milliseconds: 500),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/images/logo_circle.png")
                              )
                          ),
                        ),
                        const SizedBox(height: 10),
                        AnimatedOpacity(
                          opacity: isTitle ? 1 : 0,
                          duration: Duration(milliseconds: 500),
                          child: const Text(
                            'Медвежий угол',
                            style: TextStyle(
                              fontFamily: 'Unbounded',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: AppColors.colorFFFFFF,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              )
          ],
        );
      },
    );
  }
}