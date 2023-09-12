import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class DeliverHereBlock extends StatelessWidget {
  const DeliverHereBlock({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 38,
        color: AppColors.color191A1F,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 11),
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
    );
  }
}
