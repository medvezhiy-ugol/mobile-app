// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:medvezhiy_ugol/models/menu.dart';
import 'package:medvezhiy_ugol/services/theme_service.dart';
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
          LayoutGrid(
            columnSizes: [1.fr, 1.fr],
            rowSizes: List.generate(
              widget.menuCategory.items.length ~/ 2 + 1,
              (index) => auto,
            ),
            columnGap: 10,
            rowGap: MenuSection.menuSectionWidgetGapValue,
            children: List.generate(
              widget.menuCategory.items.length,
              (i) => MenuCardWidget(
                menuProduct: widget.menuCategory.items[i],
                onTap: () {
                  // showModalBottomSheet(
                  //     context: context,
                  //     isScrollControlled: true,
                  //     builder: (sheetContext) => Column(
                  //       children: [
                  //         SizedBox(height: 100),
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.end,
                  //           children: [
                  //             CloseCircleButton(onTap: () => Navigator.of(context).pop()),
                  //             const SizedBox(width: 8,)
                  //           ],
                  //         ),
                  //         Text('Корзина',
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //         ),
                  //         SizedBox(
                  //           height: 26,
                  //         ),
                  //         Text('Очистить корзину',
                  //         style: TextStyle(
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w400,
                  //           color: Color(0xff808080)
                  //         ),
                  //         ),
                  //         SizedBox(
                  //           height: 14,
                  //         ),
                  //         Slidable(
                  //           // Specify a key if the Slidable is dismissible.
                  //           key: const ValueKey(0),
                  //           // The start action pane is the one at the left or the top side.
                  //           // The end action pane is the one at the right or the bottom side.
                  //           endActionPane: ActionPane(
                  //             motion: ScrollMotion(),
                  //             children: [
                  //               SlidableAction(
                  //                 // An action can be bigger than the others.
                  //                 flex: 2,
                  //                 onPressed: (value) {
                  //
                  //                 },
                  //                 backgroundColor: Color(0xFFE64646),
                  //                 foregroundColor: Colors.white,
                  //                 icon: Icons.archive,
                  //                 label: 'Удалить',
                  //               ),
                  //             ],
                  //           ),
                  //
                  //           // The child of the Slidable is what the user sees when the
                  //           // component is not dragged.
                  //           child: Container(
                  //             height: 96,
                  //             width: double.infinity,
                  //             color: Color(0xff191A1F),
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.start,
                  //               children: [
                  //                 Image.asset('assets/images/detail_menu_page/doner.png',
                  //                   height: 78,
                  //                   width: 108,
                  //                 ),
                  //                 SizedBox(
                  //                   width: 2,
                  //                 ),
                  //                 Column(
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   children: [
                  //                     Padding(
                  //                       padding: const EdgeInsets.only(
                  //                         left: 2,
                  //                         top: 10,
                  //                       ),
                  //                       child: Text('Донер с курицей',
                  //                       style: TextStyle(
                  //                         fontWeight: FontWeight.w500,
                  //                         fontSize: 16,
                  //                         color: Color(0xffffffff)
                  //                       ),
                  //                       ),
                  //                     ),
                  //                     SizedBox(
                  //                       height: 19,
                  //                     ),
                  //                     Row(
                  //                       mainAxisAlignment: MainAxisAlignment.start,
                  //                       children: [
                  //                         IconButton(
                  //                           icon: Icon(Icons.remove),
                  //                           onPressed: () {
                  //                             setState(() {
                  //                               _counter--;
                  //                             });
                  //                           },
                  //                         ),
                  //                         Text('$_counter'),
                  //                         IconButton(
                  //                           icon: Icon(Icons.add),
                  //                           onPressed: () {
                  //                             setState(() {
                  //                               _counter++;
                  //                             });
                  //                           },
                  //                         ),
                  //                         SizedBox(
                  //                           width: 100,
                  //                         ),
                  //                         Text('324',
                  //                         style: TextStyle(
                  //                           fontSize:16,
                  //                           fontWeight: FontWeight.w600,
                  //                         ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 4,
                  //         ),
                  //         SizedBox(
                  //           height: 32,
                  //         ),
                  //         GestureDetector(
                  //           onTap: () {
                  //             Navigator.of(context).push(MaterialPageRoute(builder: (context) => leto()));
                  //           },
                  //           child: Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //               horizontal: 10,
                  //             ),
                  //             child: Container(
                  //               height: 60,
                  //               width: double.infinity,
                  //               color: Color(0xff191A1F),
                  //               child: Center(
                  //                 child: Text('LETO2023',
                  //                   style: TextStyle(
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w600,
                  //                       color: Color(0xffffffff)
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 18,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //             left: 10,
                  //           ),
                  //           child: Row(
                  //             children: [
                  //               Text('Доставка:',
                  //               style: TextStyle(
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 16,
                  //               ),
                  //               ),
                  //               SizedBox(
                  //                 width: 10,
                  //               ),
                  //               Text('Ярославль',
                  //               style: TextStyle(
                  //                 fontWeight: FontWeight.w500,
                  //                 fontSize: 16,
                  //                 color: Color(0xff808080)
                  //               ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 26,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.only(
                  //             left: 29
                  //           ),
                  //           child: Row(
                  //             children: [
                  //               Container(
                  //                 height: 45,
                  //                 width: 133,
                  //                 decoration: BoxDecoration(
                  //                   borderRadius: BorderRadius.circular(12),
                  //                   color: Color(0xff2D2D2D)
                  //                 ),
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   children: [
                  //                     SizedBox(
                  //                       width: 40,
                  //                       child: Icon(
                  //                         Icons.delivery_dining
                  //                       ),
                  //                     ),
                  //                     Column(
                  //                       mainAxisAlignment: MainAxisAlignment.center,
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text('Доставка',
                  //                         style: TextStyle(
                  //                           fontWeight: FontWeight.w600,
                  //                           fontSize: 12,
                  //                           color: Color(0xffffffff)
                  //                         ),
                  //                         ),
                  //                         SizedBox(
                  //                           height: 2,
                  //                         ),
                  //                         Text('30-40 минут',
                  //                           style: TextStyle(
                  //                               fontSize: 10,
                  //                               fontWeight: FontWeight.w400,
                  //                               color: Color(0xff808080)
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 width: 14,
                  //               ),
                  //               Container(
                  //                 height: 45,
                  //                 width: 158,
                  //                 decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(12),
                  //                     color: Color(0xff000000)
                  //                 ),
                  //                 child: Row(
                  //                   mainAxisAlignment: MainAxisAlignment.start,
                  //                   children: [
                  //                     SizedBox(
                  //                       width: 40,
                  //                       child: Icon(
                  //                           Icons.shopping_bag
                  //                       ),
                  //                     ),
                  //                     Column(
                  //                       mainAxisAlignment: MainAxisAlignment.center,
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text('Навынос',
                  //                           style: TextStyle(
                  //                               fontWeight: FontWeight.w600,
                  //                               fontSize: 12,
                  //                               color: Color(0xff808080)
                  //                           ),
                  //                         ),
                  //                         SizedBox(
                  //                           height: 2,
                  //                         ),
                  //                         Text('Московский пр. 178',
                  //                           style: TextStyle(
                  //                               fontSize: 10,
                  //                               fontWeight: FontWeight.w400,
                  //                               color: Color(0xff808080)
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 32,
                  //         ),
                  //         Container(
                  //           height: 48,
                  //           width: 400,
                  //           color: Color(0xff191a1f),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               SizedBox(
                  //                 width: 40,
                  //                 child: Icon(
                  //                     Icons.history
                  //                 ),
                  //               ),
                  //               Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text('Доставка 30-40 минут',
                  //                     style: TextStyle(
                  //                         fontWeight: FontWeight.w400,
                  //                         fontSize: 14,
                  //                         color: Color(0xffffffff)
                  //                     ),
                  //                   ),
                  //                   SizedBox(
                  //                     height: 2,
                  //                   ),
                  //                   Text('Выберите время доставки',
                  //                     style: TextStyle(
                  //                         fontSize: 10,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: Color(0xff808080)
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               SizedBox(
                  //                 width: 130,
                  //               ),
                  //               SizedBox(
                  //                 width: 40,
                  //                 child: Icon(
                  //                     Icons.arrow_right
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 8,
                  //         ),
                  //         Container(
                  //           height: 48,
                  //           width: 400,
                  //           color: Color(0xff191a1f),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               SizedBox(
                  //                 width: 40,
                  //                 child: Icon(
                  //                     Icons.credit_card
                  //                 ),
                  //               ),
                  //               Text('MasterCard ** 4498',
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.w400,
                  //                     fontSize: 14,
                  //                     color: Color(0xffffffff)
                  //                 ),
                  //               ),
                  //               SizedBox(
                  //                 width: 150,
                  //               ),
                  //               SizedBox(
                  //                 width: 40,
                  //                 child: Icon(
                  //                     Icons.circle_sharp
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 45,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //             horizontal: 22
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Text('Сумма заказа',
                  //               style: TextStyle(
                  //                 fontWeight: FontWeight.w500,
                  //                 fontSize: 16,
                  //                 color: Color(0xff808080,)
                  //               ),
                  //               ),
                  //               Text('971',
                  //               style: TextStyle(
                  //                 fontSize: 16,
                  //                 fontWeight: FontWeight.w600,
                  //                 color: Color(0xffffffff)
                  //               ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 21,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 22
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Text('Сервисный сбор',
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.w500,
                  //                     fontSize: 16,
                  //                     color: Color(0xff808080,)
                  //                 ),
                  //               ),
                  //               Text('30',
                  //                 style: TextStyle(
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w600,
                  //                     color: Color(0xffffffff)
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 16,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 22
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Text('Сервисный сбор',
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.w500,
                  //                     fontSize: 16,
                  //                     color: Color(0xff808080,)
                  //                 ),
                  //               ),
                  //               Text('30',
                  //                 style: TextStyle(
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w600,
                  //                     color: Color(0xffffffff)
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height:58,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 22
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Text('При самовывозе',
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.w500,
                  //                     fontSize: 16,
                  //                     color: Color(0xff808080,)
                  //                 ),
                  //               ),
                  //               Text('768',
                  //                 style: TextStyle(
                  //                     fontSize: 16,
                  //                     fontWeight: FontWeight.w600,
                  //                     color: Color(0xffffffff)
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 9,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 22
                  //           ),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //                 Text('ИТОГО',
                  //                 style: TextStyle(
                  //                     fontWeight: FontWeight.w500,
                  //                     fontSize: 20,
                  //                     color: Color(0xffFfffff,)
                  //                 ),
                  //               ),
                  //               Text('971',
                  //                 style: TextStyle(
                  //                     fontSize: 20,
                  //                     fontWeight: FontWeight.w600,
                  //                     color: Color(0xffffffff)
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ],
                  //     )
                  // );
                  print("цоофшофш ${widget.menuCategory.items[i].id}");
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailMenuPage(
                      id: widget.menuCategory.items[i].id
                  )));
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
