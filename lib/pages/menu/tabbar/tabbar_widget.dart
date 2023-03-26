import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/pages/menu/tabbar/scale_tabbar_module.dart';
import 'package:medvezhiy_ugol/utils/icons/toggle_switcher_icons_icons.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../services/theme_service.dart';
import '../../../utils/app_colors.dart';
import '../toggle_switcher.dart';
import 'menu_sections_widgets.dart';

class PrimaryTabBar extends StatefulWidget {
  final int initialIndex;
  final Color backgroundColor;
  final List<Widget> tabs;
  final VoidCallback onAddressTap;

  const PrimaryTabBar({
    super.key,
    this.initialIndex = 0,
    required this.backgroundColor,
    required this.tabs,
    required this.onAddressTap,
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
          SizedBox(
            height: 5,
          ),
          ToggleSwitcher(),
          SizedBox(
            height: 6,
          ),
          GestureDetector(
            onTap: widget.onAddressTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  ToggleSwitcherIcons.vector,
                  size: 12,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Ул. Свободы, д. 46/3',
                  style: ThemeService.addressButtonTextStyle(),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: () {
                        widget.onAddressTap;
                      },
                      customBorder: const CircleBorder(),
                      child: Ink(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        height: 20,
                        width: 20,
                        child: Icon(
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
          SizedBox(
            height: 10,
          ),
          Material(
            color: widget.backgroundColor,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
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
                          SizedBox(
                            height: 24,
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
    );
  }

  Future _scrollToCounter(int index) async {
    await listController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
  }

  void getMenuSelectionPosition() async {
    const double menuSelectionHeight = 300 + 300 + 10 + 10;
    const int tabLengh = 4;

    while (_isRunning) {
      if (listController.hasClients) {
        int tabSelectionChangeIndex = 0;
        double position = 0;

        position = listController.position.pixels;
        print('POSITION - ${position}');

        tabSelectionChangeIndex = (position / menuSelectionHeight).toInt();

        if (tabSelectionChangeIndex <= tabLengh - 1 &&
            !(tabController.indexIsChanging)) {
          tabController.animateTo(tabSelectionChangeIndex);
        }
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }

    @override
    void dispose() {
      _isRunning = false;
      super.dispose();
    }
  }
}
