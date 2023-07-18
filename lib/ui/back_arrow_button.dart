import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    super.key,
    required this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 24,
            height: 24,
            child: const Icon(
              Icons.arrow_back_rounded,
              size: 18,
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    );
  }
}