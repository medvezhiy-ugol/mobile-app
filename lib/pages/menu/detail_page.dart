import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../../generated/l10n.dart';
import '../../services/theme_service.dart';
import '../../ui/buttons.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    super.key,
    required this.productCoast,
    required this.productName,
  });

  final ThemeService themeService = Injector().get<ThemeService>();

  final int productCoast;
  final String productName;

  static List<String> inputProductIngredients = [
    'куриное бедро',
    'помидор',
    'огурец',
    'айсберг',
    'кинза',
    'базилик',
    'соус на выбор'
  ];

  @override
  Widget build(BuildContext context) {
    final String outputProductIngredients = inputProductIngredients.join(', ');
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.color151515,
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
                        color: AppColors.colorD9D9D9.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(9)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Image.asset(A.assetsDetailPageProductImg),
                ),
                Row(
                  children: [
                    Text(
                      productName,
                      style: ThemeService.detailPageTitleProductTextStyle(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                PrimaryButton(
                  height: 50,
                  text:
                      '$productCoast ₽ ${S.current.mealScreenDeleteAddTitleText}',
                  textStyle: ThemeService.detailPageAddButtonTextStyle(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          outputProductIngredients,
                          style: ThemeService
                              .detailPageProductIngredientsTextStyle(),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                StatsBarWidget(),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      S.current.mealScreenDeleteIngredientsTitleText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ChoiceComponents(),
                const SizedBox(height: 25),
                Row(
                  children: [
                    Text(
                      S.current.mealScreenDeleteAddTitleText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
        StatusBarItemWidget(
            title: S.current.mealScreenWeightTitleText,
            data: '300 г',
            width: 56),
        const SizedBox(width: 8),
        StatusBarItemWidget(
            title: S.current.mealScreenCaloriesTitleText,
            data: '588 г',
            width: 46),
        const Spacer(),
        StatusBarItemWidget(
            title: S.current.mealScreenProteinTitleText,
            data: '23 г',
            width: 46),
        const SizedBox(width: 8),
        StatusBarItemWidget(
            title: S.current.mealScreenFatsTitleText, data: '24 г', width: 46),
        const SizedBox(width: 8),
        StatusBarItemWidget(
            title: S.current.mealScreenCarbohydratesTitleText,
            data: '68 г',
            width: 61),
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
          child: Text(
            title,
            style: ThemeService.detailPageStatusBarItemTextStyle(),
          ),
        ),
        const SizedBox(height: 2),
        Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          padding: const EdgeInsets.all(10),
          color: AppColors.color191A1F,
          child: Text(
            data,
            style: ThemeService.detailPageStatusBarItemCountTextStyle(),
          ),
        ),
      ],
    );
  }

  //тестовый вариант
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
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : const TextStyle()),
          ),
          onPressed: () {
            _ch = !_ch;
          },
        ),
        Chip(
          avatar: const Icon(
            Icons.close,
            size: 9,
            color: Colors.white,
          ),
          label: const Text(
            'Luk',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
            ),
          ),
          deleteIcon: const Icon(
            Icons.close,
            size: 9,
            color: Colors.white,
          ),
          onDeleted: () {},
        ),
        const Chip(
          avatar: Icon(
            Icons.close,
            size: 9,
            color: Colors.white,
          ),
          label: Text('Luk'),
        ),
        const Chip(
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
          name: S.current.detailScreenTomatoSauceText,
          price: 20,
          imgPath: A.assetsDetailPageOptionalProductImg,
        ),
        OptionalProduct(
          name: S.current.detailScreenCheeseSauceText,
          price: 20,
          imgPath: A.assetsDetailPageOptionalProductImg,
        ),
        OptionalProduct(
          name: S.current.detailScreenCheeseSauceText,
          price: 20,
          imgPath: A.assetsDetailPageOptionalProductImg,
        ),
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: 65,
          color: AppColors.color191A1F,
          child: Row(
            children: [
              Image.asset(widget.imgPath),
              const SizedBox(
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
              const Spacer(),
              Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (_isToogle
                        ? AppColors.colorFF9900
                        : AppColors.color5D6377)),
                child: (_isToogle
                    ? const Icon(
                        Icons.done,
                        size: 15,
                      )
                    : null),
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
          constraints: const BoxConstraints(maxWidth: 170),
          height: 38,
          alignment: Alignment.center,
          color: AppColors.color26282F,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: (_istaped
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.close,
                        size: 9,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(widget.text),
                    ],
                  )
                : Text(
                    widget.text,
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                    ),
                  )),
          ),
        ),
      ),
    );
  }
}
