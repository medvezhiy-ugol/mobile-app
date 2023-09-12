import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class AdditionalProduct extends StatefulWidget {
  const AdditionalProduct(
      {super.key,
        required this.name,
        required this.imgPath,
        required this.price, required this.isTapped});

  final String name;
  final double price;
  final String imgPath;
  final bool isTapped;

  @override
  State<AdditionalProduct> createState() => _AdditionalProductState();
}

class _AdditionalProductState extends State<AdditionalProduct> {

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 65,
        color: AppColors.color191A1F,
        margin: const EdgeInsets.only(bottom: 2),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: <Widget>[
            Image.asset(widget.imgPath),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                      color: Color(0xffFFFFFF)
                  ),
                ),
                Text(
                  '+ ${widget.price} Р',
                  style: const TextStyle(
                      color: Color(0xffFFFFFF)
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (widget.isTapped
                      ? AppColors.colorFF9900
                      : AppColors.color5D6377)),
              child: (widget.isTapped
                  ? const Icon(
                Icons.done,
                size: 15,
              )
                  : null),
            ),
          ],
        )
    );
  }
}