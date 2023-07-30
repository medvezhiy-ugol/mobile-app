import 'package:container_tab_indicator/container_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medvezhiy_ugol/ui/widgets/delivery_switcher.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../../utils/app_colors.dart';
import '../../menu/menu_sections_widget.dart';
import '../../menu/scale_tabbar_module.dart';
import '../../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import '../../../pages/map_page.dart';
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

  int goIndex() {
    return 1;
  }

  void onAddressTap() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapPage()));
  }

  @override
  void dispose() {
    print('end menu');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
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
                const DeliverySwitcher(),
                const SizedBox(
                  height: 6,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ScaleTabBar(
                    onTap: (value) {
                      _controller.scrollToIndex(value);
                    },
                    controller: TabController(
                        length: tabs.length,
                        vsync: this
                    ),
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
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      controller: _controller,
                      itemCount: state.menu.length,
                      separatorBuilder: (context, i) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
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
                  showModalBottomSheet(
                      context: state.context!,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => Container(
                          color: const Color(0xff111216),
                          margin: EdgeInsets.only(top: MediaQuery.of(state.context!).padding.top),
                          child: BasketPage()
                      )
                  );
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
