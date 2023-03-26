import 'package:flutter/material.dart';

class CloseCircleButton extends StatelessWidget {
  const CloseCircleButton({
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
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: Colors.grey),
              child: const Icon(
                Icons.close,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
