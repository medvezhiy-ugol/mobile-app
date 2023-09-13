import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../buttons/custom_button.dart';

class PromocodeSheet extends StatelessWidget {
  PromocodeSheet({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 4,
          width: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: AppColors.colorD9D9D9,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: 174,
            padding: const EdgeInsets.only(
              top: 36,
              bottom: 10,
              left: 10,
              right: 10,
            ),
            decoration: const BoxDecoration(
              color: AppColors.color191A1F,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Column(
              children: [
                Container(
                  height: 60,
                  color: AppColors.color26282F,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: TextField(
                    controller: controller,
                    autofocus: true,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xffFFFFFF)
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(controller.text);
                  },
                    child: const CustomButton(text: "Готово"),
                )
              ],
            )
        ),
      ],
    );
  }
}
