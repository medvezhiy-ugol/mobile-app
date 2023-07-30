import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/ui/widgets/home/popular_item.dart';
import '../../../services/auth_service.dart';
import '../../../services/loalty_service.dart';
import '../../close_circle_button.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/flip_countdown_clock.dart';
import '../product_page.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  Widget test = Container();

  late final Timer timer;

  int _index = 1;

  final PageController _controller = PageController(
      viewportFraction: 0.8,
      initialPage: 1
  );

  final loyaltyCardService = Injector().get<LoyaltyCardService>();
  final authService = Injector().get<AuthService>();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        const Duration(seconds: 5),
            (timer) {
          if (_index == 4) {
            _controller.animateToPage(
              0,
                duration: const Duration(milliseconds: 250),
                curve: Curves.ease
            );
            _index = 0;
          }
          else {
            _controller.nextPage(
                duration: const Duration(milliseconds: 250),
                curve: Curves.ease
            );
            _index++;
          }
            }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff000000),
        body: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch(
              accentColor: AppColors.color191A1F,
            ),
          ),
          child: SafeArea(
            child: BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
  builder: (context, state) {
    return ListView(
              children: [
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            'Адрес и время доставки',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: AppColors.color808080,
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            'Укажите адрес',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff)
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Джекпот',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xfffffffff)
                            ),
                          ),
                          SizedBox(
                            height: 110,
                            width: 250,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.asset(
                                    'assets/images/drum.png',
                                  fit: BoxFit.cover,
                                  height: 110,
                                  width: 250,
                                ),
                                Positioned(
                                  right: 12.5,
                                  bottom: 29,
                                  child: FlipCountdownClock(
                                    duration: const Duration(days: 1),
                                    digitSize: 36.0,
                                    width: 30.0,
                                    height: 61.0,
                                    digitSpacing: const EdgeInsets.symmetric(horizontal: 1),
                                    separatorWidth: 0,
                                    digitColor: const Color(0xff26252B),
                                    backgroundColor: const Color(0xffF3CF7F),
                                    onDone: () => print('Buzzzz!'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Осталось ',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 10,
                              color: Color(0xff808080)
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 46,
                      ),
                      authService.accessToken == ""
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          height: 180,
                          color: const Color(0xff191A1F),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 63,
                                    left: 21,
                                    right: 16
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "У вас нет",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xffFFFFFF)
                                      ),
                                    ),
                                    const Text(
                                      "карты",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xffFFFFFF)
                                      ),
                                    ),
                                    const Text(
                                      "лояльности :(",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xffFFFFFF)
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 13,
                                    ),
                                    GestureDetector(
                                      onTap: () => context.read<CustomNavbarCubit>().changeIndex(4),
                                      child: const Text(
                                        "Войдите, чтобы получить",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8,
                                          color: Color(0xffFFFFFF),
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                "assets/images/home_page/no_loyalty_card.png",
                                height: 180,
                                width: 180,
                              )
                            ],
                          ),
                        ),
                      )
                          : Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              height: 180,
                              color: const Color(0xff191A1F),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 8,
                                      left: 10.34,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Карта лояльности",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10,
                                              color: Color(0xffEFEFEF)
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 19,
                                        ),
                                        Text(
                                          state.card!.name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Color(0xffFFFFFF)
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 33,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${state.card!.walletBalances[0].balance} ",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Color(0xffEFEFEF)
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 1,
                                            ),
                                            const Text('бонусов',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 10,
                                                  color: Color(0xffEFEFEF)
                                              ),
                                            ),
                                            // Text(
                                            //   "9834",
                                            //   style: TextStyle(
                                            //       fontWeight: FontWeight.w600,
                                            //       fontSize: 9.14286,
                                            //       color: Color(0xffFFFFFF)
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        const Text('Bronze',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xffEFEFEF)
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset("assets/images/home_page/loyalty_card4.png")
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
                SizedBox(
                  height: 186,
                  child: PageView.builder(
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: state.context!,
                              isScrollControlled: true,
                              builder: (context) => Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuery.of(state.context!).padding.top
                                ),
                                child: Container(
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
                                            child: Text('Условия достаки',
                                              style: TextStyle(
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
                                ),
                              ),
                            );
                          },
                          child: Image.asset(
                            [
                              'assets/images/home_page/Большая шаурма.png',
                              'assets/images/home_page/Вок0.png',
                              'assets/images/home_page/Золотая шаурма.png',
                              'assets/images/home_page/Пицца мафия.png',
                              'assets/images/home_page/promo_img.png'
                            ][index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  )
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    context.read<CustomNavbarCubit>().changeIndex(2);
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Популярно',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColors.colorE3E3E3,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context.read<CustomNavbarCubit>().changeIndex(2);
                              },
                              child: const Text(
                                'Все',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.color808080,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      LayoutGrid(
                        columnSizes: [1.fr, 1.fr],
                        rowSizes: List.generate(
                          2,
                              (index) => auto,
                        ),
                        columnGap: 10,
                        rowGap: 10,
                        children: [
                          for (var category in state.menu)
                            for (var item in category.items)
                              if (item.name == 'Пицца Мафия' || item.name == 'В булке Говядина')
                                GestureDetector(
                                  onTap: () async {
                                    final addToOrder = await showModalBottomSheet(
                                        context: state.context!,
                                        isScrollControlled: true,
                                        builder: (sheetContext) => Container(
                                          color: const Color(0xff000000),
                                          padding: EdgeInsets.only(
                                            top: MediaQuery.of(state.context!).padding.top,
                                          ),
                                          child: ProductPage(id: item.id),
                                        )
                                    );
                                    if (addToOrder) {
                                      context.read<CustomNavbarCubit>().changeIndex(2);
                                    }
                                  },
                                  child: PopularItem(
                                    srcImg: item.itemSizes[0].buttonImageUrl!,
                                    name: item.name,
                                    description: item.description,
                                    price: item.itemSizes[0].prices[0].price,
                                    isBadge: false,
                                  ),
                                )
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 76),
              ],
            );
  },
),
          ),
        )
    );
  }

  Widget orderStages({int progressValue = 1}) {
    // progressValue принимает от 1 до 3 включительно
    return SizedBox(
      width: 148,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/active_order_page/forming.png',
            width: 32,
          ),
          (progressValue > 1)
              ? Image.asset('assets/images/active_order_page/cooking_on.png', width: 32)
              : Image.asset('assets/images/active_order_page/cooking_off.png', width: 32),
          (progressValue == 3)
              ? Image.asset('assets/images/active_order_page/delivery_on.png', width: 32)
              : Image.asset('assets/images/active_order_page/delivery_off.png', width: 32)
        ],
      ),
    );
  }
}

class LineralProgresBarWidget extends StatefulWidget {
  const LineralProgresBarWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<LineralProgresBarWidget> createState() =>
      _LineralProgresBarWidgetState();
}

class _LineralProgresBarWidgetState extends State<LineralProgresBarWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: LinearProgressIndicator(
        value: controller.value,
        color: AppColors.colorFF9900,
      ),
    );
  }
}