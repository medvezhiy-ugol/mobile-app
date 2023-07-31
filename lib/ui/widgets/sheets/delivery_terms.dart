import 'package:flutter/material.dart';

import '../../close_circle_button.dart';

class DeliveryTerms extends StatelessWidget {
  const DeliveryTerms({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff111216),
      child: Column(
        children: [
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CloseCircleButton(onTap: () => Navigator.of(context).pop()),
              const SizedBox(width: 8,)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Text('Условия доставки',
                  style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff)
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 214,
            width: 375,
            child: Container(
                child: Image.asset('assets/images/home_page/Пицца мафия.png',
                  fit: BoxFit.cover,)
            ),
          ), SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Text(
              '''Сделайте заказ online (на сайте или в приложениях) и заберите его в любом удобном ресторане "Медвежий угол" со скидкой 20%.
                      
Акция не суммируется с другими скидками и специальными предложениями компании , не распространяется на раздел «Напитки», а так-же не суммируется с промокодами на подарочные пиццы.
                      
При заказе самовывоза в ресторане - минимальная сумма заказа - 1000 руб.
                      ''',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
