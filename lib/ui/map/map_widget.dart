import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../utils/app_assets.dart';

class MapWidget extends StatefulWidget {
  final double? height;
  static late YandexMapController mapController;
  static const List<Point> points = [
    Point(
      latitude: 57.693521,
      longitude: 39.772742,
    ),
    Point(latitude: 57.625636, longitude: 39.879540),
  ];
  static const animation = MapAnimation(
    type: MapAnimationType.linear,
    duration: 1.5,
  );

  MapWidget({
    Key? key,
    this.height,
  }) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  Widget build(BuildContext context) {
    final List<MapObject> mapObjects = [
      PlacemarkMapObject(
        mapId: MapObjectId('org_0'),
        point: MapWidget.points[0],
        opacity: 1,
        isDraggable: false,
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            scale: 0.7,
            image: BitmapDescriptor.fromAssetImage(A.assetsMapPagePointImg),
            rotationType: RotationType.noRotation,
            anchor: Offset(0.5, 1),
          ),
        ),
        onTap: (mapObject, point) async {
          // MapPage.pageController.animateToPage(
          //   1,
          //   duration: const Duration(milliseconds: 300),
          //   curve: Curves.linear,
          // );
          await MapWidget.mapController.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: point, zoom: 17),
            ),
            animation: MapWidget.animation,
          );
        },
      ),
      PlacemarkMapObject(
        mapId: MapObjectId('org_1'),
        point: MapWidget.points[1],
        opacity: 1,
        isDraggable: false,
        icon: PlacemarkIcon.single(
          PlacemarkIconStyle(
            scale: 0.7,
            image: BitmapDescriptor.fromAssetImage(A.assetsMapPagePointImg),
            rotationType: RotationType.noRotation,
            anchor: Offset(0.5, 1),
          ),
        ),
        onTap: (mapObject, point) async {
          // MapPage.pageController.animateToPage(
          //   1,
          //   duration: const Duration(milliseconds: 300),
          //   curve: Curves.linear,
          // );
          await MapWidget.mapController.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(target: point, zoom: 17),
            ),
            animation: MapWidget.animation,
          );
        },
      ),
    ];
    return YandexMap(
      mapObjects: mapObjects,
      nightModeEnabled: true,
      onMapCreated: (YandexMapController yandexMapController) async {
        MapWidget.mapController = yandexMapController;
        await MapWidget.mapController.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: MapWidget.points[1], zoom: 17),
          ),
        );
      },
    );
  }
}
