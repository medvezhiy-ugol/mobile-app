import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color151515,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 49,),
              const Text('Акции и комбо', style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white
              ),),
              const SizedBox(height: 10,),
              Stack(
                children: [
                  Container(
                    height: 127,
                    color: AppColors.color191A1F,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/stock_page/pizza.png', height: 127,),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15,),
                            Container(
                              width: 166,
                              child: 
                              const Text("Две лучше, чем одна", style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.clip,
                                height: 1,
                              ),),
                            ),
                            const SizedBox(height: 8,),
                            const Text("Скидка на вторую пиццу 20%", style: TextStyle(
                              fontSize: 12,
                              color: AppColors.color808080,
                              fontWeight: FontWeight.w500,
                            ),),
                            const Expanded(child: SizedBox(),),
                            const Text("Действует до 07.04.2023 г.", style: TextStyle(
                              fontSize: 10,
                              color: AppColors.color808080,
                              fontWeight: FontWeight.w400,
                            ),),
                            const SizedBox(height: 9,),
                        ],
                      ),
                              
                    ],
                  ),
                ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){print('Акция №2');},
                      child: Container(
                        height: 127,
                      ),
                    ),
                  ),
                  
                ]
              ),
              const SizedBox(height: 8,),
              Stack(
                children: [
                  Container(
                    height: 127,
                    color: AppColors.color191A1F,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/stock_page/pizza.png', height: 127,),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15,),
                            Container(
                              width: 166,
                              child: 
                              const Text("Две лучше, чем одна", style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.clip,
                                height: 1,
                              ),),
                            ),
                            const SizedBox(height: 8,),
                            const Text("Скидка на вторую пиццу 20%", style: TextStyle(
                              fontSize: 12,
                              color: AppColors.color808080,
                              fontWeight: FontWeight.w500,
                            ),),
                            const Expanded(child: SizedBox(),),
                            const Text("Действует до 07.04.2023 г.", style: TextStyle(
                              fontSize: 10,
                              color: AppColors.color808080,
                              fontWeight: FontWeight.w400,
                            ),),
                            const SizedBox(height: 9,),
                        ],
                      ),
                              
                    ],
                  ),
                ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){print('Акция №2');},
                      child: Container(
                        height: 127,
                      ),
                    ),
                  ),
                  
                ]
              ),
              const SizedBox(height: 8,),
              Stack(
                children: [
                  Container(
                    height: 127,
                    color: AppColors.color191A1F,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/stock_page/pizza.png', height: 127,),
                        const SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15,),
                            Container(
                              width: 166,
                              child: 
                              const Text("Две лучше, чем одна", style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                overflow: TextOverflow.clip,
                                height: 1,
                              ),),
                            ),
                            const SizedBox(height: 8,),
                            const Text("Скидка на вторую пиццу 20%", style: TextStyle(
                              fontSize: 12,
                              color: AppColors.color808080,
                              fontWeight: FontWeight.w500,
                            ),),
                            const Expanded(child: SizedBox(),),
                            const Text("Действует до 07.04.2023 г.", style: TextStyle(
                              fontSize: 10,
                              color: AppColors.color808080,
                              fontWeight: FontWeight.w400,
                            ),),
                            const SizedBox(height: 9,),
                        ],
                      ),
                              
                    ],
                  ),
                ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){print('Акция №2');},
                      child: Container(
                        height: 127,
                      ),
                    ),
                  ),
                  
                ]
              ),
            ]
          ),
        )
      )
    );
  }
}
