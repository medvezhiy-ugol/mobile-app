import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import '../../../common_setup/routes.dart';
import '../../../services/theme_service.dart';

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({
    super.key,
    this.id = 0,
    required this.onTap,
  });

  final int id;
  final VoidCallback onTap;

  final String title = 'Донер c курицей';
  final String weight = '300';
  final String coast = '220';
  final String ingredients =
      'куриное бедро, помидор, огурец, айсберг, кинза, базилик, соус на выбор';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.color191A1F,
      ),
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Image.network(
                'https://www.crushpixel.com/big-static14/preview4/doner-kebab-on-wooden-table-1746165.jpg',
                height: 125,
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 6),
                child: Column(
                  children: [
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$title',
                        style: ThemeService.detailPageAddButtonTextStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '$weight г.',
                        style: ThemeService.tabBarCardWeightTextStyle(),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              ingredients,
                              style: ThemeService.tabBarCardIngrTextStyle(),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 74,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.color26282F,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          '$coast ₽',
                          style: ThemeService
                              .detailPageStatusBarItemCountTextStyle(),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  context.pushNamed(
                    Routes.detailMenuName,
                    params: {'id': '2'},
                  );
                  onTap;
                  print('REaLLY WORK');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NetworkImg extends StatelessWidget {
  const NetworkImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://img.freepik.com/free-photo/side-view-chicken-roll-grilled-chicken-lettuce-cucumber-tomato-and-mayo-in-pita_141793-4849.jpg',
      height: 125,
      fit: BoxFit.fill,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const Placeholder();
      },
    );
  }
}
