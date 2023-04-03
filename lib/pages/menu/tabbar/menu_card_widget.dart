import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/models/menu.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import '../../../services/theme_service.dart';

class MenuCardWidget extends StatelessWidget {
  final MenuProduct menuProduct;
  final VoidCallback onTap;

  const MenuCardWidget({
    super.key,
    required this.onTap,
    required this.menuProduct,
  });

  @override
  Widget build(BuildContext context) {
    print(menuProduct.itemSizes.first.buttonImageUrl);
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.color191A1F,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                child: _buildCachedImg(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 6),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        menuProduct.name,
                        style: ThemeService.detailPageAddButtonTextStyle(),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${menuProduct.itemSizes.first.portionWeightGrams} г.',
                        style: ThemeService.tabBarCardWeightTextStyle(),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            menuProduct.description == ''
                                ? 'Описание отсутствует'
                                : menuProduct.description,
                            style: ThemeService.tabBarCardIngrTextStyle(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
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
                          '${menuProduct.itemSizes.first.prices.first.price.toInt()} ₽',
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
        ),
      ),
    );
  }

  Widget _buildCachedImg() {
    if (menuProduct.itemSizes.first.buttonImageUrl != null) {
      return CachedNetworkImage(
        imageUrl: menuProduct.itemSizes.first.buttonImageUrl ?? '',
        placeholder: (context, url) => Container(
          color: AppColors.color26282F,
        ),
        errorWidget: (context, url, error) => Container(
          color: AppColors.color26282F,
        ),
        height: 125,
        fit: BoxFit.fitWidth,
      );
    } else {
      return Container(
        height: 125,
        child: Center(
          child: Text(
            'no img',
          ),
        ),
      );
    }
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
