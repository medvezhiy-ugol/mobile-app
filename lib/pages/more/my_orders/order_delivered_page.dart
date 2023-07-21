import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medvezhiy_ugol/ui/primary_button.dart';

import '../../../ui/back_arrow_button.dart';
import '../../../ui/close_circle_button.dart';
import '../../../utils/app_colors.dart';

class OrderDeliveredPage extends StatelessWidget {
  OrderDeliveredPage({super.key});

  DateTime dateTime = DateTime(
    2004,
    1,
    26,
    5,
    45,
  );

  @override
  Widget build(BuildContext context) {
    String formattedDateTime = DateFormat('d MMMM HH:mm').format(dateTime);
    return Scaffold(
      backgroundColor: Color(0xff000000),
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
              Padding(
                padding: const EdgeInsets.only(
                    left: 10,
                ),
                child: Text(
                  'Доставлен',
                  style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff)
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Заказ №23129-123',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff)
                          ),
                        ),
                        Text(
                          '1 046,70 ₽',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff)
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          formattedDateTime,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.color808080,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text(
                          'Откуда',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.color808080,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Ул. Свободы, д. 46/3',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffffffff)
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 12,
                          color: Color(0xffffffff),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       'Очистить корзину',
                    //       style: TextStyle(
                    //         fontSize: 16,
                    //         fontWeight: FontWeight.w400,
                    //         color: AppColors.color808080,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            onTap: () {},
                            child: Text(
                              'Скрыть',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff)
                              ),
                            ),
                          ),
                        ),
                        VerticalDivider(width: 5.0),
                        Expanded(
                          child: PrimaryButton(
                            onTap: () {},
                            child: Text(
                              'Повторить',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff)
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ListView.separated(
                itemCount: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, i) {
                  return const SizedBox(
                    height: 5,
                  );
                },
                itemBuilder: (context, i) {
                  return _buildDeliveredOrderItem(
                    imgUrl: 'assets/images/detail_menu_page/doner.png',
                    itemName: 'Донер с курицей',
                    price: 192,
                    quantity: 2,
                  );
                },
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    _buildSubSumRow(
                      title: 'Стоимость товаров',
                      sum: 932.70,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _buildDeliveryCoastRow(
                      title: 'Стоимость доставки',
                      sum: 0,
                      address:
                      'Ярославль, ул. Ньютона, 44, под.4, домофон 74, этаж 10',
                      context: context,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    _buildSubSumRow(
                      title: 'Сервисный сбор',
                      sum: 0,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    _buildTotalRow(
                      sum: 1047.70,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveredOrderItem({
    required String imgUrl,
    required String itemName,
    required int quantity,
    required double price,
  }) {
    return Container(
      height: 96,
      color: AppColors.color191A1F,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Container(
              height: 78,
              width: 108,
              child: Image.asset(
                imgUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffffffff)
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$quantity шт',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffffffff)
                        ),
                      ),
                      Text(
                        '$price ₽',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff)
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSubSumRow({required String title, required double sum}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '$sum ₽',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildTotalRow({required double sum}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'ИТОГО',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          '$sum ₽',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryCoastRow({
    required String title,
    required double sum,
    required String address,
    required BuildContext context,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '$sum ₽',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  '$address',
                  style: const TextStyle(
                    color: AppColors.color808080,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
