import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/generated/l10n.dart';

import '../../ui/close_circle_button.dart';
import '../../ui/primary_button.dart';
import '../../ui/slidable_panel_widget.dart';
import '../../utils/app_colors.dart';

class BasketPage extends StatefulWidget {
  BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  final TextEditingController _textPromoCodeController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CloseCircleButton(
                    onTap: () {
                      context.pop();
                    },
                  ),
                ],
              ),
              Text(
                'Корзина',
                style: TextStyle(
                  fontFamily: 'Unbounded',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Очистить корзину',
                style: TextStyle(
                  // fontFamily: 'Unbounded',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SlidableWidget(
                    itemPrice: 100,
                    quantity: 10,
                    imgUrl: '', itemName: '',

                  ),
                  SlidableWidget(
                    itemPrice: 100,
                    quantity: 10,
                    imgUrl: '', itemName: '',
                  ),
                  SlidableWidget(
                    itemPrice: 100,
                    quantity: 10,
                    imgUrl: '', itemName: '',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                color: AppColors.color191A1F,
                child: TextField(
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  controller: _textPromoCodeController,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Promocode',
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ChooseDeliveryType(),
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _buildChooseTimeDelivery(),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _buildChooseTimeDelivery(),
              ),
              SizedBox(
                height: 45,
              ),
              _buildSubsumRow('Сумма заказа', 200),
              _buildSubsumRow('Сервисный сбор', 30),
              SizedBox(
                height: 56,
              ),
              _buildSubsumRow('При самовывозе', 768),
              _buildTotalRow(),SizedBox(
                height: 33,
              ),
              PrimaryButton(
                onTap: () {},
                color: AppColors.color26282F,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.map,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Построить маршрут',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 33,
              ),
              PrimaryButton(
                height: 56,
                onTap: () {},
                color: AppColors.colorFFB627,
                child: Text(
                  'Оформить заказ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.color121212,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildTotalRow() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.current.activeOrderScreenInTotal.toUpperCase(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            '971 ₽',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildSubsumRow(String title, int sum) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: AppColors.color808080,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Text(
            '$sum ₽',
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildChooseTimeDelivery() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.color191A1F,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.timeline,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Доставка 30-40 минут'),
                    Text('Выберите время доставки'),
                  ],
                ),
                Spacer(),
                Icon(
                  Icons.arrow_right,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum TypeOfOrder<T> {
  delivery<String>('Доставка'),
  pickup<String>('Навынос');

  const TypeOfOrder(this.getType);
  final T getType;
}

class ChooseDeliveryType extends StatefulWidget {
  const ChooseDeliveryType({super.key});

  @override
  State<ChooseDeliveryType> createState() => _ChooseDeliveryTypeState();
}

class _ChooseDeliveryTypeState extends State<ChooseDeliveryType> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Text(
              '${(index == 0) ? 'Доставка' : 'Навынос'}: ',
              style: TextStyle(
                fontFamily: 'Unbounded',
                fontSize: 16,
              ),
            ),
            Text(
              'Ярославль',
              style: TextStyle(
                fontFamily: 'Unbounded',
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //delivery
            Container(
              decoration: BoxDecoration(
                color: (TypeOfOrder.delivery.index == index)
                    ? AppColors.color2D2D2D
                    : Color(0xFF000000),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.motorcycle,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Доставка'),
                            Text('30-40 минут'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //pickup
            Container(
              decoration: BoxDecoration(
                color: (TypeOfOrder.pickup.index == index)
                    ? AppColors.color2D2D2D
                    : Color(0xFF000000),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.motorcycle,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Доставка'),
                            Text('30-40 минут'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
