import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/ui/widgets/menu/delivery_tile.dart';

import '../../../../utils/app_colors.dart';

class DeliverySheet extends StatelessWidget {
  const DeliverySheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 4,
          width: 48,
          decoration: BoxDecoration(
            color: AppColors.colorD9D9D9,
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 327,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: const BoxDecoration(
            color: AppColors.color191A1F,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 32,
                  left: 15,
                  bottom: 23,
                ),
                child: Text(
                  'Доставка',
                  style: TextStyle(
                    fontFamily: 'Unbounded',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                    color: AppColors.colorEFEFEF,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await LaunchApp.openApp(
                    androidPackageName: 'ru.foodfox.client&;hl=ru&;gl=US',
                    iosUrlScheme: 'яндекс-еда-доставка-еды://',
                    appStoreLink: 'itms-apps://itunes.apple.com/us/app/яндекс-еда-доставка-еды/id1078986931',
                    // openStore: false
                  );
                },
                  child: DeliveryTile(icon: 'yandex', text: 'Яндекс Еда')),
              GestureDetector(
                onTap: () async {
                  await LaunchApp.openApp(
                    androidPackageName: 'com.deliveryclub&;hl=ru&;gl=US',
                    iosUrlScheme: 'маркет-деливери-delivery-club://',
                    appStoreLink: 'itms-apps://itunes.apple.com/us/app/маркет-деливери-delivery-club/id436145623',
                    // openStore: false
                  );
                },
                  child: DeliveryTile(icon: 'sber', text: 'Деливери')),
              GestureDetector(
                onTap: () async {
                  await LaunchApp.openApp(
                    androidPackageName: 'ru.megamarket.marketplace',
                    iosUrlScheme: 'мегамаркет-маркетплейс://',
                    appStoreLink: 'itms-apps://itunes.apple.com/us/app/мегамаркет-маркетплейс/id1438856489',
                    // openStore: false
                  );
                },
                  child: DeliveryTile(icon: 'sber', text: 'Сбер Мега Маркет')),
            ],
          ),
        )
      ],
    );
  }
}
