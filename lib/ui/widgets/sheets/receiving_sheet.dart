import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:http/http.dart';
import 'package:medvezhiy_ugol/ui/pages/pay_page.dart';
import '../../../services/auth_service.dart';

class ReceivingSheet extends StatelessWidget {
  const ReceivingSheet({super.key, required this.sum});

  final int sum;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.only(
        top: 24,
      ),
      decoration: const BoxDecoration(
        color: Color(0xff111216),
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(40)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 4,
              width: 48,
              decoration: BoxDecoration(
                  color: const Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(9)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const SizedBox(height: 25),
                const Text(
                  'Получение',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Color(0xffEFEFEF)
                  ),
                ),
                const SizedBox(height: 23),
                Container(
                  color: const Color(0xff191A1F),
                  padding: const EdgeInsets.only(
                    top: 16.5,
                    left: 16,
                    bottom: 16.5,
                    right: 23,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        color: Color(0xff808080),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "улица Республиканская, 46/3",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xffFFFFFF)
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Ярославль",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xff808080),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xffEFEFEF),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  color: const Color(0xff191A1F),
                  padding: const EdgeInsets.only(
                    top: 16.5,
                    left: 16,
                    bottom: 16.5,
                    right: 23,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: Color(0xff808080),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Доставка в течение 60 минут",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Color(0xffFFFFFF)
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Курьер может приехать раньше",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xff808080),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xffEFEFEF),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 43),
              ],
            ),
          ),
          GestureDetector(
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
                        "price": 1,
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
                    '$sum ₽ · ',
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
          ),
        ],
      ),
    );
  }
}
