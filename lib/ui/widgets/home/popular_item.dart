import 'package:flutter/material.dart';

import '../../../services/theme_service.dart';
import '../../../utils/app_colors.dart';

class PopularItem extends StatelessWidget {
  const PopularItem({
    super.key,
    required this.srcImg,
    required this.name,
    required this.gram,
    required this.description,
    required this.price,
    required this.isBadge,
  });

  final String srcImg;
  final String name;
  final String gram;
  final String description;
  final int price;
  final bool isBadge;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 315,
        decoration: const BoxDecoration(
          color: AppColors.color191A1F,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              srcImg,
              fit: BoxFit.fitWidth,
            ),
            Container(
              height: 168,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    name,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeService.detailPageAddButtonTextStyle(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '$gram г.',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeService.tabBarCardIngrTextStyle(),
                  ),
                  const Spacer(),
                  Text(
                    description == ''
                        ? 'Состав отсутствует'
                        : description,
                    maxLines: 2,
                    //overflow: TextOverflow.ellipsis,
                    style: ThemeService.tabBarCardIngrTextStyle(),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 74,
                    height: 30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.color26282F,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      '$price ₽',
                      style: ThemeService
                          .detailPageStatusBarItemCountTextStyle(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
