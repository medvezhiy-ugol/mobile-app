import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medvezhiy_ugol/ui/widgets/jackpot/lottery_container.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class WinnerLotteryCard extends StatelessWidget {
  String name;
  String data;
  String ticket;
  Color color;

  WinnerLotteryCard(
      {
        required this.color,
        required this.ticket,
      required this.name,
      required this.data,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69,
      decoration: BoxDecoration(color: AppColors.color191A1F),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
        child: Row(
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    LotteryContainer(
                        text: ticket, color: color),
                    SizedBox(width: 10),
                    Text(
                      data,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.color808080),
                    )
                  ],
                )
              ],
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset("assets/images/medal.svg"),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "1000",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.color29FF24),
                    )
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Шанс 3%",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.color808080),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
