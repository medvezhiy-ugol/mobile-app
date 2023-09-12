import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class MyAddress extends StatelessWidget {
  const MyAddress({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isTapped,
  });

  final String title;
  final String subtitle;
  final bool isTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1),
      color: AppColors.color26282F,
      height: 65,
      padding: const EdgeInsets.only(
        top: 8.5,
        bottom: 8.5,
        left: 16,
        right: 24,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.colorFFFFFF,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: AppColors.color808080,
                ),
              ),
            ],
          ),
          const Spacer(),
          isTapped
              ? Container(
            height: 20,
            width: 20,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.colorFF9900,
              shape: BoxShape.circle,
            ),
            child: Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                color: AppColors.color000000,
                shape: BoxShape.circle,
              ),
            ),
          )
              : Container(
            height: 20,
            width: 20,
            decoration: const BoxDecoration(
              color: AppColors.color5D6377,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}
