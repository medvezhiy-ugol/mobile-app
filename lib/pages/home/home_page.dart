import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/pages/stock/slot_machine_widget/slot_machine_widget.dart';

import '../../common_setup/routes.dart';
import '../../services/theme_service.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: AppColors.color191A1F,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: const [
                //         SizedBox(height: 32,),
                //         Text(
                //           'Адрес и время доставки',
                //           style: TextStyle(
                //             fontSize: 10,
                //             fontWeight: FontWeight.w400,
                //             color: AppColors.color808080,
                //           ),
                //         ),
                //         Text(
                //           'Республиканская ул. 68',
                //           style: TextStyle(
                //             fontSize: 16,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // SizedBox(
                //   height: 160,
                //   child: ListView.separated(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: 3,
                //     itemBuilder: (BuildContext context, int index) {
                //       return Material(
                //         color: Colors.transparent,
                //         child: InkWell(
                //           onTap: () => context.push(Routes.detailStock),
                //           child: SizedBox(
                //             width: 300,
                //             height: 150,
                //             child: Image.asset(
                //               A.assetsHomePagePromoImg,
                //               fit: BoxFit.fill,
                //             ),
                //           ),
                //         ),
                //       );
                //     },
                //     separatorBuilder: (BuildContext context, int index) =>
                //         const SizedBox(
                //       width: 5,
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 30,
                ),
                // _buildOrderStatusTimerWidget(context),
                // const SizedBox(
                //   height: 10,
                // ),
                // _buildOrderStatusWidget(),
                // const SizedBox(
                //   height: 32,
                // ),
                _buildLoyaltyCard(height: 180, context: context),
                const SizedBox(
                  height: 28,
                ),
                Row(
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
                        context.go(Routes.menu);
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
                const SizedBox(
                  height: 12,
                ),
                _buildPopularSegmentWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopularSegmentWidget() {
    return LayoutGrid(
      columnSizes: [1.fr, 1.fr],
      rowSizes: List.generate(
        2,
        (index) => auto,
      ),
      columnGap: 10,
      rowGap: 10,
      children: <Widget>[
        _buildCardPopularProduct(
          description: '',
          name: "Пицца 5 сыров",
          onTap: () {},
          price: 330,
          srcImg:
              "https://102922.selcdn.ru/ecomm/440-423-641/65994/10369/images/items/1d295a21eeb77c07174e34350d67a471.PNG",
          weight: 450,
        ),
        _buildCardPopularProduct(
          description: '',
          name: "Донер с курицей в булке",
          onTap: () {},
          price: 200,
          srcImg:
              "https://102922.selcdn.ru/ecomm/440-423-641/65994/10369/images/items/3eb8302f3c471fa41fea8a18f62d63e1.PNG",
          weight: 450,
        ),
      ],
    );
  }

  Widget _buildCardPopularProduct({
    required String srcImg,
    required String name,
    required double weight,
    required String description,
    required int price,
    required VoidCallback onTap,
  }) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: AppColors.color191A1F,
      ),
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              SizedBox(
                height: 125,
                width: double.infinity,
                child: Image.network(
                  srcImg,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 6),
                child: SizedBox(
                  height: 175 - 6,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                name,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    ThemeService.detailPageAddButtonTextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '$weight г.',
                          style: ThemeService.tabBarCardWeightTextStyle(),
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              description == ''
                                  ? 'Состав отсутствует'
                                  : description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: ThemeService.tabBarCardIngrTextStyle(),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 74,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.color26282F,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            '$price ₽',
                            style: ThemeService
                                .detailPageStatusBarItemCountTextStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoyaltyCard(
      {required double height, required BuildContext context}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(A.assetsHomePageLoyaltyCardBackgroundImg),
          fit: BoxFit.fill,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            context.push(Routes.loaltyCard);
          },
          child: Stack(
            children: <Widget>[
              Align(
                alignment: const Alignment(0.70, -0.8),
                child: Container(
                  child: const Text(
                    'Карта лояльности',
                    style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.6, -0.35),
                child: Container(
                  child: const Text(
                    'USER',
                    style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.25, 0.1),
                child: Container(
                  child: const Text(
                    '9834',
                    style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlotMachineWidget() {
    return const SlotMachineWidget();
  }

  Widget _buildOrderStatusTimerWidget(BuildContext context) {
    return Container(
      color: AppColors.color191A1F,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => context.push(Routes.activeOrderPage),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Заказ принят',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '23:42',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const LineralProgresBarWidget(
                    height: 5,
                    width: 115,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  orderStages(),
                ],
              ),
            ),
          ),
        ),
      ),
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
            A.assetsActiveOrderPageForming,
            width: 32,
          ),
          (progressValue > 1)
              ? Image.asset(A.assetsActiveOrderPageCookingOn, width: 32)
              : Image.asset(A.assetsActiveOrderPageCookingOff, width: 32),
          (progressValue == 3)
              ? Image.asset(A.assetsActiveOrderPageDeliveryOn, width: 32)
              : Image.asset(A.assetsActiveOrderPageDeliveryOff, width: 32)
        ],
      ),
    );
  }

  Widget _buildOrderStatusWidget() {
    const double height = 147;
    return Container(
      color: AppColors.color191A1F,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: constraints.maxWidth / 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Ваш заказ №',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.color808080,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'D-72',
                        style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.w600,
                            color: AppColors.colorE1E1E1),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth / 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        'Очередь заказов',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.color808080,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'L-10\nP-12\nD-55\nD-72\n',
                        softWrap: true,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.color808080,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
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
