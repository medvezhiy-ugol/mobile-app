import 'package:flutter/material.dart';
import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:medvezhiy_ugol/pages/menu/tabbar/scale_tabbar.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'dart:math' as math;

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

  final GlobalKey _cardKey = GlobalKey();
  Size? cardSize;
  Offset? cardPosition;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        initialIndex: widget.initialIndex,
        length: widget.tabs.length,
        vsync: this);
    listController = AutoScrollController(
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: scrollDirection); // indexList =
  WidgetsBinding.instance.addPostFrameCallback((_) => getSizeAndPosition());
  
  }

  getSizeAndPosition() {
    // RenderObject? _cardBox = _cardKey.currentContext!.findRenderObject();
    // cardSize = _cardBox;
    // cardPosition = _cardBox?.localToGlobal(Offset.zero);
    // print(cardSize);
    // print(cardPosition);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int activeTabIndex = 0;
    final int length = widget.tabs.length;
    final maxCount = 20;

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _scrollToCounter(4),
      //   child: Icon(Icons.accessible_rounded),
      // ),
      body: Column(
        children: [
          Material(
            color: widget.backgroundColor,
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: ScaleTabBar(
                onTap: (value) {
                  // activeTabIndex = listController.;
                  _scrollToCounter(value);
                  // tabController.index = value;
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
            child: ListView(
              scrollDirection: scrollDirection,
              controller: listController,
              children: <Widget>[
                ...List.generate(maxCount, (index) {
                  return AutoScrollTag(
                    key: ValueKey(index),
                    controller: listController,
                    index: index,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 100,
                        color: Colors.red,
                        child: Center(child: Text('$index')),
                      ),
                    ),
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
}

class _Card extends StatelessWidget {
  const _Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.red,
    );
  }
}
