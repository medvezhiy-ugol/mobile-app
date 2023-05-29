// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';

import 'package:medvezhiy_ugol/models/menu.dart';
import 'package:medvezhiy_ugol/pages/menu/basket_menu_page/basket_menu_page.dart';
import 'package:medvezhiy_ugol/services/theme_service.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CloseCircleButton(onTap: () => context.pop()),
                              const SizedBox(width: 8,)
                            ],
                          ),
                          Text('Корзина',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          Text('Очистить корзину',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff808080)
                          ),
                          ),
                          SizedBox(
                            height: 14,
                          ),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset('assets/images/detail_menu_page/doner.png',
                                    height: 78,
                                    width: 108,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 2,
                                          top: 10,
                                        ),
                                        child: Text('Донер с курицей',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Color(0xffffffff)
                                        ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 23,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: (){},
                                          ),
                                          Text('2',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.remove),
                                            onPressed: (){},
                                          ),
                                          Text('324 Р',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              color: Color(0xff191A1F),
                              child: Center(
                                child: Text('LETO2023',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff)
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: Row(
                              children: [
                                Text('Доставка:',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Ярославль',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xff808080)
                                ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 29
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 45,
                                  width: 133,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Color(0xff2D2D2D)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        child: Icon(
                                          Icons.delivery_dining
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Доставка',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Color(0xffffffff)
                                          ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text('30-40 минут',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff808080)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 14,
                                ),
                                Container(
                                  height: 45,
                                  width: 158,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Color(0xff000000)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        child: Icon(
                                            Icons.shopping_bag
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Навынос',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12,
                                                color: Color(0xff808080)
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text('Московский пр. 178',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff808080)
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 11
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 48,
                                  width: 400,
                                  color: Color(0xff191a1f),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        child: Icon(
                                            Icons.history
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Доставка 30-40 минут',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Color(0xffffffff)
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text('Выберите время доставки',
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff808080)
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 40,
                                        child: Icon(
                                          Icons.arrow_right
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
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
