import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:http/http.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import '../../services/auth_service.dart';
import 'map/pay_page.dart';
class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  TextEditingController _textTimeController = TextEditingController();

  final authService = Injector().get<AuthService>();

  DateTime date = DateTime(2016, 10, 26);

  get onTap => null;


  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 302,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: BoxDecoration(
            color: Color(0xff111216),
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(40)
            )
        ),
        child: SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  child: child,
                ),
                Material(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      color: Color(0xffFFB627),
                      alignment: Alignment.center,
                      child: Text(
                        "Сейчас",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xff121212)
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111216),
      body: SafeArea(
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _textTimeController.text = "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}'";
                    });
                    _showDialog(
                      CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: 32.0,
                        // This sets the initial item.
                        scrollController: FixedExtentScrollController(
                          initialItem: 0,
                        ),
                        // This is called when selected item is changed.
                        onSelectedItemChanged: (int selectedItem) {
                          switch (selectedItem) {
                            case 0:
                              _textTimeController.text = "Сегодня";
                              break;
                            case 1:
                              _textTimeController.text = "Завтра";
                              break;
                            case 2:
                              _textTimeController.text = "Не выбрано";
                              break;
                          }
                          setState(() {});
                        },
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Сегодня",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xffFFFFFF)
                                  ),
                                ),
                                Text(
                                  "Сегодня",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Color(0xffFFFFFF)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Завтра",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xffFFFFFF)
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
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
                  height: 65,
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
                Row(
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
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Комментарий к заказу',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.color808080,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Container(
                  height: 64,
                  width: double.infinity,
                  color: AppColors.color191A1F,
                  child: TextField(
                    controller: _textTimeController,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xffffffff)
                    ),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                Spacer(),
                BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
  builder: (context, state) {
    if (state.order.isEmpty)
      return Container();
    return GestureDetector(
                  onTap: () async {
                    final authService = Injector().get<AuthService>();
                    var request = await post(
                      Uri.parse("http://77.75.230.205:8080/v1/create"),
                      body: jsonEncode({
                        "organizationId": "0915d8a9-4ca7-495f-a75c-1ce684424781",
                        "terminalGroupId": "cfb5492e-5fdb-4318-85af-3b4ae2d383ab",
                        "order": {
                          "items": [
                            {
                              "productId": "6b5b4afd-1d41-4927-a005-2ff4d42e19a9",
                              "type": "Product",
                              "price": state.orderSum,
                              "amount": 1
                            }
                          ],
                          "payments": [
                            {
                              "paymentTypeKind": "Card",
                              "sum": 295,
                              "paymentTypeId": "6493abfa-ebd6-42ac-93b9-e96b7279c1e4",
                              "isProcessedExternally": true,
                              "isFiscalizedExternally": true
                            }
                          ],
                          "orderTypeId": "5b1508f9-fe5b-d6af-cb8d-043af587d5c2"
                        }
                      }),
                      headers: {
                        "Authorization": "Bearer ${authService.accessToken}",
                        'Content-Type': 'application/json'
                      },
                    );
                    print(request.statusCode);
                    print(request.body);
                    if (request.statusCode == 401) {
                      final refresh = await post(
                        Uri.parse("http://77.75.230.205:8080/v1/refresh"),
                        headers: {"Authorization": "Bearer ${authService.refreshToken}"},
                      );
                      final body = jsonDecode(refresh.body);
                      authService.setTokens(body['access_token'], body['refresh_token']);
                      request = await get(
                        Uri.parse("http://77.75.230.205:8080/v1/whoiam"),
                        headers: {"Authorization": "Bearer ${body['access_token']}"},
                      );
                    }
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PayPage(url: jsonDecode(request.body)["PaymentURL"])));
                  },
                  child: Container(
                    height: 56,
                    color: const Color(0xffFFB627),
                    padding: const EdgeInsets.symmetric(horizontal: 12.5),
                    child: Row(
                      children: [
                        const Text(
                          'Оплатить',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xff121212)
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${state.orderSum} ₽ · ',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        const Text(
                          '25-30 мин',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
  },
),
              ],
            ),
          ),
      )
    );
  }
}
