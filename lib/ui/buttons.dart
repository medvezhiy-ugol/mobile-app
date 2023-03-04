import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.text,
    this.height = 50,
    this.width = double.infinity,
  });

  final double height;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.color26282F,
      height: height,
              width: width,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.height,
    required this.text,
  });

  final double height;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          color: AppColors.color26282F,
        ),
        child: Text(
          text,
        ),
      ),
    );
  }
}
