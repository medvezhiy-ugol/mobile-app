import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class HistoryDraw extends StatelessWidget {
  const HistoryDraw({Key? key}) : super(key: key);

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
                      'РОЗЫГРЫШ',
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
                Padding(
                  padding: const EdgeInsets.only(
                    left: 31,
                  ),
                  child: SizedBox(
                    height: 116,
                    width: double.infinity,
                    child: Text('10 \n'
                        'победителей',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 36,
                      color: Color(0xffffffff)
                    ),
                    ),
                  ),
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
                            child: Text('ВЫ',
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
                          Text('+1000',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff66bf28)
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
                                color: Color(0xffff9900),
                              ),
                              alignment: Alignment.center,
                              height: 20,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 8,
                                ),
                                child: Text('Билет №234/300',
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
                            child: Text('Маша#31345',
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
                          Text('+1000',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff66bf28)
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
                                color: Color(0xff66BF28),
                              ),
                              alignment: Alignment.center,
                              height: 20,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 8,
                                ),
                                child: Text('Билет №14/300',
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
