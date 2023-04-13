import 'dart:math';

import 'package:flutter/material.dart';

import 'module_slot_machine.dart';

class SlotMachineWidget extends StatefulWidget {
  const SlotMachineWidget({super.key});

  @override
  State<SlotMachineWidget> createState() => _SlotMachineWidgetState();
}

class _SlotMachineWidgetState extends State<SlotMachineWidget> {
  late SlotMachineController _controller;
  @override
  void initState() {
    super.initState();
  }

  void onButtonTap({required int index}) {
    _controller.stop(reelIndex: index);
  }

  void onStart() {
    final index = Random().nextInt(20);
    _controller.start(hitRollItemIndex: index < 5 ? index : null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/stock_page/slot_machine_background.png'),
            SlotMachine(
              rollItems: [
                RollItem(index: 0, child: Container(color: Colors.red)),
                RollItem(index: 1, child: Container(color: Colors.red)),
                RollItem(index: 2, child: Container(color: Colors.red)),
                RollItem(index: 3, child: Container(color: Colors.red)),
                RollItem(index: 4, child: Container(color: Colors.red)),
              ],
              onCreated: (controller) {
                _controller = controller;
              },
              onFinished: (resultIndexes) {
                print('Result: $resultIndexes');
              },
            ),
          ],
        ),
        Container(
          color: Colors.green,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                _controller.go(index: 123123);
              },
              child: Container(
                height: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
