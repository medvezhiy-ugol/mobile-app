import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class PastLotteryCard extends StatelessWidget {
  String id;
  String data;
  String points;
  String countVictory;

  PastLotteryCard(
      { required this.countVictory,
        required this.id, required this.data, required this.points, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69,
      decoration: BoxDecoration(color: AppColors.color191A1F),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 9, 12),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  id,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  data,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.color808080),
                )
              ],
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset("assets/images/medal.svg"),
                    SizedBox(
                      width: 8,
                    ),
                    Text(points, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),)
                  ],
                ),
                SizedBox(height: 8),
                Text("$countVictory победителя", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.color808080),)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
