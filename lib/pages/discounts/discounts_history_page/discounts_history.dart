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
              SizedBox(
                height: 10,
              ),
              Container(
                height: 73,
                width: double.infinity,
                color: Color(0xff191A1F),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                          ),
                          child: Text('Начисление бонусов',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff)
                          ),
                          ),
                        ),
                        Text('+1000',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff66BF28)
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            alignment: Alignment.center,
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff29FF24),
                            ),
                            child: Text('Еженедельная лотерая',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffffffff)
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('21 марта',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xff808080)
                        ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                height: 73,
                width: double.infinity,
                color: Color(0xff191A1F),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                          ),
                          child: Text('Списание бонусов',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffffffff)
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 127,
                        ),
                        Text('-100',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffBD3232)
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffBD3232),
                            ),
                            alignment: Alignment.center,
                            height: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 8,
                              ),
                              child: Text('Оплата покупки',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffffffff)
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('21 марта',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xff808080)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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

