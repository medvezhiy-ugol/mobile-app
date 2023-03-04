import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:medvezhiy_ugol/utils/more_page_icons.dart';

class RegisteredPage extends StatelessWidget {
  const RegisteredPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color151515,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('Денис', style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600
                    ),),
                  ],
                ),
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('+7 930 103 28 35', style: TextStyle(
                        color: AppColors.color808080,
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                    ),),
                    SizedBox(width: 17,),
                    Text('youremail@mail.com', style: TextStyle(
                        color: AppColors.color808080,
                        fontSize: 12,
                        fontWeight: FontWeight.w400
                    ),),
                  ],
                ),
                const SizedBox(height: 26,),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Container(
                          color: AppColors.color1C1C1C,
                          padding: const EdgeInsets.only(top: 17, left: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(Icons.location_on_outlined, size: 28,),
                                  SizedBox(height: 14,),
                                  Text('Адреса', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                  ),),

                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 3,),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          color: AppColors.color1C1C1C,
                          padding: const EdgeInsets.only(top: 17, left: 20, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Icon(Icons.credit_card, size: 28,),
                                  SizedBox(height: 14,),
                                  Text('Лояльность', style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600
                                  ),),

                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12,),
                InkWell(
                  child: Container(
                    color: AppColors.color1C1C1C,
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: const [
                        Icon(Icons.ac_unit, size: 24,),
                        SizedBox(width: 26,),
                        Text('Настройки', style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    color: AppColors.color1C1C1C,
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: const [
                        Icon(Icons.delivery_dining_rounded, size: 24,),
                        SizedBox(width: 26,),
                        Text('Условия доставки', style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    color: AppColors.color1C1C1C,
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: const [
                        Icon(Icons.star, size: 24,),
                        SizedBox(width: 26,),
                        Text('Связаться с нами', style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    color: AppColors.color1C1C1C,
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: const [
                        Icon(Icons.info, size: 24,),
                        SizedBox(width: 26,),
                        Text('О приложении', style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 7,),
                Container(
                  color: AppColors.color1C1C1C,
                  padding: const EdgeInsets.all(17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text('Наши соцсети', style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),),
                          const SizedBox(height: 17,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.ac_unit, size: 25,),
                              SizedBox(width: 24,),
                              Icon(Icons.ac_unit, size: 25,),
                              SizedBox(width: 24,),
                              Icon(Icons.ac_unit, size: 25,),

                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
