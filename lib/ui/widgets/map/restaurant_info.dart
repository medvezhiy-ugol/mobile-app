import 'package:flutter/material.dart';

import '../../../services/theme_service.dart';
import '../../../utils/app_colors.dart';

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    super.key,
    required this.openInfo,
    required this.distance,
    required this.adress,
    required this.index,
    required this.onTap,
    required this.color,
  });
  final Color color;
  final String openInfo;
  final String distance;
  final String adress;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 68,
      color: AppColors.color191A1F,
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                openInfo,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: color,
                ),
              ),
              Spacer(),
              Text(
                adress,
                style: ThemeService.detailPageStatusBarItemCountTextStyle(),
              ),
            ],
          ),
          Spacer(),
          Container(
            color: AppColors.color26282F,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  width: 75,
                  height: 28,
                  child: Center(
                    child: Text(
                      'Выбрать',
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: AppColors.colorEFEFEF,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}