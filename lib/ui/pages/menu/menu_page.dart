import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/pages/more/auth/auth_page/auth_page.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../services/auth_service.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/menu/menu_sections_widget.dart';
import '../../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import '../../widgets/menu/scale_tabbar_module.dart';
import 'basket_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  late List<List<int>> indexList;
  final Color taBarBackgroundColor = AppColors.color111216;
  final AutoScrollController _controller = AutoScrollController();
  late final TabController _tabController;
  final AuthService authService = Injector().get<AuthService>();
  bool isDeliver = true;

  int goIndex() {
    return 1;
  }

  @override
  void initState() {
    _tabController = TabController(
        length: 4,
        vsync: this,
        initialIndex: 1
    );
    Future
        .delayed(const Duration(milliseconds: 150))
        .then((value) => _controller.scrollToIndex(
        1,
        preferPosition: AutoScrollPosition.begin,
    ));
    super.initState();
  }

  @override
  void dispose() {
    print('end menu');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff111216),
        body: BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
          builder: (context, state) {
            List<String> tabs = [];
            for (var category in state.menu) {
              tabs.add(category.name);
            }
            return Stack(
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 38,
                        width: 240,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: const Color(0xff000000),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Stack(
                            fit: StackFit.expand,
                            children: [
                              AnimatedPositioned(
                                left: isDeliver ? 0 : 118,
                                duration: const Duration(milliseconds: 100),
                                child: Container(
                                  height: 30,
                                  width: 114,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff2D2D2D),
                                      borderRadius: BorderRadius.circular(30)
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  GestureDetector(onTap: () {
                                    isDeliver = true;
                                    setState(() {

                                    });
                                  },
                                    child: Container(
                                      width: 114,
                                      height: 30,
                                      color: Colors.transparent,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Доставка',
                                        style: TextStyle(
                                          fontFamily: 'Unbounded',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Color(0xffFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  GestureDetector(onTap: () {
                                    isDeliver  = false;
                                    setState(() {

                                    });
                                  },
                                    child: Container(
                                      width: 114,
                                      height: 30,
                                      color: Colors.transparent,
                                      alignment: Alignment.center,
                                      child: const Text(
                                        'Самовывоз',
                                        style: TextStyle(
                                          fontFamily: 'Unbounded',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Color(0xffFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => Column(
                                children: [
                                  Container(
                                    height: 4,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      color: const Color(0xffD9D9D9)
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    color: AppColors.color191A1F,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 24,
                                              left: 16,
                                            bottom: 23,
                                          ),
                                          child: Text(
                                            'Мои адреса',
                                            style: TextStyle(
                                              color: AppColors.colorEFEFEF,
                                              fontFamily: 'Unbounded',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                          );
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: 55,
                          child: isDeliver
                              ? BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
                            builder: (context, state) {
                              return state.adress.isEmpty
                                  ? const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Указать адрес доставки",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xffFF9900),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xffFF9900),
                                    size: 8.67,
                                  )
                                ],
                              )
                                  : Container();
                            },
                          )
                              : Container(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ScaleTabBar(
                          onTap: (value) {
                            _controller.scrollToIndex(
                              value,
                              preferPosition: AutoScrollPosition.begin,
                            );
                            _tabController.animateTo(value);
                          },
                          controller: _tabController,
                          tabs: [
                            for (int i = 0; i < tabs.length; i++)
                              Tab(text: tabs[i])
                          ],
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelStyle: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Unbounded',
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                          labelPadding: const EdgeInsets.symmetric(horizontal: 20),
                          unselectedLabelStyle: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Unbounded',
                            fontWeight: FontWeight.w600,
                          ),
                          unselectedLabelColor: Colors.grey,
                          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                          indicator: ContainerTabIndicator(
                            height: 2,
                            radius: BorderRadius.circular(20),
                            color: AppColors.colorFF9900,
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          // indicatorPadding: EdgeInsets.only(bottom: 4),
                        ),
                      ),
                      //_buildTabBar(context, state),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.fromSwatch(
                              accentColor: AppColors.color191A1F,
                            ),
                          ),
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            controller: _controller,
                            itemCount: state.menu.length,
                            itemBuilder: (context, i) {
                              return AutoScrollTag(
                                key: ValueKey(i),
                                controller: _controller,
                                index: i,
                                child: MenuSection(
                                  menuCategory: state.menu[i],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state.order.isNotEmpty)
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 76,
                      child: GestureDetector(
                        onTap: () {
                          if (authService.accessToken.isEmpty) {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AuthPage()));
                          }
                          else {
                            showModalBottomSheet(
                                context: state.context!,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => Container(
                                    color: const Color(0xff111216),
                                    margin: EdgeInsets.only(top: MediaQuery.of(state.context!).padding.top),
                                    child: BasketPage(isDelivery: isDeliver)
                                )
                            );
                          }
                        },
                        child: Container(
                            color: AppColors.colorFFB627,
                            height: 56,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.5, vertical: 17.5),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Заказ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  '${state.orderSum.toInt()} ₽ · ',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                const Text(
                                  '25-30 мин',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )
                        ),
                      )
                  )
              ],
            );
          },
        )
    );
  }
}
