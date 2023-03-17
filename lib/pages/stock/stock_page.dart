import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:medvezhiy_ugol/utils/app_fonts.dart';

import '../../common_setup/routes.dart';
import '../../utils/app_assets.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Акции и комбо',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.unbounded,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildStockItem(context, '1'),
            const SizedBox(
              height: 8,
            ),
            _buildStockItem(context, '2'),
            const SizedBox(
              height: 8,
            ),
            _buildStockItem(context, '3'),
          ],
        ),
      ),
    );
  }

  Stack _buildStockItem(BuildContext context, String id) {
    return Stack(
      children: [
        Container(
          height: 127,
          color: AppColors.color191A1F,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                A.assetsStockPageItemImg,
                height: 127,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Две лучше, чем одна $id',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.unbounded,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Скидка на вторую пиццу 20%",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.color808080,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Действует до 07.04.2023 г.',
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.color808080,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.pushNamed(
                Routes.detailStockName,
                params: {'id': id},
              );
            },
            child: Container(
              height: 127,
            ),
          ),
        ),
      ],
    );
  }
}
