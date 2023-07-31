import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../services/menu_service.dart';
import '../../services/theme_service.dart';
import '../close_circle_button.dart';
import '../../utils/app_colors.dart';
import '../../pages/menu/detail_menu_page/bloc/menu_detail_bloc.dart';
import '../widgets/menu/ingredient.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id});

  final String id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final ThemeService themeService = Injector().get<ThemeService>();

  final MenuService menuService = Injector().get<MenuService>();

  int _count = 0;

  bool isHalf = false;

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
                      _buildCachedImg(state),
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
                                  color: Color(0xffffffff)
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
                                color: AppColors.color808080,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      isHalf = false;
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      height: 38,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: isHalf ? Color(0xff000000) : Color(0xff2a2c2f)
                                      ),
                                    child:
                                      Text('Целая',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffffffff)
                                      ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      isHalf= true;
                                      setState(() {

                                      });
                                    },
                                    child: Container(
                                      height: 38,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: isHalf ? Color(0xff2a2c2f) : Color(0xff000000)
                                      ),
                                      child:
                                      Text('Половина',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xffffffff)
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            const SizedBox(height: 14),
                            buildStatsBar(
                              state.menuProduct.itemSizes.first
                                  .portionWeightGrams
                                  .toString(),
                              state.menuProduct.itemSizes.first
                                  .nutritionPerHundredGrams.energy
                                  .toString(),
                              state.menuProduct.itemSizes.first
                                  .nutritionPerHundredGrams.proteins
                                  .toString(),
                              state.menuProduct.itemSizes.first
                                  .nutritionPerHundredGrams.fats
                                  .toString(),
                              state.menuProduct.itemSizes.first
                                  .nutritionPerHundredGrams.carbs
                                  .toString(),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            Text('Убрать инденгрендиенты',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xffffffff)
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Wrap(
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
                            SizedBox(
                              height: 14,
                            ),
                            Text('Добавить',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xffffffff)
                              ),),
                            SizedBox(
                              height: 11,
                            ),
                            _buildAddProduct()
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
                            decoration: BoxDecoration(
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
                            Text(
                              "Добавить",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xff000000),
                              ),
                            ),
                            Text(
                              '${state.menuProduct.itemSizes.first.prices.first.price} ₽',
                              style: TextStyle(
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

  Widget _buildCachedImg(MenuDetailLoadedState state) {
    if (state.menuProduct.itemSizes.first.buttonImageUrl != null) {
      return CachedNetworkImage(
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
      );
    } else {
      return Container(
        height: 200,
        color: AppColors.color26282F,
      );
    }
  }

  Row buildStatsBar(String weight, String calories, String protein, String fats,
      String carbohydrates) {
    return Row(
      children: <Widget>[
        buildStatsBarItem("Вес", '$weight г'),
        const SizedBox(width: 8),
        buildStatsBarItem("Ккал", '$calories г'),
        const Spacer(),
        buildStatsBarItem("Белки", '$protein г'),
        const SizedBox(width: 8),
        buildStatsBarItem("Жиры", '$fats г'),
        const SizedBox(width: 8),
        buildStatsBarItem("Углеводы", '$carbohydrates г'),
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

  Widget _buildAddProduct() {
    return Column(
      children: <Widget>[
        OptionalProduct(
          name: "Томатный соус",
          price: 20,
          imgPath: 'assets/images/detail_menu_page/souse.png',
        ),
        const SizedBox(
          height: 2,
        ),
        OptionalProduct(
          name: "Сырный соус",
          price: 20,
          imgPath: 'assets/images/detail_menu_page/souse.png',
        ),
        const SizedBox(
          height: 2,
        ),
        OptionalProduct(
          name: "Сырный соус",
          price: 20,
          imgPath: 'assets/images/detail_menu_page/souse.png',
        ),
        const SizedBox(
          height: 100,
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
                    Text(
                        widget.name,
                      style: TextStyle(
                        color: Color(0xffFFFFFF)
                      ),
                    ),
                    Text(
                        '+ ${widget.price} Р',
                      style: TextStyle(
                          color: Color(0xffFFFFFF)
                      ),
                    ),
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
