import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/pages/menu/tabbar/menu_sections_widget.dart';
import 'package:medvezhiy_ugol/pages/menu/tabbar/scale_tabbar_module.dart';
import 'package:medvezhiy_ugol/pages/menu/toggle_switcher/toggle_switcher_widget.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../common_setup/routes.dart';
import '../../generated/l10n.dart';
import '../../utils/icons/toggle_switcher_icons_icons.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  late TabController tabController;
  late AutoScrollController listController;
  final scrollDirection = Axis.vertical;
  late List<List<int>> indexList;

  final int initialIndex = 0;
  final Color taBarBackgroundColor = AppColors.color111216;

  final maxCount = 4;

  int goIndex() {
    return 1;
  }

  void onAddressTap() {
    context.go(Routes.map);
  }

// customize
  final double menuSelectionHeight = 300 + 300 + 10 + 10;
  final int tabLengh = 4;

  final bool _isRunning = true;

  final List<Widget> tabs = <Widget>[
    Tab(
      text: S.current.menuScreenPizza, //'Пицца',
    ),
    Tab(
      text: S.current.menuScreenSushi, //'Суши',
    ),
    Tab(text: S.current.menuScreenSnacks //'Снеки',
        ),
    Tab(text: S.current.menuScreenDrinks //'Напитки',
        ),
  ];

  @override
  void initState() {
    tabController = TabController(
      initialIndex: initialIndex,
      length: tabs.length,
      vsync: this,
    );
    listController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection);
    getMenuSelectionPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            const ToggleSwitcher(),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
              onTap: onAddressTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ignore: prefer_const_constructors
                  Icon(
                    ToggleSwitcherIcons.vector,
                    size: 12,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Ул. Свободы, д. 46/3',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.colorEFEFEF,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      shape: const CircleBorder(),
                      child: InkWell(
                        onTap: onAddressTap,
                        customBorder: const CircleBorder(),
                        child: Ink(
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          height: 20,
                          width: 20,
                          child: const Icon(
                            Icons.chevron_right,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Material(
              color: taBarBackgroundColor,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.fromSwatch(
                      accentColor: AppColors.color191A1F,
                    ),
                  ),
                  child: ScaleTabBar(
                    onTap: (value) {
                      _scrollToCounter(value);
                      tabController.index = value;
                    },
                    controller: tabController,
                    tabs: tabs,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelStyle: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Unbounded',
                        fontWeight: FontWeight.w600),
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Unbounded',
                        fontWeight: FontWeight.w600),
                    unselectedLabelColor: Colors.grey,
                    overlayColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    indicator: ContainerTabIndicator(
                      height: 2,
                      radius: BorderRadius.circular(20),
                      color: AppColors.colorFF9900,
                      padding: const EdgeInsets.only(top: 19),
                    ),
                    // indicatorPadding: EdgeInsets.only(bottom: 4),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSwatch(
                    accentColor: AppColors.color191A1F,
                  ),
                ),
                child: ListView(
                  scrollDirection: scrollDirection,
                  controller: listController,
                  children: <Widget>[
                    ...List.generate(4, (index) {
                      return AutoScrollTag(
                        key: ValueKey(index),
                        controller: listController,
                        index: index,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 15,
                            ),
                            menuSections[index],
                          ],
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _scrollToCounter(int index) async {
    await listController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
  }

  void getMenuSelectionPosition() async {
    while (_isRunning) {
      if (listController.hasClients) {
        int tabSelectionChangeIndex = 0;
        double position = 0;

        position = listController.position.pixels;
        //for debug position
        //print('POSITION - ${position}');

        tabSelectionChangeIndex = (position / menuSelectionHeight).toInt();

        if (tabSelectionChangeIndex <= tabLengh - 1 &&
            !(tabController.indexIsChanging)) {
          tabController.animateTo(tabSelectionChangeIndex);
        }
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }
}
