import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/ui/primary_button.dart';

class DetailStockPage extends StatelessWidget {
  final String id;

  const DetailStockPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Scaffold(
          backgroundColor: Color(0xff111216),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CloseCircleButton(
                onTap: () => Navigator.of(context).pop(),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    _buildHeader(),
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
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
                    const SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: PrimaryButton(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: "PIZZA101"));
                          // copied successfully
                          Flushbar(
                            title:  "Hey Ninja",
                            message:  "Ваш промокод скопирован",
                            duration:  Duration(seconds: 3),
                            flushbarPosition: FlushbarPosition.TOP,
                          ).show(context);
                        },

                        child: Text(
                          "Воспользоваться",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffffffff)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack _buildHeader() {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            'assets/images/detail_stock_page/scribble.png',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 8,
          left: 20,
          child: Text(
            "-20% на самовывоз $id",
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: 'Unbounded',
              fontSize: 24,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}