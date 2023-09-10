import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medvezhiy_ugol/ui/widgets/jackpot/individual_history_card.dart';

import 'jackpot_page.dart';

class IndividualHistoryPage extends StatefulWidget {
  const IndividualHistoryPage({super.key});

  @override
  State<IndividualHistoryPage> createState() => _IndividualHistoryPageState();
}

class _IndividualHistoryPageState extends State<IndividualHistoryPage> {
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
                child: Center(child: Text("История", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),)),
              ),
              SizedBox(
                height: 36,
              ),
              AddedBonuses(data: "21 марта", event: "Еженедельная лотерея", bonuses: "+1000 "),
              SizedBox(height: 4),
              SpendedBonuses(data: "21 марта", event: "Оплата покупки", bonuses: "-100 ")

            ],
          ),
        ),
      ),
    );
  }
}
