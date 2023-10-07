import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:http/http.dart';
import '../../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import '../../../services/auth_service.dart';
import '../../pages/pay_page.dart';

class PayButton extends StatelessWidget {
  const PayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            print("фвоывфрвыф ${state.order}");
            final authService = Injector().get<AuthService>();
            var request = await post(
              Uri.parse("http://193.37.71.108:8080/v1/create"),
              body: jsonEncode({
                "organizationId": "0915d8a9-4ca7-495f-a75c-1ce684424781",
                "terminalGroupId": "cfb5492e-5fdb-4318-85af-3b4ae2d383ab",
                "order": {
                  "items": [
                    for (int i = 0; i < state.order.length; i++)
                      {
                        "productId": state.order[i].id,
                        "type": "Product",
                        "price": state.orderSum,
                        "amount": 1
                      }
                  ],
                  "payments": [
                    {
                      "paymentTypeKind": "Card",
                      "sum": state.orderSum,
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
            print({
              "organizationId": "0915d8a9-4ca7-495f-a75c-1ce684424781",
              "terminalGroupId": "cfb5492e-5fdb-4318-85af-3b4ae2d383ab",
              "order": {
                "items": [
                  for (int i = 0; i < state.order.length; i++)
                    {
                      "productId": state.order[i].id,
                      "type": "Product",
                      "price": state.orderSum,
                      "amount": 1
                    }
                ],
                "payments": [
                  {
                    "paymentTypeKind": "Card",
                    "sum": state.orderSum,
                    "paymentTypeId": "6493abfa-ebd6-42ac-93b9-e96b7279c1e4",
                    "isProcessedExternally": true,
                    "isFiscalizedExternally": true
                  }
                ],
                "orderTypeId": "5b1508f9-fe5b-d6af-cb8d-043af587d5c2"
              }
            });
            print(request.statusCode);
            print(utf8.decode(request.bodyBytes));
            if (request.statusCode == 401) {
              final refresh = await post(
                Uri.parse("http://193.37.71.108:8080/v1/refresh"),
                headers: {"Authorization": "Bearer ${authService.refreshToken}"},
              );
              final body = jsonDecode(refresh.body);
              authService.setTokens(body['access_token'], body['refresh_token']);
              request = await get(
                Uri.parse("http://193.37.71.108:8080/v1/whoiam"),
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
    );
  }
}
