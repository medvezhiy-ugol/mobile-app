import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/pages/map/widgets/map_widget.dart';
import 'package:medvezhiy_ugol/pages/map/widgets/sliding_panel_widgets/full_view_restaurant_widget.dart';
import 'package:medvezhiy_ugol/pages/map/widgets/sliding_panel_widgets/sliding_panel_widget.dart';
import 'package:medvezhiy_ugol/pages/map/widgets/sliding_panel_widgets/view_restaurant_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../utils/app_colors.dart';
import '../menu/toggle_switcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late PanelController panelController;

  bool _showRestFilter = true;
  bool _isRunning = true;

  @override
  void initState() {
    panelController = PanelController();
    isPanelAnimating();
    super.initState();
  }

  PanelController _pc = new PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            controller: _pc,
            color: AppColors.color111216,
            panelBuilder: (sc) {
              // return SlidingPanelWidget();
              // return ViewRestaurantWidget();
              return FullViewRestaurantWidget();
            },
            body: MapWidget(
              onTap: () {},
            ),
          ),
    
          // Positioned(
          //   bottom: 100,
          //   child: RestaurantFilter(),
          // ),
    
          Positioned(
            top: 50,
            right: 20,
            child: CrossButton(),
          ),
          Positioned(
            top: 80,
            child: ToggleSwitcher(),
          ),
        ],
      ),
    );
  }

  Widget CrossButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          // context.pop();
        },
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 24,
            height: 24,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: Colors.grey),
              child: const Icon(
                Icons.close,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget RestaurantFilter() {
    if (_showRestFilter) {
      return Container(
        height: 38,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
            width: 10,
          ),
          itemCount: 5,
          itemBuilder: (ctx, index) =>
              Container(height: 38, child: listRestaurantFilters[index]),
        ),
      );
    } else {
      return Container();
    }
  }

  List<Widget> listRestaurantFilters = [
    Container(
      color: Colors.red,
      child: Center(
        child: Text('Draiv'),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text('American'),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text('Psycho'),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text('Fight'),
      ),
    ),
    Container(
      color: Colors.red,
      child: Center(
        child: Text('Club'),
      ),
    ),
  ];

  void isPanelAnimating() async {
    // while (_isRunning) {
    //   try {
    //     if (_pc.isPanelAnimating) {
    //       _showRestFilter = false;
    //     }
    //   } catch (r) {
    //     await Future.delayed(const Duration(milliseconds: 50));
    //   }
    // }
  }

  @override
  void dispose() {
    _isRunning = false;
    super.dispose();
  }
}
