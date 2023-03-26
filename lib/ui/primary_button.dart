import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.onTap, required this.child});

  factory PrimaryButton.icon(
      {Key? key,
      required VoidCallback? onTap,
      required IconData icon,
      required Widget label}) = _PrimaryButtonWithIcon;

  final VoidCallback? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: AppColors.color26282F,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap,
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
