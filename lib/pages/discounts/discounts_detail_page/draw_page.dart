import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/utils/app_fonts.dart';

class DrawPage extends StatelessWidget {
  const DrawPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height:248,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Image.asset('assets/images/draw_result.png',  width: double.infinity, height: double.infinity),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DrawPage()));
                        },
                        child: Text('Розыгрыш',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffffffff)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 67.75,
                        bottom: 51.75,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.history,
                                color: Color(0xff808080)
                                ,),
                              SizedBox(
                                width: 6.75,
                              ),
                              Text('16:30:16',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('ДО КОНЦА РОЗЫГРЫША',
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff808080,)
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 11,
                          ),
                          Text('7 мар 10:00',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff808080,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text('Посмотреть выигрыши',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffffffff)
                  ),),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: double.infinity,
                color: Color(0xff191A1F),
                child: Center(
                  child: Text('Введите промокод',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff808080)
                    ),),
                ),
              ),
              SizedBox(
                height: 26,
              ),
              // _buildActiveLotteryBody(context),
              // _buildCompletedLotteryBody(context),
              // const SizedBox(
              //   height: 10,
              // ),
              // promoTextField(context),
              // const SizedBox(
              //   height: 26,
              // ),
              Text(
                "Акции и комбо",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.unbounded,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),


        ));
  }
}
