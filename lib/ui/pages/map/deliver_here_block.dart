import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class DeliverHereBlock extends StatelessWidget {
  const DeliverHereBlock({super.key, required this.text, required this.controller});

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.color808080,
              ),
            ),
            const SizedBox(height: 2),
            Container(
              height: 38,
              color: AppColors.color191A1F,
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.center,
                controller: controller,
                maxLength: 2,
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.colorFFFFFF,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  counterText: "",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
