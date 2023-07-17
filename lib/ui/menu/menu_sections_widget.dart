// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:medvezhiy_ugol/models/menu.dart';
import 'package:medvezhiy_ugol/services/theme_service.dart';
import '../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import '../../pages/menu/detail_menu_page/detail_menu_page.dart';
import 'menu_card_widget.dart';

class MenuSection extends StatefulWidget {
  final MenuCategory menuCategory;
  static const double menuSectionWidgetGapValue = 10;

  const MenuSection({
    Key? key,
    required this.menuCategory,
  }) : super(key: key);

  @override
  State<MenuSection> createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.menuCategory.name,
                style: ThemeService.tabBarTitleSectionTextStyle(),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
  builder: (context, state) {
    return LayoutGrid(
                columnSizes: [1.fr, 1.fr],
                rowSizes: List.generate(
                  widget.menuCategory.items.length ~/ 2 + 1,
                      (index) => auto,
                ),
                columnGap: 10,
                rowGap: MenuSection.menuSectionWidgetGapValue,
                children: List.generate(
                  widget.menuCategory.items.length,
                      (i) =>
                      MenuCardWidget(
                        menuProduct: widget.menuCategory.items[i],
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (sheetContext) => Container(
                                color: Color(0xff000000),
                                padding: EdgeInsets.only(
                                  top: MediaQuery.of(state.context).padding.top,
                                ),
                                child: DetailMenuPage(id: widget.menuCategory.items[i].id),
                              )
                          );
                          // Navigator.of(state.context).push(
                          //     MaterialPageRoute(builder: (context) =>
                          //         DetailMenuPage(
                          //             id: widget.menuCategory.items[i].id
                          //         )));
                        },
                      ),
                ),
              );
  },
)
        ],
      ),
    );
  }
}
