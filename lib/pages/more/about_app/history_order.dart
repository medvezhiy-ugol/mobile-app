import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:http/http.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/pages/more/my_orders/order_delivered_page.dart';

import '../../../services/auth_service.dart';
import '../../../ui/back_arrow_button.dart';
import '../../../utils/app_colors.dart';

class HistoryOrder extends StatefulWidget {
  const HistoryOrder({super.key});

  @override
  State<HistoryOrder> createState() => _HistoryOrderState();
}

class _HistoryOrderState extends State<HistoryOrder> {

  @override
  void initState() {
    getHistory();
    super.initState();
  }

  void getHistory() async {
    final authService = Injector().get<AuthService>();
    var request = await get(
      Uri.parse("http://77.75.230.205:8080/v1/get_history/0/20"),
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
        Uri.parse("http://77.75.230.205:8080/v1/getHistory/0/20"),
        headers: {
          "Authorization": "Bearer ${authService.accessToken}",
          'Content-Type': 'application/json'
        },
      );
      print("фвыфввывыф ${request.body}");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111216),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackArrowButton(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 10,
              ),
              child: Text(
                'История заказов',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffffffff)
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
              builder: (context, state) {
                return state.orders.isEmpty ? const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'У вас нет заказов, давайте это исправим?',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.colorFFFFFF,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ) : Expanded(
                  child: ListView.builder(
                      itemCount: state.orders.length,
                      itemBuilder: (context, index) {
                        String names = "";
                        for (int j = 0; j < state.orders[index].length; j++) {
                          names += '${state.orders[index][j].name}${j == state.orders[index].length ? "" : ", "}';
                        }
                        return GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> OrderDeliveredPage()));
                          },
                          child: Container(
                            height: 135,
                            width: double.infinity,
                            color: const Color(0xff191A1F),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      child: Text(names,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffffffff)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 12,
                                      ),
                                      child: Text('1046,70 р',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xffFFFFFF)
                                        ),
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
                                          color: Color(0xffff9900),
                                        ),
                                        child: Text('Доставлен',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffffffff)
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('21 марта 22:07',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Color(0xff808080)
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 12,
                                      ),
                                      child: SizedBox(
                                        height: 47,
                                        width: 65,
                                        child: Image.asset("assets/images/detail_menu_page/doner.png"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2,
                                    ),
                                    SizedBox(
                                      height: 47,
                                      width: 65,
                                      child: Image.asset("assets/images/detail_menu_page/doner.png"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

