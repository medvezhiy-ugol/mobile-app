import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      alignment: Alignment.center,
      color: AppColors.colorFFB627,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: AppColors.color121212,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}
