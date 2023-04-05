import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../common_setup/routes.dart';
import '../../utils/app_colors.dart';
import '../../utils/icons/toggle_switcher_icons_icons.dart';
import 'bloc/menu_bloc.dart';
import 'tabbar/menu_sections_widget.dart';
import 'tabbar/scale_tabbar_module.dart';
import 'toggle_switcher/toggle_switcher_widget.dart';

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

  Widget _loadingBuildBody() {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }

  Widget _loadingErrorBuildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.change_circle_outlined,
          ),
        )
      ],
    );
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
        if (state is MenuLoadingErrorState) {
          _showSnackBar(context: context, text: state.error);
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
          return Container();
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
          const ToggleSwitcher(),
          const SizedBox(
            height: 6,
          ),
          GestureDetector(
            onTap: onAddressTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  ToggleSwitcherIcons.vector,
                  size: 12,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Ул. Свободы, д. 46/3',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.colorEFEFEF,
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    shape: const CircleBorder(),
                    child: InkWell(
                      onTap: onAddressTap,
                      customBorder: const CircleBorder(),
                      child: Ink(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        height: 20,
                        width: 20,
                        child: const Icon(
                          Icons.chevron_right,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          _buildTabBar(context, state as MenuLoadedState),
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
        ],
      ),
    );
  }

  Material _buildTabBar(BuildContext context, MenuLoadedState state) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch(
              accentColor: AppColors.color191A1F,
            ),
          ),
          child: ScaleTabBar(
            onTap: (value) {
              _scrollToCounter(value);
              context.read<MenuBloc>().tabController.index = value;
            },
            controller: context.read<MenuBloc>().tabController,
            tabs: state.menuTabs,
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: const TextStyle(
                fontSize: 24,
                fontFamily: 'Unbounded',
                fontWeight: FontWeight.w600),
            unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontFamily: 'Unbounded',
                fontWeight: FontWeight.w600),
            unselectedLabelColor: Colors.grey,
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            indicator: ContainerTabIndicator(
              height: 2,
              radius: BorderRadius.circular(20),
              color: AppColors.colorFF9900,
              padding: const EdgeInsets.only(top: 19),
            ),
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

  _showSnackBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
