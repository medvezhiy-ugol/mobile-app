import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 28,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color(0xff353535),
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.add,
        color: Color(0xffFFFFFF),
      ),
    );
  }
}
