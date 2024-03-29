import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medvezhiy_ugol/pages/more/auth/auth_page/auth_page.dart';
import 'package:medvezhiy_ugol/ui/widgets/loading.dart';
import 'package:medvezhiy_ugol/ui/widgets/sheets/menu_sheets/address_confirmation_sheet.dart';
import 'package:medvezhiy_ugol/ui/widgets/sheets/menu_sheets/my_addresses_sheet.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../services/auth_service.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/delivery_switcher.dart';
import '../../widgets/menu/menu_sections_widget.dart';
import '../../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import '../../widgets/menu/scale_tabbar_module.dart';
import '../../widgets/sheets/menu_sheets/basket_sheet.dart';

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
    Future.delayed(const Duration(milliseconds: 150)).then((value) =>
        _controller.scrollToIndex(1, preferPosition: AutoScrollPosition.begin,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff111216),
        body: BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Loading();
            }
            else {
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
                        DeliverySwitcher(
                          onDelivery: () {},
                          onTakeaway: () {},
                        ),
                        GestureDetector(
                          onTap: () {
                            state.myAddress == null
                                ? showModalBottomSheet(
                              context: context.read<CustomNavbarCubit>().state.context!,
                              backgroundColor: Colors.transparent,
                              builder: (sheetContext) => Padding(
                                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                                child: const MyAddressesSheet()),
                            )
                                : showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (sheetContext) => Container(
                                  height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                                  alignment: Alignment.topCenter,
                                  child: const AddressConfirmationSheet(),
                                )
                            );
                          },
                          child: Container(
                            color: Colors.transparent,
                            height: 55,
                            child: !state.isTakeaway
                                ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (state.myAddress != null)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 7),
                                    child: SvgPicture.asset('assets/images/dining.svg'),
                                  ),
                                Text(
                                  state.myAddress == null ? "Указать адрес доставки" : state.myAddress!.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: state.myAddress == null ? AppColors.colorFF9900 : AppColors.colorFFFFFF,
                                  ),
                                ),
                                const SizedBox(width: 7),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: state.myAddress == null ? AppColors.colorFF9900 : AppColors.colorFFFFFF,
                                  size: 8.67,
                                )
                              ],
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
                                      child: const BasketSheet()
                                  )
                              );
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 34,
                                width: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.color26282F,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(14),
                                  ),
                                ),
                                child: Text(
                                  'Доставка 178 ₽',
                                  style: TextStyle(
                                    color: AppColors.color808080,
                                  ),
                                ),
                              ),
                              Container(
                                  color: AppColors.colorFFB627,
                                  height: 56,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.5, vertical: 17.5),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Заказать',
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
                            ],
                          ),
                        )
                    )
                ],
              );
            }
          },
        )
    );
  }
}
