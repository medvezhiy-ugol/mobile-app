import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LotteryContainer extends StatelessWidget {
  Color color;
  String text;

  LotteryContainer({required this.text, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,

      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
            child: Text(
        text,
        style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
      ),
          )),
    );
  }
}
