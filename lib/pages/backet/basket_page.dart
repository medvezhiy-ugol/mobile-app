import 'package:flutter/material.dart';

import '../../ui/close_circle_button.dart';

class BasketPage extends StatelessWidget {
  BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 4,
                  width: 48,
                  color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CloseCircleButton(
                  onTap: () {},
                ),
              ),
            ],
          ),
          Text('Корзина'),
          SizedBox(height: 10,),
          Text('Очистить корзину'),
        ],
      ),
    );
  }
}
