import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shim extends StatelessWidget {
  const Shim({
    this.height,
    this.width,
    required this.radius,
    super.key
  });

  final double? width;
  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Shimmer.fromColors(
        baseColor: const Color(0xff1F2127),
        highlightColor: const Color(0xff15171C),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Colors.black
          ),
        ),
      ),
    );
  }
}
