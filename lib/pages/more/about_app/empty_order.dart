import 'package:flutter/material.dart';

import '../../../ui/back_arrow_button.dart';

class EmptyOrder extends StatefulWidget {
  const EmptyOrder({super.key});

  @override
  State<EmptyOrder> createState() => _EmptyOrderState();
}

class _EmptyOrderState extends State<EmptyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111216),
      body: SafeArea(
        child: SingleChildScrollView(
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
              Padding(
                padding: const EdgeInsets.only(
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
              SizedBox(
                height: 24,
              ),
              Text('У вас нет заказов, давайте это исправим?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xffffffff)
              ),)
            ],
          ),

        ),
      ),
    );
  }
}
