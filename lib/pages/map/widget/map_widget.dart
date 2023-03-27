
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../../utils/app_assets.dart';

class MapWidget extends StatefulWidget {
  final double? height;
  final double latitude;
  final double longitude;

  const MapWidget({
    Key? key,
    this.height,
    this.latitude = 57.693521,
    this.longitude = 39.772742,
  }) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late YandexMapController controller;

  final List<MapObject> mapObjects = [];

  final animation = MapAnimation(type: MapAnimationType.smooth, duration: 1.5);

  @override
  Widget build(BuildContext context) {
    final Point point = Point(
      latitude: widget.latitude,
      longitude: widget.longitude,
    );

    final MapObject mapObject = PlacemarkMapObject(
      mapId: MapObjectId('normal_icon_placemark'),
      point: point,
      opacity: 1,
      direction: 90,
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
        print(point);
        await controller.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: point, zoom: 16),
          ),
          animation: animation,
        );
      },
    );
    return YandexMap(
      mapObjects: mapObjects,
      nightModeEnabled: true,
      onMapCreated: (YandexMapController yandexMapController) async {
        controller = yandexMapController;
        await controller.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: point, zoom: 17),
          ),
        );
        setState(
          () {
            mapObjects.add(mapObject);
          },
        );
      },
    );
  }
}
