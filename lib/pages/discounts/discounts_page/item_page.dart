import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({Key? key}) : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color111216,
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 259,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Image.asset('assets/images/detail_menu_page/doner.png',
                          width: double.infinity,
                          height: 259,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                  height: 38,
                ),
                  Text('Донер с курицей',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                  height: 32,
                ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Color(0xff26282f),
                    child: Center(
                      child: Text('240 Р Добавить',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height:
                    16,
                  ),
                  Text('куриное бедро, помидор, огурец, айсберг, \n'
                      'кинза, базилик, соус на выбор',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff808080)
                  ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 18,
                              width: 56,
                              child: Center(
                                child: Text('Вес',
                                style: TextStyle(
                                  color: Color(0xff808080),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                                ),
                              ),
                            ),
                            Container(
                              height: 38,
                              width: 56,
                              color: Color(0xff191a1f),
                              child: Center(
                                child: Text('300 г',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white
                                ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 18,
                              width: 46,
                              child: Center(
                                child: Text('Ккал',
                                  style: TextStyle(
                                    color: Color(0xff808080),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 38,
                              width: 46,
                              color: Color(0xff191a1f),
                              child: Center(
                                child: Text('588',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 51,
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 18,
                              width: 47,
                              child: Center(
                                child: Text('Белки',
                                  style: TextStyle(
                                    color: Color(0xff808080),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 38,
                              width: 47,
                              color: Color(0xff191a1f),
                              child: Center(
                                child: Text('23 г',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 18,
                              width: 46,
                              child: Center(
                                child: Text('Жиры',
                                  style: TextStyle(
                                    color: Color(0xff808080),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 38,
                              width: 46,
                              color: Color(0xff191a1f),
                              child: Center(
                                child: Text('24 г',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 18,
                              width: 61,
                              child: Center(
                                child: Text('Углеводы',
                                  style: TextStyle(
                                    color: Color(0xff808080),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 38,
                              width: 61,
                              color: Color(0xff191a1f),
                              child: Center(
                                child: Text('68 г',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text('Убрать инденгрендиенты',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 36,
                    width: 63,
                    color: Color(0xff26282f),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            child: Icon(
                              Icons.close
                            ),
                          ),
                          SizedBox(
                            width: 9.33,
                          ),
                          Text('Лук',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            ),
          )),
    );
  }
}
