import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/ui/pages/menu/delivery_page.dart';
import '../../../utils/app_colors.dart';

class DeliveryTile extends StatelessWidget {
  const DeliveryTile({super.key, required this.icon, required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeliveryPage())),
      child: Container(
        height: 65,
        width: double.infinity,
        color: AppColors.color26282F,
        margin: const EdgeInsets.symmetric(vertical: 1),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8.5,
        ),
        child: Row(
          children: [
            Image.asset('assets/images/$icon.png'),
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.colorFFFFFF,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.colorFFFFFF,
            ),
          ],
        ),
      ),
    );
  }
}
