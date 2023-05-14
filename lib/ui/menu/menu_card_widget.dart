import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/models/menu.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import '../../services/theme_service.dart';

class MenuCardWidget extends StatelessWidget {
  final MenuProduct menuProduct;
  final VoidCallback onTap;
  static const double menuCardWidgetHeight = 300;

  const MenuCardWidget({
    super.key,
    required this.onTap,
    required this.menuProduct,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: menuCardWidgetHeight,
      decoration: const BoxDecoration(
        color: AppColors.color191A1F,
      ),
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                height: 125,
                width: double.infinity,
                child: _buildCachedImg(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 6),
                child: SizedBox(
                  height: 175 - 6,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                menuProduct.name,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    ThemeService.detailPageAddButtonTextStyle(),
                              ),
                            ),
                          ],
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
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              menuProduct.description == ''
                                  ? 'Состав отсутствует'
                                  : menuProduct.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
                ),
              )
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCachedImg() {
    if (menuProduct.itemSizes.first.buttonImageUrl != null) {
      return CachedNetworkImage(
        imageUrl: menuProduct.itemSizes.first.buttonImageUrl!,
        placeholder: (context, url) => Container(
          color: AppColors.color26282F,
        ),
        errorWidget: (context, url, error) => Container(
          color: AppColors.color26282F,
        ),
        height: 125,
        fit: BoxFit.fill,
      );
    } else {
      return Container(
        color: AppColors.color26282F,
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
