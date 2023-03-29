import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/pages/map/widget/map_widget.dart';
import 'package:medvezhiy_ugol/pages/map/widget/sliding_panel_widget/full_view_restaurant_widget.dart';
import 'package:medvezhiy_ugol/pages/map/widget/sliding_panel_widget/sliding_panel_widget.dart';
import 'package:medvezhiy_ugol/pages/map/widget/sliding_panel_widget/view_restaurant_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../utils/app_colors.dart';
import '../main_page.dart';
import '../menu/toggle_switcher/toggle_switcher_widget.dart';

class MapPage extends StatefulWidget {
  MapPage({super.key});
  static final PageController pageController = PageController();
  static final PanelController panelController = PanelController();
  static bool fullViewIsVisible = true;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  // bool _showRestFilter = true;
  // bool _isRunning = true;

  bool _isDraged = false;
  bool isFadeAnimated = false;

  @override
  Widget build(BuildContext context) {
    final _minSlidingPanelHeight = MediaQuery.of(context).size.height * 0.35;
    final _maxSlidingPanelHeight = MediaQuery.of(context).size.height * 0.7;

    final _mapHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        MainPage.navBarHeight -
        _minSlidingPanelHeight;

//BETA
    int currentFadeIndex = 0;
    late final AnimationController _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    late final Animation<double> _animation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);

    return SafeArea(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SizedBox(
            height: _mapHeight,
            child: MapWidget(),
          ),
          SlidingUpPanel(
            onPanelSlide: (double point) {
              isFadeAnimated = false;
              _isDraged = false;
              if ((MapPage.pageController.page == 1.0) &&
                  (!_isDraged == true) &&
                  (point > 0.0)) {
                setState(() {
                  isFadeAnimated = true;
                });
                _isDraged = true;
              }
              if ((MapPage.pageController.page == 1.0) &&
                  (_isDraged == true) &&
                  (point < 0.3)) {
                setState(() {
                  isFadeAnimated = false;
                });
              }
            },
            defaultPanelState: PanelState.CLOSED,
            minHeight: _minSlidingPanelHeight,
            maxHeight: _maxSlidingPanelHeight,
            controller: MapPage.panelController,
            color: AppColors.color111216,
            panelBuilder: (sc) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.fromSwatch(
                    accentColor: AppColors.color191A1F,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 48,
                          height: 4,
                          decoration: BoxDecoration(
                            color: AppColors.colorD9D9D9,
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: MapPage.pageController,
                        children: <Widget>[
                          SlidingPanelWidget(),
                          AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            switchInCurve: Curves.easeInOut,
                            switchOutCurve: Curves.easeInOut,
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: !isFadeAnimated
                                ? ViewRestaurantWidget()
                                : FullViewRestaurantWidget(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const Positioned(
            top: 30,
            child: ToggleSwitcher(),
          ),
        ],
      ),
    );
  }
}
