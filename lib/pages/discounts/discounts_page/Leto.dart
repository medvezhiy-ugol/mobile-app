import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/pages/discounts/discounts_page/item_page.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class leto extends StatefulWidget {
  const leto({Key? key}) : super(key: key);

  @override
  State<leto> createState() => _letoState();
}


class _letoState extends State<leto> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color111216,
      body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Center(child: Column(
              children: [
                const SizedBox(height: 7,),
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
                              height: 19,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      _counter--;
                                    });
                                  },
                                ),
                                Text('$_counter'),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      _counter++;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Text('324',
                                  style: TextStyle(
                                    fontSize:16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemPage()));
                  },
                  child: Padding(
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
                      Text('Самовывоз:',
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
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 11
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 158,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xff2d2d2d)
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
                Container(
                  height: 48,
                  width: 400,
                  color: Color(0xff191a1f),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 40,
                        child: Icon(
                            Icons.credit_card
                        ),
                      ),
                      Text('MasterCard ** 4498',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color(0xffffffff)
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 40,
                            child: Icon(
                              Icons.circle_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Сумма заказа',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff808080,)
                        ),
                      ),
                      Column(
                        children: [
                          Text('971',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xffffffff)
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text('1142',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Color(0xfff33333)
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Сервисный сбор',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff808080,)
                        ),
                      ),
                      Text('30',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffffffff)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Сервисный сбор',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff808080,)
                        ),
                      ),
                      Text('30',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffffffff)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:58,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('При самовывозе',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff808080,)
                        ),
                      ),
                      Text('768',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffffffff)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 9,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('ИТОГО',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color(0xffFfffff,)
                        ),
                      ),
                      Text('971',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffffffff)
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 37,
                ),
                Container(
                  width: double.infinity,
                  height: 56,
                  color: Color(0xffffb627),
                  child: Center(
                    child: Text('Оформить заказ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color(0xff121212)
                    ),),
                  ),
                ),
              ],
            )),
          )
      ),
    );
  }

}
