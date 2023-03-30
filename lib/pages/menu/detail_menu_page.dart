import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/utils/app_fonts.dart';

import '../../generated/l10n.dart';
import '../../services/theme_service.dart';
import '../../ui/close_circle_button.dart';
import '../../ui/primary_button.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class DetailMenuPage extends StatelessWidget {
  DetailMenuPage({super.key, required this.id});

  final ThemeService themeService = Injector().get<ThemeService>();

  final String id;

  final int productCoast = 220;
  final String productName = 'Донер ';

  static List<String> inputProductIngredients = [
    'Аллергены: бедро',
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            CloseCircleButton(
              onTap: () => context.pop(),
            ),
            const SizedBox(
              height: 8,
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
                            PrimaryButton(
                              onTap: () => context.pop(),
                              child: Text(
                                '$productCoast ₽   ${S.current.mealScreenDeleteAddTitleText}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
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
                            const SizedBox(height: 24),
                            buildStatsBar(),
                            const SizedBox(height: 32),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                S.current.mealScreenDeleteIngredientsTitleText,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                                width: double.infinity,
                                child: _buildChoiceComponent()),
                            const SizedBox(height: 24),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                S.current.mealScreenDeleteAddTitleText,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            _buildAddProduct(),
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

  Widget _buildChoiceComponent() {
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.start,
      spacing: 8,
      runSpacing: 8,
      children: const <Widget>[
        ChipComponent(label: 'Лук'),
        ChipComponent(label: 'Чеснок'),
        ChipComponent(label: 'Огурцы маринованные'),
        ChipComponent(label: 'Томаты'),
        ChipComponent(label: 'Соус'),
      ],
    );
  }

  Widget _buildAddProduct() {
    return Column(
      children: <Widget>[
        OptionalProduct(
          name: S.current.detailScreenTomatoSauceText,
          price: 20,
          imgPath: A.assetsDetailMenuPageOptionalProductImg,
        ),
        const SizedBox(
          height: 2,
        ),
        OptionalProduct(
          name: S.current.detailScreenCheeseSauceText,
          price: 20,
          imgPath: A.assetsDetailMenuPageOptionalProductImg,
        ),
        const SizedBox(
          height: 2,
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

class ChipComponent extends StatefulWidget {
  const ChipComponent({super.key, required this.label});

  final String label;

  @override
  State<ChipComponent> createState() => _ChipComponentState();
}

class _ChipComponentState extends State<ChipComponent> {
  bool _isDeleted = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.color26282F,
      height: 36,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _isDeleted = !_isDeleted;
            });
          },
          child: IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  (_isDeleted) ? Icons.add : Icons.close,
                  size: 16,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.label,
                  style: TextStyle(
                    decoration:
                        (_isDeleted) ? TextDecoration.lineThrough : null,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ),
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
    return Container(
      height: 65,
      color: AppColors.color191A1F,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _isToogle = !_isToogle;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
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
