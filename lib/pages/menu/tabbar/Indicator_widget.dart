import 'dart:ui';

import 'package:flutter/material.dart';

class IndicatorWidget extends AnimatedWidget {
  const IndicatorWidget({
    super.key,
    required Animation<double> animation,
    required this.onTap,
    required this.selected,
    required this.text,
  }) : super(listenable: animation);

  final VoidCallback? onTap;
  final bool selected;
  final String text;

  final int selectedFontSize = 24;
  final int unSelectedFontSize = 16;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TabBarTheme tabBarTheme = TabBarTheme.of(context);
    final Animation<double> animation = listenable as Animation<double>;

    const TextStyle selectedlabelStyle =
        TextStyle(fontSize: 24, fontFamily: 'Unbounded');
    const TextStyle unSelectedlabelStyle =
        TextStyle(fontSize: 16, fontFamily: 'Unbounded');

    final TextStyle defaultStyle = (selectedlabelStyle).copyWith(inherit: true);
    final TextStyle defaultUnselectedStyle =
        (unSelectedlabelStyle).copyWith(inherit: true);

    final TextStyle textStyle = selected
        ? TextStyle.lerp(defaultStyle, unSelectedlabelStyle, animation.value)!
        : TextStyle.lerp(unSelectedlabelStyle, defaultStyle, animation.value)!;

    final Color selectedColor = Color(0xFFFF9900);
    final Color unselectedColor = Colors.white;

    final Color color = selected
        ? Color.lerp(selectedColor, unselectedColor, animation.value)!
        : Color.lerp(unselectedColor, selectedColor, animation.value)!;

    final double magnification =
        (selectedFontSize / unSelectedFontSize);
    final double scale = (selected
        ? lerpDouble(
            magnification,
            1,
            animation.value,
          )
        : lerpDouble(
            1,
            magnification,
            animation.value,
          ))!;

    return DefaultTextStyle(
      style: textStyle.copyWith(
        color: color,
        fontSize: unSelectedlabelStyle.fontSize,
      ),
      child: IconTheme.merge(
        data: IconThemeData(
          size: 24.0,
          color: color,
        ),
        child: Transform.scale(
          scale: scale,
          child: InkWell(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                style: unSelectedlabelStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}


