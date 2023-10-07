import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/ui/widgets/menu/pay_button.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import '../../../models/address_model/address_model.dart';
import '../../../services/auth_service.dart';
import '../map/deliver_here_block.dart';
class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  final TextEditingController _textTimeController = TextEditingController();

  final authService = Injector().get<AuthService>();

  DateTime date = DateTime(2016, 10, 26);

  get onTap => null;

  final TextEditingController apartment = TextEditingController();
  final TextEditingController entrance = TextEditingController();
  final TextEditingController floor = TextEditingController();
  final TextEditingController intercom = TextEditingController();
  final TextEditingController comment = TextEditingController();

  @override
  void initState() {
    AddressModel myAddress = context.read<CustomNavbarCubit>().state.myAddress!;
    apartment.text = myAddress.apartment;
    entrance.text = myAddress.entrance;
    floor.text = myAddress.floor;
    intercom.text = myAddress.intercom;
    comment.text = myAddress.comment;
    super.initState();
  }


  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 302,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
            color: Color(0xff111216),
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(40)
            ),
        ),
        child: SafeArea(
            top: false,
            child: Column(
              children: [
                Expanded(
                  child: child,
                ),
                Material(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      height: 56,
                      width: double.infinity,
                      color: const Color(0xffFFB627),
                      alignment: Alignment.center,
                      child: const Text(
                        "Сейчас",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xff121212)
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff111216),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10
            ),
            child: BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 11,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          customBorder: const CircleBorder(),
                          child: const SizedBox(
                            width: 24,
                            height: 24,
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              size: 22,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text('Доставка',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff)
                      ),),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _textTimeController.text = "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}'";
                        });
                        _showDialog(
                          CupertinoPicker(
                            magnification: 1.22,
                            squeeze: 1.2,
                            useMagnifier: true,
                            itemExtent: 32.0,
                            // This sets the initial item.
                            scrollController: FixedExtentScrollController(
                              initialItem: 0,
                            ),
                            // This is called when selected item is changed.
                            onSelectedItemChanged: (int selectedItem) {
                              switch (selectedItem) {
                                case 0:
                                  _textTimeController.text = "Сегодня";
                                  break;
                                case 1:
                                  _textTimeController.text = "Завтра";
                                  break;
                                case 2:
                                  _textTimeController.text = "Не выбрано";
                                  break;
                              }
                              setState(() {});
                            },
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 50),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Сегодня",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xffFFFFFF)
                                      ),
                                    ),
                                    Text(
                                      "Сегодня",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xffFFFFFF)
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Завтра",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Color(0xffFFFFFF)
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        height: 64,
                        width: double.infinity,
                        color: const Color(0xff191a1f),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 40,
                              child: Image.asset('assets/images/delivery_info_page/scooter.png',
                                width: 22,
                                height: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text('Доставка 25-35 минут',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xff808080)
                              ),
                            ),
                            const Spacer(
                            ),
                            const SizedBox(
                              height: 13,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 13,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Text('Адрес',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff)
                      ),),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      height: 65,
                      width: double.infinity,
                      color: const Color(0xff191a1f),
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 24,
                            child: Icon(
                              Icons.home,
                              size: 24,
                              color: Color(0xff808080),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.myAddress!.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Color(0xffFFFFFF)
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                const Text(
                                  'Ярославль',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xFF808080)
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          const SizedBox(
                            height: 13,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 13,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    Row(
                      children: [
                        DeliverHereBlock(
                            text: "Квартира",
                            controller: apartment
                        ),
                        DeliverHereBlock(
                            text: "Подъезд",
                            controller: entrance
                        ),
                        DeliverHereBlock(
                            text: "Этаж",
                            controller: floor
                        ),
                        DeliverHereBlock(
                            text: "Домофон",
                            controller: intercom
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Комментарий для курьера',
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff808080)
                      ),
                    ),
                    const SizedBox(height: 2),
                    Container(
                      height: 112,
                      color: AppColors.color191A1F,
                      child: TextField(
                        controller: comment,
                        maxLines: 5,
                        style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColors.colorFFFFFF,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const PayButton(),
                  ],
                );
              },
            ),
          ),
        )
    );
  }
}