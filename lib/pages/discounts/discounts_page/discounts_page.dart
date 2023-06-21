import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/pages/discounts/discounts_detail_page/discounts_detail_page.dart';
import 'package:medvezhiy_ugol/pages/discounts/discounts_detail_page/draw_page.dart';
import 'package:medvezhiy_ugol/pages/discounts/discounts_history_page/discounts_history.dart';
import 'package:medvezhiy_ugol/pages/discounts/discounts_page/Leto.dart';
import 'package:medvezhiy_ugol/pages/discounts/discounts_page/history_draw.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:medvezhiy_ugol/utils/app_fonts.dart';
import '../../../utils/app_assets.dart';

class StockPage extends StatelessWidget {
  StockPage({super.key});
  // final TextEditingController _textMailBodyController = TextEditingController();
  // final TextEditingController _textMailSubjectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff111216),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 259,
                  width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Image.asset('assets/images/draw_result.png',
                        width: double.infinity,
                        height: 259,
                    fit: BoxFit.cover,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DrawPage()));
                        },
                        child: const Text('Результаты \n'
                            'розыгрыша',
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
                          left: 22.75,
                          bottom: 33.75,
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
                                color: Color(0xffffffff)
                              ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text('ДО НАЧАЛА СЛЕДУЮЩЕГО РОЗЫГРЫША',
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
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SlotHistoryPage()));
        },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      color: Color(0xff26282F),
                      child: Center(
                        child: Text('История',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Color(0xffffffff)
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HistoryDraw()));
                      },
                    child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width / 2 - 16,
                      color: Color(0xff26282F),
                      child: Center(
                        child: Text('Предыдущая лотерея',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xffffffff)
                          ),),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 42,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => leto()));
                },
                child: Container(
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

//NO Sales
              // const SizedBox(
              //   height: 250,
              // ),

              // const Center(
              //   child: Text(
              //     'Акций пока нет', //'Акции и комбо',
              //     style: TextStyle(
              //       fontSize: 20,
              //       fontWeight: FontWeight.w400,
              //       fontFamily: AppFonts.unbounded,
              //       color: AppColors.color808080,
              //     ),
              //   ),
              // ),
//-----

              _buildStockItem(context, '1'),
              const SizedBox(
                height: 8,
              ),
              _buildStockItem(context, '2'),
              const SizedBox(
                height: 8,
              ),
              _buildStockItem(context, '3'),
            ],
          ),
        ),
      ),
    );
  }

  DateTime dateTime = DateTime(
    2004,
    1,
    26,
    5,
    45,
  );

  Stack _buildStockItem(BuildContext context, String id) {
    return Stack(
      children: [
        Container(
          height: 130,
          color: AppColors.color191A1F,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                A.assetsStockPageItemImg,
                height: 130,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Две лучше, чем одна $id',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.unbounded,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Скидка на вторую пиццу 20%",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.color808080,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                    const Spacer(),
                    const Text(
                      'Действует до 07.04.2023 г.',
                      style: TextStyle(
                          fontSize: 10,
                          color: AppColors.color808080,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => DetailStockPage(id: id)
              );
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailStockPage(id: id)));
              // Navigator.of(context).pushNamed(
              //   Routes.detailStockName,
              //   arguments: id,
              // );
            },
            child: Container(
              height: 127,
            ),
          ),
        ),
      ],
    );
  }

  Container promoTextField(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.color191A1F,
      alignment: Alignment.center,
      child: const TextField(
        autofocus: false,
        textAlign: TextAlign.center,
        cursorHeight: 26,
        cursorColor: AppColors.colorFF9900,
        // keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Введите промокод',
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.color808080),
          // hintText: ,
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        // inputFormatters: [
        //   MaskTextInputFormatter(
        //     mask: '+7 (###) ###-##-##',
        //   )
        // ],
        // onChanged: (value) {
        //   if (value.length == 18) {
        //     context.read<AuthBloc>().add(AuthShowButtonEvent());
        //   } else if (state is AuthWithButtonState) {
        //     context.read<AuthBloc>().add(AuthHideButtonEvent());
        //   }
        // },
      ),
    );
  }
}
