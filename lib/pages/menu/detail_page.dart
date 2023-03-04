import 'package:flutter/material.dart';

import '../../ui/buttons.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                        color: AppColors.colorD9D9D9,
                        borderRadius: BorderRadius.circular(9)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.asset(A.assetsDetailPageProductImg),
                ),
                Text('Донер с курицей'),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: PrimaryButton(
                    height: 50,
                    text: '220 Р Добавить',
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  child: Text('sostav'),
                ),
                SizedBox(
                  height: 15,
                ),
                StatsBarWidget(),
                SizedBox(
                  height: 15,
                ),
                Text('убрать элемента'),
                SizedBox(
                  height: 10,
                ),
                ChoiceComponents(),
                SizedBox(
                  height: 25,
                ),
                Text('Добавить'),
                SizedBox(
                  height: 10,
                ),
                AddProduct(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget StatsBarWidget() {
    return Row(
      children: <Widget>[
        StatusBarItemWidget(title: 'Вес', data: '300 г', width: 56),
        SizedBox(
          width: 8,
        ),
        StatusBarItemWidget(title: 'Ккал', data: '588 г', width: 46),
        Spacer(),
        StatusBarItemWidget(title: 'Белки', data: '23 г', width: 46),
        SizedBox(
          width: 8,
        ),
        StatusBarItemWidget(title: 'Жири', data: '24 г', width: 46),
        SizedBox(
          width: 8,
        ),
        StatusBarItemWidget(title: 'Углеводы', data: '68 г', width: 61),
      ],
    );
  }

  Widget StatusBarItemWidget({
    required String title,
    required String data,
    double? height = 38,
    double? width,
  }) {
    return Column(
      children: [
        Center(
          child: Text(title),
        ),
        SizedBox(height: 2),
        Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          padding: EdgeInsets.all(10),
          color: AppColors.color191A1F,
          child: Text(data),
        ),
      ],
    );
  }

  Widget ChoiceComponents() {
    bool _ch = false;
    return Wrap(
      direction: Axis.horizontal,
      spacing: 3,
      runSpacing: 3,
      children: [
        RawChip(
          label: Text(
            'Luk',
            style: (_ch
                ? TextStyle(decoration: TextDecoration.lineThrough)
                : TextStyle()),
          ),
          onPressed: () {
            _ch = !_ch;
          },
        ),
        Chip(
          avatar: Icon(
            Icons.close,
            size: 9,
            color: Colors.white,
          ),
          label: Text(
            'Luk',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          deleteIcon: Icon(
            Icons.close,
            size: 9,
            color: Colors.white,
          ),
          onDeleted: () {},
        ),
        Chip(
          avatar: Icon(
            Icons.close,
            size: 9,
            color: Colors.white,
          ),
          label: Text('Luk'),
        ),
        Chip(
          avatar: Icon(
            Icons.close,
            size: 9,
            color: Colors.white,
          ),
          label: Text('Luk'),
        ),
        // DishComponent(
        //   text: 'Лук',
        // ),
        // DishComponent(
        //   text: 'Слат',
        // ),
        // DishComponent(
        //   text: 'Огурцы маринованные',
        // ),
        // DishComponent(
        //   text: 'Соус',
        // ),
        // DishComponent(
        //   text: 'Томаты',
        // ),
      ],
    );
  }

  Widget AddProduct() {
    return Column(
      children: [
        OptionalProduct(
            name: 'sTomat sous',
            price: 20,
            imgPath: A.assetsDetailPageOptionalProductImg),
        OptionalProduct(
            name: 'Chees sous',
            price: 20,
            imgPath: A.assetsDetailPageOptionalProductImg),
        OptionalProduct(
            name: 'Chees sous',
            price: 20,
            imgPath: A.assetsDetailPageOptionalProductImg),
      ],
    );
  }
}

class OptionalProduct extends StatefulWidget {
  const OptionalProduct(
      {super.key,
      required this.name,
      required this.imgPath,
      required this.price});

  final String name;
  final double price;
  final String imgPath;

  @override
  State<OptionalProduct> createState() => _OptionalProductState();
}

class _OptionalProductState extends State<OptionalProduct> {
  bool _isToogle = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            _isToogle = !_isToogle;
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 65,
          color: AppColors.color191A1F,
          child: Row(
            children: [
              Image.asset(widget.imgPath),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name),
                  Text('+ ${widget.price} Р'),
                ],
              ),
              Spacer(),
              Container(
                height: 20,
                width: 20,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (_isToogle
                          ? AppColors.colorFF9900
                          : AppColors.color5D6377)),
                  child: (_isToogle ? Icon(Icons.done, size: 15,) : null),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class DishComponent extends StatefulWidget {
  const DishComponent({super.key, required this.text});
  final String text;

  @override
  State<DishComponent> createState() => _DishComponentState();
}

class _DishComponentState extends State<DishComponent> {
  bool _istaped = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          setState(() {
            _istaped = !_istaped;
          });
        },
        child: Container(
          constraints: BoxConstraints(maxWidth: 170),
          height: 38,
          alignment: Alignment.center,
          color: AppColors.color26282F,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: (_istaped
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.close,
                        size: 9,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(widget.text),
                    ],
                  )
                : Text(
                    widget.text,
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  )),
          ),
        ),
      ),
    );
  }
}
