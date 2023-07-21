import 'package:flutter/material.dart';

class RemoveButton extends StatelessWidget {
  const RemoveButton({super.key});

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
        Icons.remove,
        color: Color(0xffFFFFFF),
      ),
    );
  }
}
