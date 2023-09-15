import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';

class DeliverySwitcher extends StatefulWidget {
  const DeliverySwitcher({super.key, required this.onDelivery, required this.onTakeaway});

  final Function() onDelivery;
  final Function() onTakeaway;

  @override
  State<DeliverySwitcher> createState() => _DeliverySwitcherState();
}

class _DeliverySwitcherState extends State<DeliverySwitcher> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 240,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: const Color(0xff000000),
          borderRadius: BorderRadius.circular(30)
      ),
      child: Stack(
          fit: StackFit.expand,
          children: [
            BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
              builder: (context, state) {
                return AnimatedPositioned(
                  left: state.isTakeaway ? 118 : 0,
                  duration: const Duration(milliseconds: 100),
                  child: Container(
                    height: 30,
                    width: 114,
                    decoration: BoxDecoration(
                        color: const Color(0xff2D2D2D),
                        borderRadius: BorderRadius.circular(30)
                    ),
                  ),
                );
              },
            ),
            Row(
              children: [
                GestureDetector(onTap: () {
                  context.read<CustomNavbarCubit>().changeIsTakeaway(false);
                  widget.onDelivery();
                },
                  child: Container(
                    width: 114,
                    height: 30,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: const Text(
                      'Доставка',
                      style: TextStyle(
                        fontFamily: 'Unbounded',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 4),
                GestureDetector(onTap: () {
                  context.read<CustomNavbarCubit>().changeIsTakeaway(true);
                  widget.onTakeaway();
                },
                  child: Container(
                    width: 114,
                    height: 30,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: const Text(
                      'Самовывоз',
                      style: TextStyle(
                        fontFamily: 'Unbounded',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}
