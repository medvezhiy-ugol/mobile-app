import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.child,
    this.color = AppColors.color26282F,
    this.height = 50,
  });

  factory PrimaryButton.icon(
      {Key? key,
      required VoidCallback? onTap,
      required IconData icon,
      required Widget label}) = _PrimaryButtonWithIcon;

  final VoidCallback? onTap;
  final Widget child;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      color: color,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Align(alignment: Alignment.center, child: child),
        ),
      ),
    );
  }
}

class _PrimaryButtonWithIcon extends PrimaryButton {
  _PrimaryButtonWithIcon({
    super.key,
    required super.onTap,
    required IconData icon,
    required Widget label,
  }) : super(
          child: _PrimaryButtonWithIconChild(
            icon: icon,
            label: label,
          ),
        );
}

class _PrimaryButtonWithIconChild extends StatelessWidget {
  const _PrimaryButtonWithIconChild({required this.icon, required this.label});

  final IconData icon;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(
          width: 5,
        ),
        label
      ],
    );
  }
}