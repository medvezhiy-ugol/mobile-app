import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class SlotHistoryPage extends StatelessWidget {
  const SlotHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color111216,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Center(child: Column(
            children: [
              const SizedBox(height: 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CloseCircleButton(onTap: () => context.pop()),
                  const SizedBox(width: 8,)
                ],
              ),
              const SizedBox(height: 3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'История',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              const CaseWidget(date: '27 апреля'),
              const SizedBox(height: 4,),
              
              const CaseWidget(accrue: false, value: 800, date: '7 апреля', description: 'Оплата покупки',),
              const SizedBox(height: 4,),

              const CaseWidget(
                value: 900,
                date: '20 марта',),
              const SizedBox(height: 4,),

            ],
          )),
        )
        ),
    );
  }
}

class CaseWidget extends StatelessWidget {
  const CaseWidget({
    super.key,
    this.value = 1000,
    this.accrue = true,
    this.description = 'Еженедельная лотерея',
    this.date = '21 марта',
    });

    final bool accrue;
    final String description;
    final int value;
    final String date;

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
                (accrue ? 'Начисление бонусов' : 'Списание бонусов'),
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
                  color: (accrue ? AppColors.color66BF28 : AppColors.colorBD3232),
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