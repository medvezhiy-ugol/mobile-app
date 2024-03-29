import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/ui/widgets/dotted_circle.dart';
import 'package:shimmer/shimmer.dart';
import '../../services/menu_service.dart';
import '../../services/theme_service.dart';
import '../close_circle_button.dart';
import '../../utils/app_colors.dart';
import '../../pages/menu/detail_menu_page/bloc/menu_detail_bloc.dart';
import '../widgets/product_page/additional_product.dart';
import '../widgets/product_page/ingredient.dart';
import '../widgets/product_page/product_size.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id, required this.isPizza});

  final String id;
  final bool isPizza;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ThemeService themeService = Injector().get<ThemeService>();

  final MenuService menuService = Injector().get<MenuService>();

  int _count = 1;
  bool isBig = true;

  List<bool> additionalProducts = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false];
  int additionalProductsPrice = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuDetailBloc(menuService: menuService, id: widget.id),
      child: BlocBuilder<MenuDetailBloc, MenuDetailState>(
        builder: (blocContext, state) {
          if (state is MenuDetailLoadedState) {
            return _buildLoadedBody(blocContext, state);
          } else if (state is MenuDetailErrorState) {
            return _buildErrorBody(blocContext);
          } else if (state is MenuDetailLoadingState) {
            return _buildLoadingBody(blocContext);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildLoadingBody(BuildContext blocContext) {
    return Container(
      color: const Color(0xff000000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          CloseCircleButton(
            onTap: () => Navigator.of(context).pop(),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: Scrollbar(
              child: ListView(
                children: <Widget>[
                  Shimmer.fromColors(
                    baseColor: AppColors.color111216,
                    highlightColor: AppColors.color5D6377.withOpacity(0.5),
                    child: Container(
                      height: 220,
                      color: AppColors.color26282F,
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Shimmer.fromColors(
                          baseColor: AppColors.color111216,
                          highlightColor:
                          AppColors.color5D6377.withOpacity(0.5),
                          child: Container(
                            height: 35,
                            color: AppColors.color26282F,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Shimmer.fromColors(
                          baseColor: AppColors.color111216,
                          highlightColor:
                          AppColors.color5D6377.withOpacity(0.5),
                          child: Container(
                            height: 50,
                            color: AppColors.color26282F,
                          ),
                        ),
                        Container(
                          height: 25,
                        ),
                        Shimmer.fromColors(
                          baseColor: AppColors.color111216,
                          highlightColor:
                          AppColors.color5D6377.withOpacity(0.5),
                          child: Container(
                            height: 60,
                            color: AppColors.color26282F,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Shimmer.fromColors(
                          baseColor: AppColors.color111216,
                          highlightColor:
                          AppColors.color5D6377.withOpacity(0.5),
                          child: Container(
                            height: 100,
                            color: AppColors.color26282F,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadedBody(BuildContext blocContext, MenuDetailLoadedState state) {
    additionalProductsPrice = 0;
    for (int i = 0; i < additionalProducts.length; i++) {
      if (additionalProducts[i]) {
        additionalProductsPrice += 30;
      }
    }
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            CloseCircleButton(
              onTap: () => Navigator.of(context).pop(),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: [
                          const DottedCircle(),
                          CachedNetworkImage(
                            height: isBig ? MediaQuery.of(context).size.width / 2 : MediaQuery.of(context).size.width / 3,
                            width: isBig ? MediaQuery.of(context).size.width / 2 : MediaQuery.of(context).size.width / 3,
                            imageUrl: state.menuProduct.itemSizes.first.buttonImageUrl ?? '',
                            placeholder: (context, url) => Container(
                              height: 200,
                              color: AppColors.color26282F,
                            ),
                            errorWidget: (context, url, error) => Container(
                              height: 200,
                              color: AppColors.color26282F,
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 38,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              state.menuProduct.name,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Unbounded',
                                  color: AppColors.colorFFFFFF,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              state.menuProduct.description == ''
                                  ? 'Состав отсутствует'
                                  : state.menuProduct.description,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.colorE0E0E0,
                              ),
                            ),
                            const SizedBox(height: 6),
                            if (widget.isPizza)
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      isBig = false;
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      height: 38,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: isBig ? const Color(0xff000000) : Color(0xff2a2c2f)
                                      ),
                                    child: const Text(
                                        'Стандартная',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffffffff),
                                      ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      isBig = true;
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      height: 38,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: isBig ? const Color(0xff2a2c2f) : const Color(0xff000000)
                                      ),
                                      child: const Text(
                                        'Большая',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: <Widget>[
                                ProductSize(
                                  title: "Размер",
                                  value: state.menuProduct.itemSizes.first
                                      .portionWeightGrams
                                      .toString(),
                                ),
                                const SizedBox(width: 8),
                                ProductSize(
                                  title: "Вес",
                                  value: state.menuProduct.itemSizes.first
                                      .portionWeightGrams
                                      .toString(),
                                ),
                                const SizedBox(width: 8),
                                ProductSize(
                                  title: "Ккал",
                                  value: state.menuProduct.itemSizes.first
                                      .nutritionPerHundredGrams.energy
                                      .toString(),
                                ),
                                const SizedBox(width: 8),
                                ProductSize(
                                  title: "БЖУ",
                                  value: '${state.menuProduct.itemSizes.first
                                      .nutritionPerHundredGrams.proteins}/${state.menuProduct.itemSizes.first
                                      .nutritionPerHundredGrams.fats}/${state.menuProduct.itemSizes.first
                                      .nutritionPerHundredGrams.carbs}',
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            const Text(
                              'Убрать инденгрендиенты',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xffffffff),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                Ingredient(text: 'Лук'),
                                Ingredient(text: 'Cалат'),
                                Ingredient(text: 'Огурцы маринованные'),
                                Ingredient(text: 'Соус'),
                                Ingredient(text: 'Томаты'),
                              ],
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              'Добавить ингредиенты',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xffffffff),
                              ),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[0] = !additionalProducts[0]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[0],
                                name: "Соус острый/сырный",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[1] = !additionalProducts[1]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[1],
                                name: "Кетчуп",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[2] = !additionalProducts[2]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[2],
                                name: "Соус чесночный",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[3] = !additionalProducts[3]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[3],
                                name: "Соус сальса",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[4] = !additionalProducts[4]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[4],
                                name: "Картофель фри",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[5] = !additionalProducts[5]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[5],
                                name: "Халапенью",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[6] = !additionalProducts[6]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[6],
                                name: "Сыр",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[7] = !additionalProducts[7]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[7],
                                name: "Маринованный огурец",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[8] = !additionalProducts[8]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[8],
                                name: "Чили Перец",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            const SizedBox(height: 36),
                            const Text(
                              'Заказать отдельно',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xffffffff),
                              ),
                            ),
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[9] = !additionalProducts[9]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[9],
                                name: "Соус острый/сырный",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[10] = !additionalProducts[10]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[10],
                                name: "Кетчуп",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[11] = !additionalProducts[11]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[11],
                                name: "Соус чесночный",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[12] = !additionalProducts[12]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[12],
                                name: "Соус сальса",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[13] = !additionalProducts[13]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[13],
                                name: "Картофель фри",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[14] = !additionalProducts[14]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[14],
                                name: "Халапенью",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[15] = !additionalProducts[15]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[15],
                                name: "Сыр",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[16] = !additionalProducts[16]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[16],
                                name: "Маринованный огурец",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() => additionalProducts[17] = !additionalProducts[17]),
                              child: AdditionalProduct(
                                isTapped: additionalProducts[17],
                                name: "Чили Перец",
                                price: 30,
                                imgPath: 'assets/images/detail_menu_page/souse.png',
                              ),
                            ),
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
        Positioned(
          bottom: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Row(
                children: [
                  Container(
                    color: const Color(0xff26282F),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 29.5
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_count > 0) {
                              _count--;
                            }
                            setState(() {

                            });
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: const BoxDecoration(
                              color: Color(0xff353535),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                        const SizedBox(width: 13),
                        Text(
                          _count.toString(),
                          style: const TextStyle(
                              color: Color(0xffFFFFFF)
                          ),
                        ),
                        const SizedBox(width: 13),
                        GestureDetector(
                          onTap: () {
                            _count++;
                            setState(() {

                            });
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: const BoxDecoration(
                              color: Color(0xff353535),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        for (int i = 1; i < _count; i++) {
                          context.read<CustomNavbarCubit>().addToOrder(state.menuProduct);
                        }
                        context.read<CustomNavbarCubit>().addToOrder(state.menuProduct);
                        Navigator.of(context).pop(true);
                      },
                      child: Container(
                        color: const Color(0xffFFB627),
                        padding: const EdgeInsets.symmetric(
                          vertical: 19.5,
                          horizontal: 26,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Добавить",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                            Text(
                              '${(state.menuProduct.itemSizes.first.prices.first.price * _count / (isBig ? 1 : 1.3) + additionalProductsPrice).toInt()} ₽',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        )
      ],
    );
  }

  Widget _buildErrorBody(BuildContext context) {
    return Container(
      color: Color(0xff000000),
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Ошибка, попробуйте повторить.',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {
                            context.read<MenuDetailBloc>().add(
                                  MenuDetailLoadingEvent(),
                                );
                          },
                          icon: const Icon(
                            color: AppColors.color808080,
                            Icons.refresh_rounded,
                          ),
                          highlightColor: AppColors.color191A1F,
                          splashColor: AppColors.color191A1F,
                          splashRadius: 20,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            color: AppColors.color808080,
                            Icons.arrow_back_rounded,
                          ),
                          highlightColor: AppColors.color191A1F,
                          splashColor: AppColors.color191A1F,
                          splashRadius: 20,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
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
