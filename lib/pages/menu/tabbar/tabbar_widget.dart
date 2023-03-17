import 'package:flutter/material.dart';
import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:medvezhiy_ugol/pages/menu/tabbar/menu_card_widget.dart';
import 'package:medvezhiy_ugol/pages/menu/tabbar/scale_tabbar_module.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'dart:math' as math;

import '../../../utils/app_colors.dart';
import 'menu_sections_widgets.dart';

class PrimaryTabBar extends StatefulWidget {
  final int initialIndex;
  final Color backgroundColor;
  final List<Widget> tabs;
  final List<Widget> pages;
  const PrimaryTabBar({
    super.key,
    this.initialIndex = 0,
    required this.backgroundColor,
    required this.tabs,
    required this.pages,
  });

  @override
  State<PrimaryTabBar> createState() => _PrimaryTabBarState();
}

class _PrimaryTabBarState extends State<PrimaryTabBar>
    with TickerProviderStateMixin {
  late TabController tabController;
  final scrollDirection = Axis.vertical;
  late AutoScrollController listController;
  late List<List<int>> indexList;
  final maxCount = 4;

  bool _isRunning = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: widget.initialIndex,
      length: widget.tabs.length,
      vsync: this,
    );
    listController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    );
    getMenuSelectionPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Material(
            color: widget.backgroundColor,
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: ScaleTabBar(
                onTap: (value) {
                  _scrollToCounter(value);
                  tabController.index = value;
                },
                controller: tabController,
                tabs: widget.tabs,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle:
                    const TextStyle(fontSize: 24, fontFamily: 'Unbounded'),
                unselectedLabelStyle:
                    const TextStyle(fontSize: 16, fontFamily: 'Unbounded'),
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
          Expanded(
            child: ListView(
              scrollDirection: scrollDirection,
              controller: listController,
              children: <Widget>[
                ...List.generate(4, (index) {
                  return AutoScrollTag(
                    key: ValueKey(index),
                    controller: listController,
                    index: index,
                    child: menuSections[index],
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Future _scrollToCounter(int index) async {
    await listController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
  }

  void getMenuSelectionPosition() async {
    const double menuSelectionHeight = 300;
    const int tabLengh = 3;

    while (_isRunning) {
      if (listController.hasClients) {
        int tabSelectionChangeIndex = 0;
        double position = 0;

        position = listController.position.pixels;
        print('POSITION - ${position}');

        tabSelectionChangeIndex = (position / menuSelectionHeight).toInt();

        if (tabSelectionChangeIndex <= tabLengh &&
            !(tabController.indexIsChanging)) {
          tabController.animateTo(tabSelectionChangeIndex);
        }
      }
      await Future.delayed(const Duration(milliseconds: 100));
    }

    @override
    void dispose() {
      _isRunning = false;
      super.dispose();
    }
  }
}
