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
                  Text('куриное бедро, помидор, огурец, айсберг, \n'
                      'кинза, базилик, соус на выбор',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff808080)
                  ),
                  ),
              ],
            ),
            ),
          )),
    );
  }
}
