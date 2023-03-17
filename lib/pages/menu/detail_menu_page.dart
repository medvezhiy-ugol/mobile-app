import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/utils/app_fonts.dart';

import '../../generated/l10n.dart';
import '../../services/theme_service.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class DetailMenuPage extends StatelessWidget {
  DetailMenuPage({super.key, required this.id});

  final ThemeService themeService = Injector().get<ThemeService>();

  final String id;

  final int productCoast = 220;
  final String productName = 'Донер ';

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
    return Dismissible(
      direction: DismissDirection.vertical,
      onDismissed: (_) => context.pop(),
      key: UniqueKey(),
      child: Padding(
        padding: const EdgeInsets.only(top: 22.0),
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: <Widget>[
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: Container(
                    width: 48,
                    height: 4,
                    decoration: BoxDecoration(
                        color: AppColors.colorD9D9D9.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(9)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Image.asset(A.assetsDetailPageProductImg),
                          const SizedBox(
                            height: 38,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Text(
                                      productName + id,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppFonts.unbounded,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                                Container(
                                  color: AppColors.color26282F,
                                  height: 50,
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: Center(
                                        child: Text(
                                          '$productCoast ₽   ${S.current.mealScreenDeleteAddTitleText}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        outputProductIngredients,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.color808080,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 15),
                                buildStatsBar(),
                                const SizedBox(height: 15),
                                Row(
                                  children: [
                                    Text(
                                      S.current
                                          .mealScreenDeleteIngredientsTitleText,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                buildChoiceComponent(),
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
                                buildAddProduct(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildStatsBar() {
    return Row(
      children: <Widget>[
        buildStatsBarItem(S.current.mealScreenWeightTitleText, '300 г'),
        const SizedBox(width: 8),
        buildStatsBarItem(S.current.mealScreenCaloriesTitleText, '588 г'),
        const Spacer(),
        buildStatsBarItem(S.current.mealScreenProteinTitleText, '23 г'),
        const SizedBox(width: 8),
        buildStatsBarItem(S.current.mealScreenFatsTitleText, '24 г'),
        const SizedBox(width: 8),
        buildStatsBarItem(S.current.mealScreenCarbohydratesTitleText, '68 г'),
      ],
    );
  }

  Widget buildStatsBarItem(String title, String value) {
    return IntrinsicWidth(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.color808080,
            ),
          ),
          const SizedBox(height: 2),
          Container(
            alignment: Alignment.center,
            height: 38,
            padding: const EdgeInsets.all(10),
            color: AppColors.color191A1F,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildChoiceComponent() {
    bool _ch = false;
    return Wrap(
      direction: Axis.horizontal,
      spacing: 3,
      runSpacing: 3,
      children: [
        RawChip(
          label: Text(
            'Luk',
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

  Widget buildAddProduct() {
    return Column(
      children: [
        OptionalProduct(
          name: S.current.detailScreenTomatoSauceText,
          price: 20,
          imgPath: A.assetsDetailMenuPageOptionalProductImg,
        ),
        OptionalProduct(
          name: S.current.detailScreenCheeseSauceText,
          price: 20,
          imgPath: A.assetsDetailMenuPageOptionalProductImg,
        ),
        OptionalProduct(
          name: S.current.detailScreenCheeseSauceText,
          price: 20,
          imgPath: A.assetsDetailMenuPageOptionalProductImg,
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
