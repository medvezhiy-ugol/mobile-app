import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class StockInsidePage extends StatelessWidget {
  const StockInsidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){},
                      customBorder: const CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: DecoratedBox(
                            child: Icon(Icons.close, size: 18,),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),
                            color: Colors.grey)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Stack(
                children: [
                  
                  Image.asset('assets/images/stock_inside_page/scribble.png'),
                  Positioned(
                    bottom: 7,
                    left: 30,
                    child: Container(
                      // margin: const EdgeInsets.all(7),
                      child: const Text("-20% на самовывоз", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        overflow: TextOverflow.clip,
                      ),),
                    ),
                  ),
                  Positioned(
                    top: 58,
                    left: 50,
                    child: Container(
                      color: Colors.black,
                      width: 276,
                      height: 45,
                      child: Center(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        const Text('Медвежий угол', style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24
                        ),),
                        const SizedBox(width: 17),
                        Image.asset('assets/images/stock_inside_page/bear_emblem.png')
                      ])),
                    ),
                  ),
                ]
                ),
              const SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 32),
                child: Text('''Сделайте заказ online (на сайте или в приложениях) и заберите его в любом удобном ресторане "Медвежий угол" со скидкой 20%.
              
Акция не суммируется с другими скидками и специальными предложениями компании , не распространяется на раздел «Напитки», а так-же не суммируется с промокодами на подарочные пиццы.
              
При заказе самовывоза в ресторане - минимальная сумма заказа - 1000 руб.
              ''', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500), overflow: TextOverflow.clip,),
              ),
              const SizedBox(height: 14,),
              Container(
                color: AppColors.color26282F,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){},
                    child: Container(
                      // width: 325,
                      height: 50,
                      child: Center(child: Text('Воспользоваться', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16))),
                    ),
                  ),
                ),
              )
            ],
            )
          ),
      ),
    );
  }
}