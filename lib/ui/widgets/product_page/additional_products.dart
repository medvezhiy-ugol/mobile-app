import 'package:flutter/material.dart';

import 'additional_product.dart';

class AdditionalProducts extends StatelessWidget {
  const AdditionalProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AdditionalProduct(
          name: "Соус острый/сырный",
          price: 30,
          imgPath: 'assets/images/detail_menu_page/souse.png',
        ),
        AdditionalProduct(
          name: "Кетчуп",
          price: 30,
          imgPath: 'assets/images/detail_menu_page/souse.png',
        ),
        AdditionalProduct(
          name: "Соус чесночный",
          price: 30,
          imgPath: 'assets/images/detail_menu_page/souse.png',
        ),
        AdditionalProduct(
          name: "Соус сальса",
          price: 30,
          imgPath: 'assets/images/detail_menu_page/souse.png',
        ),
        AdditionalProduct(
          name: "Картофель фри",
          price: 30,
          imgPath: 'assets/images/detail_menu_page/souse.png',
        ),
        AdditionalProduct(
          name: "Халапенью",
          price: 30,
          imgPath: 'assets/images/detail_menu_page/souse.png',
        ),
        AdditionalProduct(
          name: "Сыр",
          price: 30,
          imgPath: 'assets/images/detail_menu_page/souse.png',
        ),
        AdditionalProduct(
          name: "Маринованный огурец",
          price: 30,
          imgPath: 'assets/images/detail_menu_page/souse.png',
        ),
        AdditionalProduct(
          name: "Чили Перец",
          price: 30,
          imgPath: 'assets/images/detail_menu_page/souse.png',
        ),
      ],
    );
  }
}
