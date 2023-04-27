import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class CaseWidget extends StatelessWidget {
  const CaseWidget({
    super.key,
    this.value = 1000,
    this.accrue = true, // "Зачисление", т.е. плюс бонусы (отвечает за цвет и "+" или "-")
    this.title= '', // от accrue ставит "Начисление бонусов" или "Списание бонусов"
    this.description = 'Еженедельная лотерея',
    this.date = '21 марта',
    this.descriptionColor =  Colors.white, // Затычка, в коде оно окращивается исходя из accrue 
    });

    final bool accrue;
    final String title;
    final String description;
    final int value;
    final String date;
    final Color descriptionColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.color191A1F,
      padding: const EdgeInsets.all(12),
      // height: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title == ''
                ? (accrue ? 'Начисление бонусов' : 'Списание бонусов')
                : title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${accrue ? '+' : '-'}$value",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: (accrue ? AppColors.color66BF28 : AppColors.colorBD3232)
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Container(
                height: 20,
                // width: 150,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: (
                    descriptionColor == Colors.white 
                    ? (accrue ? AppColors.color66BF28 : AppColors.colorBD3232)
                    : descriptionColor
                    ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 5,),
              Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.color808080
                    ),
                  ),
            ],
          )
        ],
      ),
    );
  }
}