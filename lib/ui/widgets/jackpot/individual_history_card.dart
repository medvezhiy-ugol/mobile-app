import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/ui/widgets/jackpot/lottery_container.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class AddedBonuses extends StatelessWidget {
  String event;
  String bonuses;
  String data;

  AddedBonuses(
      {
        required this.data,
        required this.event,
        required this.bonuses,
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
                      "Начисление бонусов",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        LotteryContainer(
                            text: event, color: AppColors.color29FF24),
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
                Text(bonuses, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.color29FF24),)
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SpendedBonuses extends StatelessWidget {
  String event;
  String bonuses;
  String data;

  SpendedBonuses(
      {
        required this.data,
        required this.event,
        required this.bonuses,
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
                      "Списание бонусов",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        LotteryContainer(
                            text: event, color: AppColors.colorBD3232),
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
                Text(bonuses, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.colorBD3232),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
