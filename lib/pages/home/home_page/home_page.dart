import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/custom_navbar_bloc_cubit.dart';
import '../../../common_setup/routes.dart';
import '../../../models/loalty_card.dart';
import '../../../services/api_service.dart';
import '../../../services/auth_service.dart';
import '../../../services/loalty_service.dart';
import '../../../services/theme_service.dart';
import '../../../utils/app_colors.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  String name = '';
  String cardId = '';
  String phone = '';
  double cardBalance = 0;

  Widget test = Container();

  @override
  void initState() {
    _initLoaltyCard();
    super.initState();
  }

  Future<void> _initLoaltyCard() async {
    final data = await APIService.getRequest(
      serverIndex: 0,
      request: 'v1/whoiam',
      headers: {"Authorization": "Bearer ${authService.token}"},
    );
    if (data != null) {
      var loyaltyCard = LoaltyCard.fromJson(data);
      cardId = loyaltyCard.id;
      name = loyaltyCard.name;
      cardBalance = loyaltyCard.walletBalances[0].balance;
      phone = loyaltyCard.phone;
      setState(() {

      });
    }
  }

  final PageController _controller = PageController(
      viewportFraction: 0.8,
    initialPage: 1
  );
  final loyaltyCardService = Injector().get<LoyaltyCardService>();
  final authService = Injector().get<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch(
            accentColor: AppColors.color191A1F,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              SizedBox(height: 37),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: const [
              //         SizedBox(
              //           height: 32,
              //         ),
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
              SizedBox(
                height: 180,
                child: PageView.builder(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(Routes.detailStock),
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
                  // separatorBuilder:
                  //     (BuildContext context, int index) =>
                  //         const SizedBox(
                  //   width: 5,
                  // ),
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
                    authService.token == ""
                        ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
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
                                    onTap: () => context.read<CustomNavbarBlocCubit>().changeIndex(4),
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
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 180,
                            color: const Color(0xff191A1F),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 8,
                                    left: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Карта лояльности",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10,
                                            color: Color(0xffEFEFEF)
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        name,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Color(0xffFFFFFF)
                                        ),
                                      ),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(6.88235),
                                                border: Border.all(
                                                  color: Color(0xffFF9900),
                                                )
                                            ),
                                            child: Text(
                                              "Баланс " "$cardBalance",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 9.14286,
                                                  color: Color(0xffFFFFFF)
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3,
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
                                    ],
                                  ),
                                ),
                                Image.asset("assets/images/home_page/loyalty_card.png")
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 13,
                            top: 17,
                            right: 183,
                            bottom: 14,
                          ),
                          child: Text("Данные карты",
                            style: TextStyle(
                                fontWeight:FontWeight.w600,
                                fontSize: 17,
                                color: Color(0xffE3E3E3)
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                            ),
                            height: 100,
                            width: double.infinity,
                            color: Colors.white,
                            // padding: const EdgeInsets.symmetric(
                            //   horizontal: 20,
                            // ),
                            child: SvgPicture.string(
                                Barcode.code128().toSvg(
                                    phone,
                                    width: 500,
                                    height: 100
                                )
                            )
                        ),
                        const SizedBox(
                          height: 46,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Номер карты",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff808080,)
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(cardId,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffe3e3e3)
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text('Баланс баллов',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff808080,)
                              ),
                            ),const SizedBox(
                              height: 4,
                            ),
                            Text("$cardBalance",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xffe3e3e3)
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    //_buildOrderStatusTimerWidget(context),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // _buildOrderStatusWidget(),
                    // const SizedBox(
                    //   height: 32,
                    // ),
                    // _switchLoyaltyCardStates(
                    //   height: 180,
                    //   context: context,
                    //   state: state,
                    // ),
                    const SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.read<CustomNavbarBlocCubit>().changeIndex(2);
                      },
                      child: Column(
                        children: [
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
                                  context.read<CustomNavbarBlocCubit>().changeIndex(2);
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
                          const SizedBox(
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 76),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  // Widget _switchLoyaltyCardStates({
  //   required double height,
  //   required BuildContext context,
  //   required HomeState state,
  // }) {
  //   if (state is HomeAuthState) {
  //     return _buildLoyaltyCard(context: context, height: 180, state: state);
  //   } else if (state is HomeUnAuthState) {
  //     return _buildUnAuthLoyaltyCard(height: 180, context: context);
  //   } else if (state is HomeLoadingLoyaltyCardState) {
  //     return _buildLoadingLoyaltyCard(height: 180);
  //   }
  //   return Container();
  // }

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
          description: 'ролл с микс-крабом и спайси соусом, сливочный сыр, креветка в темпуре, огурец',
          name: "Гренландия рору с сливочным сыром",
          onTap: () {},
          price: 220,
          srcImg:
              "https://102922.selcdn.ru/ecomm/440-423-641/65994/10369/images/items/1d295a21eeb77c07174e34350d67a471.PNG",
          isBadge: false
        ),
        _buildCardPopularProduct(
          description: 'ролл с микс-крабом и спайси соусом, сливочный сыр, креветка в темпуре, огурец',
          name: "Гренландия рору с сливочным сыром",
          onTap: () {},
          price: 220,
          srcImg:
              "https://102922.selcdn.ru/ecomm/440-423-641/65994/10369/images/items/3eb8302f3c471fa41fea8a18f62d63e1.PNG",
          isBadge: false
        ),
      ],
    );
  }

  Widget _buildCardPopularProduct({
    required String srcImg,
    required String name,
    required String description,
    required int price,
    required bool isBadge,
    required VoidCallback onTap,
  }) {
    return Container(
        decoration: const BoxDecoration(
          color: AppColors.color191A1F,
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 125,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.network(
                    srcImg,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      top: 5,
                      left: 10,
                      child: Container(
                        height: 20,
                        width: 26,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xffFF9900),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Text(
                          "%",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 12,
                              color: Color(0xffFFFFFF)
                          ),
                        ),
                      )
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 6),
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
                            style: ThemeService.detailPageAddButtonTextStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
          ],
        )
    );
  }

  // Widget _buildLoyaltyCard({
  //   required double height,
  //   required BuildContext context,
  //   required HomeAuthState state,
  // }) {
  //   return Container(
  //     height: height,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),
  //       image: const DecorationImage(
  //         image: AssetImage(A.assetsHomePageLoyaltyCardBackgroundImg),
  //         fit: BoxFit.fill,
  //       ),
  //     ),
  //     child: Material(
  //       color: Colors.transparent,
  //       child: InkWell(
  //         borderRadius: BorderRadius.circular(20),
  //         onTap: () {
  //           context.push(Routes.loaltyCard);
  //         },
  //         child: Stack(
  //           children: <Widget>[
  //             Align(
  //               alignment: const Alignment(0.70, -0.8),
  //               child: Container(
  //                 child: const Text(
  //                   'Карта лояльности',
  //                   overflow: TextOverflow.fade,
  //                   style: TextStyle(
  //                     fontFamily: 'Unbounded',
  //                     fontSize: 12,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Align(
  //               alignment: const Alignment(0.53, -0.35),
  //               child: Container(
  //                 child: Text(
  //                   (state.name != '') ? '${state.name}' : 'User',
  //                   overflow: TextOverflow.fade,
  //                   style: TextStyle(
  //                     fontFamily: 'Unbounded',
  //                     fontSize: 35,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Align(
  //               alignment: const Alignment(0.25, 0.1),
  //               child: Container(
  //                 child: Text(
  //                   '${state.cardBalance.toString()}',
  //                   overflow: TextOverflow.fade,
  //                   style: TextStyle(
  //                     fontFamily: 'Unbounded',
  //                     fontSize: 15,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildUnAuthLoyaltyCard(
  //     {double height = 180, required BuildContext context}) {
  //   return Container(
  //     height: height,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),
  //       image: const DecorationImage(
  //         image: AssetImage(A.assetsHomePageUnAuthLoyaltyCardBackgroundImg),
  //         fit: BoxFit.fill,
  //       ),
  //     ),
  //     child: Material(
  //       color: Colors.transparent,
  //       child: InkWell(
  //         borderRadius: BorderRadius.circular(20),
  //         onTap: () => context.push(Routes.moreAuth),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildLoadingLoyaltyCard({
  //   required double height,
  // }) {
  //   return Container(
  //     height: height,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),
  //       image: const DecorationImage(
  //         image: AssetImage(A.assetsHomePageLoyaltyCardBackgroundImg),
  //         fit: BoxFit.fill,
  //       ),
  //     ),
  //     child: Material(
  //       color: Colors.transparent,
  //       child: InkWell(
  //         borderRadius: BorderRadius.circular(20),
  //         child: Stack(
  //           children: <Widget>[
  //             Align(
  //               alignment: const Alignment(0.70, -0.8),
  //               child: Container(
  //                 child: const Text(
  //                   'Карта лояльности',
  //                   style: TextStyle(
  //                     fontFamily: 'Unbounded',
  //                     fontSize: 12,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Align(
  //               alignment: const Alignment(0.6, -0.35),
  //               child: Shimmer.fromColors(
  //                 baseColor: AppColors.color4C459E,
  //                 highlightColor: AppColors.color66788E.withOpacity(0.3),
  //                 child: Container(
  //                   height: 45,
  //                   width: 130,
  //                   decoration: BoxDecoration(
  //                       color: AppColors.color4C459E,
  //                       borderRadius: BorderRadius.circular(20)),
  //                 ),
  //               ),
  //             ),
  //             Align(
  //                 alignment: const Alignment(0.25, 0.15),
  //                 child: Shimmer.fromColors(
  //                   baseColor: AppColors.color4C459E,
  //                   highlightColor: AppColors.color66788E.withOpacity(0.3),
  //                   child: Container(
  //                     height: 20,
  //                     width: 60,
  //                     decoration: BoxDecoration(
  //                         color: AppColors.color4C459E,
  //                         borderRadius: BorderRadius.circular(20)),
  //                   ),
  //                 )),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildSlotMachineWidget() {
  //   return const SlotMachineWidget();
  // }
  //
  // Widget _buildOrderStatusTimerWidget(BuildContext context) {
  //   return Container(
  //     color: AppColors.color191A1F,
  //     child: Material(
  //       color: Colors.transparent,
  //       child: InkWell(
  //         onTap: () => context.push(Routes.activeOrderPage),
  //         child: SizedBox(
  //           width: double.infinity,
  //           child: Padding(
  //             padding: const EdgeInsets.all(10.0),
  //             child: Column(
  //               children: <Widget>[
  //                 const Text(
  //                   'Заказ принят',
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.w300,
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 const Text(
  //                   '23:42',
  //                   style: TextStyle(
  //                     fontSize: 32,
  //                     fontWeight: FontWeight.w300,
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 const LineralProgresBarWidget(
  //                   height: 5,
  //                   width: 115,
  //                 ),
  //                 const SizedBox(
  //                   height: 10,
  //                 ),
  //                 orderStages(),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

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

  // Widget _buildOrderStatusWidget() {
  //   const double height = 147;
  //   return Container(
  //     color: AppColors.color191A1F,
  //     child: LayoutBuilder(
  //       builder: (BuildContext context, BoxConstraints constraints) {
  //         return Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             SizedBox(
  //               width: constraints.maxWidth / 2,
  //               child: Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: const [
  //                     Text(
  //                       'Ваш заказ №',
  //                       style: TextStyle(
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.w400,
  //                         color: AppColors.color808080,
  //                       ),
  //                     ),
  //                     SizedBox(height: 5),
  //                     Text(
  //                       'D-72',
  //                       style: TextStyle(
  //                           fontSize: 48,
  //                           fontWeight: FontWeight.w600,
  //                           color: AppColors.colorE1E1E1),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ),
  //             SizedBox(
  //               width: constraints.maxWidth / 2,
  //               child: Padding(
  //                 padding: const EdgeInsets.all(8.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: const [
  //                     Text(
  //                       'Очередь заказов',
  //                       style: TextStyle(
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.w400,
  //                         color: AppColors.color808080,
  //                       ),
  //                     ),
  //                     SizedBox(height: 5),
  //                     Text(
  //                       'L-10\nP-12\nD-55\nD-72\n',
  //                       softWrap: true,
  //                       overflow: TextOverflow.fade,
  //                       style: TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.w600,
  //                         color: AppColors.color808080,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           ],
  //         );
  //       },
  //     ),
  //   );
  // }
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
