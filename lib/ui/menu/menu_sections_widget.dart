// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import 'package:medvezhiy_ugol/models/menu.dart';
import 'package:medvezhiy_ugol/pages/menu/basket_menu_page/basket_menu_page.dart';
import 'package:medvezhiy_ugol/services/theme_service.dart';

import '../../../common_setup/routes.dart';
import 'menu_card_widget.dart';

class MenuSection extends StatelessWidget {
  final MenuCategory menuCategory;
  static const double menuSectionWidgetGapValue = 10;

  const MenuSection({
    Key? key,
    required this.menuCategory,
  }) : super(key: key);

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
                menuCategory.name,
                style: ThemeService.tabBarTitleSectionTextStyle(),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          LayoutGrid(
            columnSizes: [1.fr, 1.fr],
            rowSizes: List.generate(
              menuCategory.items.length ~/ 2 + 1,
              (index) => auto,
            ),
            columnGap: 10,
            rowGap: menuSectionWidgetGapValue,
            children: List.generate(
              menuCategory.items.length,
              (i) => MenuCardWidget(
                menuProduct: menuCategory.items[i],
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (sheetContext) => Column(
                        children: [
                          SizedBox(height: 100),
                          Text('sds'),
                          Slidable(
                            // Specify a key if the Slidable is dismissible.
                            key: const ValueKey(0),
                            // The start action pane is the one at the left or the top side.
                            // The end action pane is the one at the right or the bottom side.
                            endActionPane: ActionPane(
                              motion: ScrollMotion(),
                              children: [
                                SlidableAction(
                                  // An action can be bigger than the others.
                                  flex: 2,
                                  onPressed: (value) {

                                  },
                                  backgroundColor: Color(0xFFE64646),
                                  foregroundColor: Colors.white,
                                  icon: Icons.archive,
                                  label: 'Удалить',
                                ),
                              ],
                            ),

                            // The child of the Slidable is what the user sees when the
                            // component is not dragged.
                            child: Container(
                              height: 96,
                              width: double.infinity,
                              color: Color(0xff191A1F),
                              child: Text('Донер с курицей',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.lightBlue
                              ),),
                            ),
                          ),
                        ],
                      )
                  );
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => BasketPage()));
                  // context.pushNamed(
                  //   Routes.detailMenuName,
                  //   params: {'id': menuCategory.items[i].id},
                  // );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
