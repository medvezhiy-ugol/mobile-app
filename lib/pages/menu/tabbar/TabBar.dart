import 'package:flutter/material.dart';
import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:medvezhiy_ugol/pages/menu/tabbar/scale_tabbar.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

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

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: widget.initialIndex,
      length: widget.tabs.length,
      vsync: this,
    );
    listController = AutoScrollController(
      viewportBoundaryGetter: () => Rect.fromLTRB(
        0,
        0,
        0,
        MediaQuery.of(context).padding.bottom,
      ),
      axis: scrollDirection,
    );
  }

  @override
  Widget build(BuildContext context) {
    int activeTabIndex = 0;
    final int length = widget.tabs.length;

    return Column(
      children: [
        Material(
          color: widget.backgroundColor,
          child: Container(
            padding: const EdgeInsets.only(left: 20),
            child: ScaleTabBar(
              onTap: (value) {
                activeTabIndex = value;
                // tabController.index = 2;
                print(activeTabIndex);
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
                color: Colors.white,
                padding: const EdgeInsets.only(top: 19),
              ),
              // indicatorPadding: EdgeInsets.only(bottom: 4),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}
