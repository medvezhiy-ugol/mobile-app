import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medvezhiy_ugol/ui/widgets/add_button.dart';
import 'package:medvezhiy_ugol/ui/widgets/basket/basket_item.dart';
import '../../../ui/close_circle_button.dart';
import '../../../ui/widgets/remove_button.dart';
import '../../../utils/app_colors.dart';
import '../menu_page/bloc/menu_bloc.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {

  bool isInstruments = false;
  int _instrumentsCount = 0;
  
  bool isTakeaway = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuBloc, MenuState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MenuLoadedState) {
          return _buildLoadedBody(state: state);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildLoadedBody({required MenuLoadedState state}) {
    var elements = List<String>.generate(
      state.order.length,
          (int index) => state.order[index].id,
    );
    var mapQuantity = {};
    for (var element in elements) {
      if (!mapQuantity.containsKey(element)) {
        mapQuantity[element] = 1;
      } else {
        mapQuantity[element] += 1;
      }
    }
    state.order.sort((a, b) => a.id.compareTo(b.id));
    List<BasketItem> basket = [];
    int count = 1;
    for (int i = 0; i < state.order.length - 1; i++) {
      print("фффффф ${state.order[i].id}");
      if (state.order[i].id == state.order[i + 1].id) {
        count++;
      }
      else {
        basket.add(BasketItem(
            product: state.order[i],
            count: count
        ));
        count = 1;
      }
    }
    if (state.order.isNotEmpty) {
      basket.add(BasketItem(
          product: state.order.last,
          count: count
      ));
    }
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 24),
            Container(
              height: 4,
              width: 48,
              decoration: BoxDecoration(
                  color: const Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(9)
              ),
            ),
            CloseCircleButton(
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              const Text(
                'Корзина',
                style: TextStyle(
                  fontFamily: 'Unbounded',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Очистить корзину',
                style: TextStyle(
                  // fontFamily: 'Unbounded',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              for (BasketItem basketItem in basket)
                basketItem,
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Приборы",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xffFFFFFF)
                ),
              ),
              Row(
                children: [
                  SvgPicture.asset('assets/images/instruments.svg'),
                  const SizedBox(width: 9),
                  isInstruments
                      ? Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_instrumentsCount > 0) {
                              _instrumentsCount--;
                            }
                          });
                        },
                        child: const RemoveButton(),
                      ),
                      const SizedBox(width: 13),
                      Text(
                        _instrumentsCount.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xffFFFFFF)
                        ),
                      ),
                      const SizedBox(width: 13),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _instrumentsCount++;
                          });
                        },
                        child: const AddButton(),
                      ),
                    ],
                  )
                      : const Text(
                    "Без приборов",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff808080)
                    ),
                  ),
                  const Spacer(),
                  CupertinoSwitch(
                      value: isInstruments,
                      onChanged: (value) =>
                          setState(() {
                            isInstruments = !isInstruments;
                          })
                  )
                ],
              ),
              const SizedBox(height: 19),
              const Text(
                "Промокод",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xffFFFFFF)
                ),
              ),
              const SizedBox(height: 8),
              Container(
                height: 60,
                color: const Color(0xff191A1F),
                alignment: Alignment.center,
                child: const Text(
                  "LETO2023",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xffFFFFFF)
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Как к Вам обращаться?",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xff808080)
                ),
              ),
              const SizedBox(height: 2),
              Container(
                height: 60,
                color: const Color(0xff191A1F),
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Получение",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xffFFFFFF)
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        isTakeaway = false;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Color(isTakeaway ? 0xff000000 : 0xff2D2D2D),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/delivery${isTakeaway ? "" : "_enabled"}.svg'),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Доставка',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Color(isTakeaway ? 0xff545456 : 0xffFFFFFF)
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  '30-40 минут',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Color(isTakeaway ? 0xff545456 : 0xff808080)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        isTakeaway = true;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(isTakeaway ? 0xff2D2D2D : 0xff000000),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/takeaway${isTakeaway ? "_enabled" : ""}.svg'),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Навынос',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: Color(isTakeaway ? 0xffFFFFFF : 0xff545456)
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Московский пр. 178',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: Color(isTakeaway ? 0xff808080 : 0xff545456)
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    isTakeaway ? "Навынос:" : "Доставка:",
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xffFFFFFF)
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'ул. Республиканская, д46/3',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Color(0xff808080)
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 47),
              for (int i = 0; i < _instrumentsCount; i++)
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Сервисный сбор",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xff808080)
                        ),
                      ),
                      Text(
                        "30 ₽",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xffFFFFFF)
                        ),
                      )
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "При самовывозе",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xffFFFFFF)
                      ),
                    ),
                    Text(
                      "360 ₽",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xffFFFFFF)
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }
}