import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medvezhiy_ugol/ui/pages/jackpot/jackpot_page.dart';
import 'package:medvezhiy_ugol/ui/widgets/jackpot/winner_lottery_card.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class LotteryHistory extends StatefulWidget {
  const LotteryHistory({super.key});

  @override
  State<LotteryHistory> createState() => _LotteryHistoryState();
}

class _LotteryHistoryState extends State<LotteryHistory> {
  String name = "#R2FTZUPHY2TWB3Q6MJAYNA";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111216),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(9, 0, 11, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JackpotPage()));
                },
                child: Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: SvgPicture.asset("assets/images/cancel_icon.svg"),
                    )),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white, fontFamily: 'Unbounded'),),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("21 марта 2023 10:00", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.color808080),),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(children: [
                  Text("24 победителя", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                  Spacer(),
                  SvgPicture.asset("assets/images/medal.svg"),
                  SizedBox(width: 8),
                  Text("36,663.68", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.color29FF24),)
                ],),
              ),
              SizedBox(
                height: 36,
              ),
              WinnerLotteryCard(ticket: "Билет №234/300", name: "ВЫ", data: "21 марта", color: AppColors.colorFF9900,),
              SizedBox(height: 4),
              WinnerLotteryCard(color: AppColors.color29FF24, ticket: "Билет №234/300", name: "Margo Chibo", data: "21 марта")

            ],
          ),
        ),
      ),
    );
  }
}
