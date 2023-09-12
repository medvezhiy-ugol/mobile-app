import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';

class DeliverySheet extends StatelessWidget {
  const DeliverySheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    bottom: 24,
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
              )
            ],
          ),
        )
      ],
    );
  }
}
