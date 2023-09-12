import 'dart:math';

import 'package:flutter/material.dart';

class DottedCircle extends StatelessWidget {
  const DottedCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DottedCirclePainter(),
      size: const Size(100, 100), // Размер окружности
    );
  }
}

class _DottedCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Paint paint = Paint()
      ..color = Colors.black // Цвет окружности
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0; // Толщина окружности

    final Path path = Path();
    for (double i = 0; i < 2 * 3.14; i += 0.1) { // Итерация через углы окружности
      final double x = radius + radius * cos(i);
      final double y = radius + radius * sin(i);
      path.moveTo(x, y);
      path.lineTo(x + 1, y); // Длина и расстояние между пунктирами (можете изменить по своему усмотрению)
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_DottedCirclePainter oldDelegate) => false;
}