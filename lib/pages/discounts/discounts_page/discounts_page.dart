import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/ui/widgets/sheets/delivery_terms.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class StockPage extends StatefulWidget {
  StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  "Акции",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Unbounded',
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (sheetContext) => Padding(
                        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                      child: const DeliveryTerms(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 186,
                    width: 355,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Здесь задайте нужный вам радиус скругления
                      child: Container(
                        child: Image.asset(
                          'assets/images/home_page/Пицца мафия.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child:   Text('Две лучше, чем одна',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff)
                  ),),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10
                ),
                child:   Text('Скидлка на вторую пиццу 20%',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF808080)
                  ),),
              ),
              SizedBox(
                height: 16,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Container(
                      color: Color(0xff111216),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CloseCircleButton(onTap: () => Navigator.of(context).pop()),
                              const SizedBox(width: 8,)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Text('Условия достаки',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff)
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 214,
                            width: 375,
                            child: Container(
                                child: Image.asset('assets/images/home_page/Пицца мафия.png',
                                  fit: BoxFit.cover,)
                            ),
                          ), SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              '''Сделайте заказ online (на сайте или в приложениях) и заберите его в любом удобном ресторане "Медвежий угол" со скидкой 20%.
                      
Акция не суммируется с другими скидками и специальными предложениями компании , не распространяется на раздел «Напитки», а так-же не суммируется с промокодами на подарочные пиццы.
                      
При заказе самовывоза в ресторане - минимальная сумма заказа - 1000 руб.
                      ''',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 186,
                    width: 355,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Здесь задайте нужный вам радиус скругления
                      child: Container(
                        child: Image.asset(
                          'assets/images/home_page/Пицца мафия.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child:   Text('Две лучше, чем одна',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff)
                  ),),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10
                ),
                child:   Text('Скидлка на вторую пиццу 20%',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF808080)
                  ),),
              ),
SizedBox(
  height: 16,
),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => Container(
                      color: Color(0xff111216),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CloseCircleButton(onTap: () => Navigator.of(context).pop()),
                              const SizedBox(width: 8,)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Text('Условия достаки',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xffffffff)
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          SizedBox(
                            height: 214,
                            width: 375,
                            child: Container(
                                child: Image.asset('assets/images/home_page/Пицца мафия.png',
                                  fit: BoxFit.cover,)
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                            ),
                            child: Text(
                              '''Сделайте заказ online (на сайте или в приложениях) и заберите его в любом удобном ресторане "Медвежий угол" со скидкой 20%.
                      
Акция не суммируется с другими скидками и специальными предложениями компании , не распространяется на раздел «Напитки», а так-же не суммируется с промокодами на подарочные пиццы.
                      
При заказе самовывоза в ресторане - минимальная сумма заказа - 1000 руб.
                      ''',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 186,
                    width: 355,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12), // Здесь задайте нужный вам радиус скругления
                      child: Container(
                        child: Image.asset(
                          'assets/images/home_page/Пицца мафия.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child:   Text('Две лучше, чем одна',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff)
                  ),),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10
                ),
                child:   Text('Скидлка на вторую пиццу 20%',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF808080)
                  ),),
              ),
SizedBox(
  height: 16,
),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child:   Text('Две лучше, чем одна',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffffffff)
                  ),),
              ),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10
                ),
                child:   Text('Скидлка на вторую пиццу 20%',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF808080)
                  ),),
              ),
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
