import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';

class ThankYouSheet extends StatelessWidget {
  const ThankYouSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        height: 246,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 36),
        decoration: BoxDecoration(
          color: AppColors.color191A1F,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            const Text(
              'Спасибо',
              style: TextStyle(
                fontFamily: 'Unbounded',
                fontWeight: FontWeight.w500,
                fontSize: 24,
                color: AppColors.colorEFEFEF,
              ),
            ),
            const SizedBox(height: 26),
            Container(
              height: 64,
              width: 64,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.color64DC70.withOpacity(0.6)
              ),
              child: const Icon(Icons.check),
            ),
            const SizedBox(height: 38),
            const Text(
              'Оплата прошла успешно',
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.colorEFEFEF,
              ),
            )
          ],
        ),
      ),
    );
  }
}
