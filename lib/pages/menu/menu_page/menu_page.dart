import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common_setup/routes.dart';
import '../../../utils/app_colors.dart';
import '../../../ui/menu/menu_sections_widget.dart';
import '../../../ui/menu/scale_tabbar_module.dart';
import '../../../ui/toggle_switcher/toggle_switcher_widget.dart';
import '../basket_menu_page/basket_menu_page.dart';
import 'bloc/menu_bloc.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  late List<List<int>> indexList;
  final Color taBarBackgroundColor = AppColors.color111216;

  int goIndex() {
    return 1;
  }

  void onAddressTap() {
    context.go(Routes.map);
  }

  @override
  void initState() {
    context.read<MenuBloc>().tabController = TabController(
        length: context.read<MenuBloc>().menu.length, vsync: this);
    context.read<MenuBloc>().listController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: Axis.vertical,
    );
    super.initState();
  }

  @override
  void dispose() {
    print('end menu');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuBloc, MenuState>(
      listener: (context, state) {
        if (state is MenuLoadedState) {
          context.read<MenuBloc>().tabController = TabController(
            length: state.menu.length,
            vsync: this,
          );
        }
      },
      builder: (context, state) {
        if (state is MenuLoadedState) {
          return _loadedBuildBody(state: state);
        } else if (state is MenuLoadingState) {
          return _loadingBuildBody();
        } else if (state is MenuLoadingErrorState) {
          return _loadingErrorBuildBody();
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _loadedBuildBody({required MenuLoadedState state}) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          // const ToggleSwitcher(),
          const SizedBox(
            height: 6,
          ),
          // GestureDetector(
          //   onTap: onAddressTap,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       const Icon(
          //         ToggleSwitcherIcons.vector,
          //         size: 12,
          //       ),
          //       const SizedBox(
          //         width: 10,
          //       ),
          //       const Text(
          //         'Ул. Свободы, д. 46/3',
          //         style: TextStyle(
          //           fontSize: 12,
          //           fontWeight: FontWeight.w400,
          //           color: AppColors.colorEFEFEF,
          //         ),
          //       ),
          //       Container(
          //         decoration: const BoxDecoration(
          //           shape: BoxShape.circle,
          //         ),
          //         child: Material(
          //           color: Colors.transparent,
          //           shape: const CircleBorder(),
          //           child: InkWell(
          //             onTap: onAddressTap,
          //             customBorder: const CircleBorder(),
          //             child: Ink(
          //               decoration: const BoxDecoration(shape: BoxShape.circle),
          //               height: 20,
          //               width: 20,
          //               child: const Icon(
          //                 Icons.chevron_right,
          //                 size: 20,
          //               ),
          //             ),
          //           ),
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          _buildTabBar(context, state),
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
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                controller: context.read<MenuBloc>().listController,
                itemCount: state.menu.length,
                separatorBuilder: (context, i) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemBuilder: (context, i) {
                  return AutoScrollTag(
                    key: ValueKey(i),
                    controller: context.read<MenuBloc>().listController,
                    index: i,
                    child: MenuSection(
                      menuCategory: state.menu[i],
                    ),
                  );
                },
              ),
            ),
          ),
          (state.order.isNotEmpty)
              ? Container(
                  color: AppColors.colorFFB627,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => context.push(Routes.basket),
                      child: SizedBox(
                        height: 56,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.5, vertical: 17.5),
                          child: Center(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Оформить заказ',
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
                                    color: AppColors.color808080,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  Widget _loadingBuildBody() {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          // const ToggleSwitcher(),
          const SizedBox(
            height: 6,
          ),
          Shimmer.fromColors(
            baseColor: AppColors.color111216,
            highlightColor: AppColors.color5D6377.withOpacity(0.5),
            child: Container(
              height: 20,
              width: 2 * 70 + 30,
              decoration: BoxDecoration(
                  color: AppColors.color26282F,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Shimmer.fromColors(
            baseColor: AppColors.color111216,
            highlightColor: AppColors.color5D6377.withOpacity(0.5),
            child: Container(
              height: 25,
              decoration: BoxDecoration(
                color: AppColors.color26282F,
                // borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
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
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                controller: context.read<MenuBloc>().listController,
                itemCount: 3,
                separatorBuilder: (context, i) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                itemBuilder: (context, i) {
                  return Shimmer.fromColors(
                    baseColor: AppColors.color111216,
                    highlightColor: AppColors.color5D6377.withOpacity(0.5),
                    child: Container(
                      height: 200,
                      color: AppColors.color26282F,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loadingErrorBuildBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Ошибка, попробуйте повторить.'),
          IconButton(
            onPressed: () {
              setState(() {
                context.read<MenuBloc>().add(MenuLoadingEvent());
              });
            },
            icon: const Icon(
              color: AppColors.color808080,
              Icons.refresh_rounded,
            ),
            highlightColor: AppColors.color191A1F,
            splashColor: AppColors.color191A1F,
            splashRadius: 20,
          ),
        ],
      ),
    );
  }

  Material _buildTabBar(BuildContext context, MenuLoadedState state) {
    return Material(
      color: Colors.transparent,
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.fromSwatch(
            accentColor: AppColors.color191A1F,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ScaleTabBar(
            onTap: (value) {
              _scrollToCounter(value);
              context.read<MenuBloc>().tabController.index = value;
            },
            controller: context.read<MenuBloc>().tabController,
            tabs: state.menuTabs,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: const TextStyle(
              fontSize: 24,
              fontFamily: 'Unbounded',
              fontWeight: FontWeight.w600,
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
      ),
    );
  }

  Future _scrollToCounter(int index) async {
    await context
        .read<MenuBloc>()
        .listController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
  }
}
