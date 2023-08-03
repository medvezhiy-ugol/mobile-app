import 'package:flutter/material.dart';

class DeliverySwitcher extends StatefulWidget {
  const DeliverySwitcher({super.key});

  @override
  State<DeliverySwitcher> createState() => _DeliverySwitcherState();
}

class _DeliverySwitcherState extends State<DeliverySwitcher> {
  bool isDeliver = true;

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
            AnimatedPositioned(
              left: isDeliver ? 0 : 118,
              duration: const Duration(milliseconds: 100),
              child: Container(
                height: 30,
                width: 114,
                decoration: BoxDecoration(
                    color: const Color(0xff2D2D2D),
                    borderRadius: BorderRadius.circular(30)
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(onTap: () {
                  isDeliver = true;
                  setState(() {

                  });
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
                  isDeliver  = false;
                  setState(() {

                  });
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
