import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

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
                    const SizedBox(width: 8,)
                  ],
                ),
                const SizedBox(height: 3,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Донер с курицей',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: 50,
                  width: 325,
                  child: Row(
                    children: [
                      Text('240 Р',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      ),
                      Text('Добавить',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text('куриноее бедро, помидор, огурец, айсберг, кинза, базилик, соус на выбор',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),),
                // const SizedBox(height: 10,),

                // const CaseWidget(date: '27 апреля'),
                // const SizedBox(height: 4,),

                // const CaseWidget(accrue: false, value: 800, date: '7 апреля', description: 'Оплата покупки',),
                // const SizedBox(height: 4,),

                // const CaseWidget(
                //   value: 900,
                //   date: '20 марта',),
                // const SizedBox(height: 4,),
                //   const SizedBox(
                //   height: 250,
                // ),
                // const Center(
                //   child: Text(
                //     'История пуста', //'Акции и комбо',
                //     style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.w400,
                //       fontFamily: AppFonts.unbounded,
                //       color: AppColors.color808080,
                //     ),
                //   ),
                // ),

              ],
            )),
          )
      ),
    );
  }
}
