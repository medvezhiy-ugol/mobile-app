import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/pages/stock/slot_machine_widget/slot_machine_widget.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import '../../ui/close_circle_button.dart';
import 'CaseWidget.dart';

class SlotDetailPage extends StatelessWidget {
  const SlotDetailPage({super.key, required this.amountWinners});
  final int amountWinners;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color111216,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
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
                        'РОЗЫГРЫШ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16,),
                  const SlotMachineWidget(),
                  const SizedBox(height: 34,),
                  Padding(
                    // color: Colors.blueGrey,
                    padding: const EdgeInsets.only(left: 37),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(
                            amountWinners.toString(),
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'победител${amountWinners % 10 == 1
                            ? 'ь'
                            : amountWinners%10==2 || amountWinners%10==3 || amountWinners%10==4
                              ? 'я'
                              : 'ей'}',
                            style: const TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 11),
                    child: Column(children: const [
                      CaseWidget(title: 'ВЫ', descriptionColor: AppColors.colorFF9900, description: 'Билет №8/300'),
                      SizedBox(height: 4,),
                      CaseWidget(title: 'Маша#31345', description: 'Билет №234/300',),
                      SizedBox(height: 4,),
                      CaseWidget(title: 'Саша#23345', description: 'Билет №14/300',),
                      SizedBox(height: 4,),
                      CaseWidget(title: 'Альберт#21545', description: 'Билет №95/300'),
                      SizedBox(height: 4,),
                    ]),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}