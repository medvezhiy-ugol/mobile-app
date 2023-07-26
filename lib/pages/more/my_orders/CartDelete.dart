import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import '../../../ui/back_arrow_button.dart';

class CartDelete extends StatefulWidget {
  const CartDelete({super.key});

  @override
  State<CartDelete> createState() => _CartDeleteState();
}

class _CartDeleteState extends State<CartDelete> {
  get onTap => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111216),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 11,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        customBorder: const CircleBorder(),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: const Icon(
                            Icons.arrow_back_ios_sharp,
                            size: 22,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('Доставка',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffffffff)
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    height: 64,
                    width: double.infinity,
                    color: Color(0xff191a1f),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: Image.asset('assets/images/delivery_info_page/scooter.png',
                            width: 22,
                            height: 15,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Доставка 25-35 минут',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff808080)
                          ),
                        ),
                        Spacer(
                        ),
                        SizedBox(
                          height: 13,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 13,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text('Адрес',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff)
                    ),),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    height: 64,
                    width: double.infinity,
                    color: Color(0xff191a1f),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 24,
                          child: const Icon(
                            Icons.home,
                            size: 24,
                            color: Color(0xff808080),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('улица Республиканская, 46/3',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Color(0xffFFFFFF)
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text('Ярославль',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Color(0xFF808080)
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                        ),
                        SizedBox(
                          height: 13,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            size: 13,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 72,
                                child: Text(
                                  'Квартира',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.color808080,
                                  ),
                                ),
                              ),
                              Container(
                                height: 38,
                                width: 72,
                                color: AppColors.color191A1F,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Text(
                                      '28',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 72,
                                child: Text(
                                  'Подъезд',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.color808080,
                                  ),
                                ),
                              ),
                              Container(
                                height: 38,
                                width: 72,
                                color: AppColors.color191A1F,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                width: 72,
                                child: Text(
                                  'Этаж',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.color808080,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Container(
                                height: 38,
                                width: 72,
                                color: AppColors.color191A1F,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Text(
                                      '10',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 38,
                                width: 72,
                                child: Text(
                                  'Домофон',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.color808080,
                                  ),
                                ),
                              ),
                              Container(
                                height: 38,
                                width: 72,
                                color: AppColors.color191A1F,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Text(
                                      '28',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
