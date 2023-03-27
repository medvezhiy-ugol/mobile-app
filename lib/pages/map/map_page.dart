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
  static PageController pageController = PageController();
  static final PanelController panelController = PanelController();

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // bool _showRestFilter = true;
  // bool _isRunning = true;

  bool _isDrag = false;

  @override
  Widget build(BuildContext context) {
    final _minSlidingPanelHeight = MediaQuery.of(context).size.height * 0.35;
    final _maxSlidingPanelHeight = MediaQuery.of(context).size.height * 0.7;
    final _mapHeight = MediaQuery.of(context).size.height - _minSlidingPanelHeight - MainPage.navBarHeight;

    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        SizedBox(
          height: _mapHeight,
          child: MapWidget(),
        ),
        SlidingUpPanel(
          onPanelSlide: (double point) {
            setState(() {
              _isDrag = false;
              if ((!_isDrag == true) &&
                  MapPage.pageController.page == 1.0 &&
                  point > 0.5) {
                MapPage.pageController.animateToPage(
                  2,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
                _isDrag = true;
              }
              if ((!_isDrag == true) &&
                  MapPage.pageController.page == 2.0 &&
                  point < 0.5) {
                MapPage.pageController.animateToPage(
                  1,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
                _isDrag = true;
              }
            });
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
                        ViewRestaurantWidget(),
                        FullViewRestaurantWidget(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        const Positioned(
          top: 80,
          child: ToggleSwitcher(),
        ),
      ],
    );
  }
}
