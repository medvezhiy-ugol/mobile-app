import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:medvezhiy_ugol/ui/widgets/menu/pay_button.dart';
import 'package:medvezhiy_ugol/ui/widgets/sheets/menu_sheets/delivery_sheet.dart';
import 'package:medvezhiy_ugol/ui/widgets/sheets/menu_sheets/promocode_sheet.dart';
import '../../../close_circle_button.dart';
import '../../menu/basket_item.dart';
import '../../../../utils/app_colors.dart';
import '../../../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'my_addresses_sheet.dart';

class BasketSheet extends StatefulWidget {
  const BasketSheet({super.key});

  @override
  State<BasketSheet> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketSheet> {
  String delivery = '';
  String takeaway = '';
  String promocode = '';

  Future<Position> _determinePosition() async {

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
  builder: (context, state) {
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
    return BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
  builder: (context, state) {
    return Stack(
      children: [
        Column(
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
                  // const Text(
                  //   "Приборы",
                  //   style: TextStyle(
                  //       fontWeight: FontWeight.w600,
                  //       fontSize: 16,
                  //       color: Color(0xffFFFFFF)
                  //   ),
                  // ),
                  // Row(
                  //   children: [
                  //     SvgPicture.asset('assets/images/instruments.svg'),
                  //     const SizedBox(width: 9),
                  //     isInstruments
                  //         ? Row(
                  //       children: [
                  //         GestureDetector(
                  //           onTap: () {
                  //             setState(() {
                  //               if (_instrumentsCount > 0) {
                  //                 _instrumentsCount--;
                  //               }
                  //             });
                  //           },
                  //           child: const RemoveButton(),
                  //         ),
                  //         const SizedBox(width: 13),
                  //         Text(
                  //           _instrumentsCount.toString(),
                  //           style: const TextStyle(
                  //               fontWeight: FontWeight.w500,
                  //               fontSize: 16,
                  //               color: Color(0xffFFFFFF)
                  //           ),
                  //         ),
                  //         const SizedBox(width: 13),
                  //         GestureDetector(
                  //           onTap: () {
                  //             setState(() {
                  //               _instrumentsCount++;
                  //             });
                  //           },
                  //           child: const AddButton(),
                  //         ),
                  //       ],
                  //     )
                  //         : const Text(
                  //       "Без приборов",
                  //       style: TextStyle(
                  //           fontWeight: FontWeight.w400,
                  //           fontSize: 16,
                  //           color: Color(0xff808080)
                  //       ),
                  //     ),
                  //     const Spacer(),
                  //     CupertinoSwitch(
                  //         value: isInstruments,
                  //         onChanged: (value) =>
                  //             setState(() {
                  //               isInstruments = !isInstruments;
                  //             })
                  //     )
                  //   ],
                  // ),
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
                  GestureDetector(
                    onTap: () async {
                      promocode = await showModalBottomSheet(
                          context: context,
                          builder: (context) => PromocodeSheet()
                      ) ?? promocode;
                    },
                    child: Container(
                      height: 60,
                      color: const Color(0xff191A1F),
                      alignment: Alignment.center,
                      child: Text(
                        promocode,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xffFFFFFF)
                        ),
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
                            if (state.myAddress == null) {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => const MyAddressesSheet()
                              );
                            }
                            else {
                              context.read<CustomNavbarCubit>().changeIsTakeaway(false);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              color: Color(state.isTakeaway ? 0xff000000 : 0xff2D2D2D),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/delivery${state.isTakeaway ? "" : "_enabled"}.svg'),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Доставка',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Color(state.isTakeaway ? 0xff545456 : 0xffFFFFFF)
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      '30-40 минут',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Color(state.isTakeaway ? 0xff545456 : 0xff808080)
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
                            context.read<CustomNavbarCubit>().changeIsTakeaway(true);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: Color(state.isTakeaway ? 0xff2D2D2D : 0xff000000),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/takeaway${state.isTakeaway ? "_enabled" : ""}.svg'),
                                const SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Навынос',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Color(state.isTakeaway ? 0xffFFFFFF : 0xff545456)
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      'Свободы, 16',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Color(state.isTakeaway ? 0xff808080 : 0xff545456)
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
                  state.isTakeaway
                      ? GestureDetector(
                    onTap: () async {
                      Position _position = await _determinePosition();
                      final availableMaps = await MapLauncher.installedMaps;

                      showModalBottomSheet(
                        context: state.context!,
                        backgroundColor: const Color(0xff191A1F),
                        builder: (BuildContext context) {
                          return SafeArea(
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    const SizedBox(height: 16),
                                    Center(
                                      child: Container(
                                        height: 4,
                                        width: 48,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(9),
                                            color: Color(0xffD9D9D9).withOpacity(0.3)
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 36),
                                    const Text(
                                      'Выберите сервис',
                                      style: TextStyle(
                                        fontFamily: 'Unbounded',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 24,
                                        color: Color(0xffEFEFEF),
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    for (var map in availableMaps)
                                      Container(
                                        height: 65,
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 1
                                        ),
                                        color: const Color(0xff26282F),
                                        child: ListTile(
                                          onTap: () =>
                                              map.showDirections(
                                                destination: Coords(
                                                  57.62914049506065,
                                                    39.88227491507207,
                                                ),
                                                destinationTitle: "Медвежий угол",
                                                origin: Coords(
                                                  _position.latitude,
                                                  _position.longitude,
                                                ),
                                                originTitle: "Вы",
                                                waypoints: [],
                                                directionsMode: DirectionsMode.driving,
                                              ),
                                          title: Text(map.mapName),
                                          leading: ClipRRect(
                                            borderRadius: BorderRadius.circular(90),
                                            child: SvgPicture.asset(
                                              map.icon,
                                              height: 30.0,
                                              width: 30.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    Container(
                                      height: 65,
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 1
                                      ),
                                      color: const Color(0xff26282F),
                                      child: ListTile(
                                        onTap: () {
                                          Clipboard.setData(const ClipboardData(text: '150000, Ярославль, улица Свободы, 16'));
                                          Flushbar(
                                            message:  "Адрес скопирован",
                                            duration:  const Duration(seconds: 3),
                                            flushbarPosition: FlushbarPosition.TOP,
                                          ).show(context);
                                        },
                                        title: const Text("Скопировать адрес"),
                                        leading: ClipRRect(
                                          borderRadius: BorderRadius.circular(90),
                                          child: SvgPicture.asset(
                                            'assets/images/copy.svg',
                                            height: 30.0,
                                            width: 30.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.color26282F,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/takeaway.svg'),
                          const SizedBox(width: 12),
                          const Text(
                            'Построить маршрут',
                            style: TextStyle(
                              color: AppColors.colorFFFFFF,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                      : GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context.read<CustomNavbarCubit>().state.context!,
                        backgroundColor: Colors.transparent,
                        builder: (sheetContext) => Padding(
                            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                            child: const MyAddressesSheet()
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Text(
                          "Доставка:",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xffFFFFFF)
                          ),
                        ),
                        const SizedBox(width: 10),
                        BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
                          builder: (context, state) {
                            return Text(
                              state.myAddress == null ? "Укажите адрес доставки" : state.myAddress!.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Color(0xff808080)
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 147),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom,
          left: 0,
          right: 0,
          child: state.isTakeaway ? const PayButton() : state.myAddress == null ? Container() : GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                builder: (context) => const DeliverySheet(),
              );
            },
            child: Container(
              height: 56,
              color: const Color(0xffFFB627),
              padding: const EdgeInsets.symmetric(horizontal: 12.5),
              child: Row(
                children: [
                  const Text(
                    'Верно, далее',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff121212)
                    ),
                  ),
                  const Spacer(),
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
              ),
            ),
          ),
        ),
      ],
    );
  },
);
  },
);
  }
}