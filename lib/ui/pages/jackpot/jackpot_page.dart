import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medvezhiy_ugol/ui/pages/jackpot/individual_history.dart';
import 'package:medvezhiy_ugol/ui/pages/jackpot/lottery_history.dart';
import 'package:medvezhiy_ugol/ui/primary_button.dart';
import 'package:medvezhiy_ugol/ui/widgets/jackpot/past_lottery_card.dart';
import 'package:medvezhiy_ugol/ui/widgets/jackpot/winner_lottery_card.dart';

import '../../../utils/app_colors.dart';
import '../../widgets/flip_countdown_clock.dart';

class JackpotPage extends StatefulWidget {
  const JackpotPage({super.key});

  @override
  State<JackpotPage> createState() => _JackpotPageState();
}

class _JackpotPageState extends State<JackpotPage> {
  String id = "38u4iibfnsdns";
  String data = "21 марта";
  String points = "36,663.68";
  String countVictory = "24";
  bool isInProgress = false;
  String seconds = "16:30:16";
  bool isEnded = false;
  String ticket = "Билет №234/300";
  String name = "Алексей Антонов";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111216),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 13),
                SizedBox(
                  height: 128,
                  width: 317,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/big_drum.png',
                        fit: BoxFit.fill,
                        height: 128,
                        width: 317,
                      ),
                      Positioned(
                        left: 14.5,
                        top: 12.5,
                        child: FlipCountdownClock(
                          duration: const Duration(days: 1),
                          digitSize: 46.0,
                          width: 46,
                          height: 95.0,
                          digitSpacing: const EdgeInsets.symmetric(horizontal: 1),
                          separatorWidth: 0,
                          digitColor: const Color(0xff26252B),
                          backgroundColor: const Color(0xffF3CF7F),
                          onDone: () => print('Buzzzz!'),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 45),
                isEnded? Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Center(child: Text("9/10", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                      )),
                      SizedBox(height: 39),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Text("Победители", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),),
                      ),
                        SizedBox(height: 21),
                        WinnerLotteryCard(ticket: ticket, name: name, data: data, color: AppColors.color29FF24,),
                        SizedBox(height: 10,),
                        WinnerLotteryCard(ticket: ticket, name: name, data: data, color: AppColors.color29FF24,),
                        SizedBox(height: 10,),
                        WinnerLotteryCard(ticket: ticket, name: name, data: data, color: AppColors.color29FF24,),


                    ],),
                  ),
                ) :
                    Container(child: Column(children: [
                      isInProgress
                          ? Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  seconds,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                                SizedBox(width: 5,),
                                Text("осталось", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.color808080),),
                                Spacer(),
                                Text("3/10", style:  TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),),
                                Spacer(),
                                SvgPicture.asset("assets/images/medal.svg"),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(points, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),)
                              ],
                            ),
                            SizedBox(height: 21),
                            LinearProgressIndicator(
                              value: 0.7,
                              backgroundColor: AppColors.color191A1F, color: AppColors.colorFF9900,),
                            SizedBox(height: 32,)
                          ],
                        ),
                      )
                          : Container(),
                      PrimaryButton(
                          onTap: () {
                            isInProgress = !isInProgress;
                            setState(() {});
                          },
                          color: AppColors.colorFFB627,
                          child: Text(
                            "Участвовать",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          )),
                      SizedBox(height: 9),
                      PrimaryButton(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IndividualHistoryPage()));
                            setState(() {

                            });

                          },
                          color: AppColors.color26282F,
                          child: Text(
                            "Ваша история",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                      SizedBox(height: 36),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LotteryHistory()));
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/images/history_icon.svg"),
                            SizedBox(width: 12),
                            Text("История розыгрышей",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      PastLotteryCard(
                        id: id,
                        data: data,
                        points: points,
                        countVictory: countVictory,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      PastLotteryCard(
                        id: id,
                        data: data,
                        points: points,
                        countVictory: countVictory,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      PastLotteryCard(
                        id: id,
                        data: data,
                        points: points,
                        countVictory: countVictory,
                      ),
                    ],),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
