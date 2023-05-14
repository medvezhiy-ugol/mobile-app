import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import '../../../utils/app_fonts.dart';

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

              // const CaseWidget(date: '27 апреля'),
              // const SizedBox(height: 4,),
              
              // const CaseWidget(accrue: false, value: 800, date: '7 апреля', description: 'Оплата покупки',),
              // const SizedBox(height: 4,),

              // const CaseWidget(
              //   value: 900,
              //   date: '20 марта',),
              // const SizedBox(height: 4,),
              const SizedBox(
              height: 250,
            ),
            const Center(
              child: Text(
                'История пуста', //'Акции и комбо',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.unbounded,
                  color: AppColors.color808080,
                ),
              ),
            ),

            ],
          )),
        )
        ),
    );
  }
}

