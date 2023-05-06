// import 'dart:io';
// import 'package:barcode/barcode.dart';
import 'package:barcode_widget/barcode_widget.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import '../../common_setup/routes.dart';
import '../../utils/app_assets.dart';



class LoaltyCardPage extends StatelessWidget {
  const LoaltyCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      SingleChildScrollView(child: 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CloseCircleButton(
                  onTap: () => context.pop(),
                ),
                const SizedBox(
                  width: 2,
                )
              ],
            ),
            const SizedBox(
                  height: 32,
            ),
            _buildLoyaltyCard(height: 180, context: context),
            const SizedBox(
                  height: 10,
            ),
        
            Container(
              padding: const EdgeInsets.symmetric(vertical: 17),
              color: AppColors.color191A1F,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(children: const [
                        SizedBox(width: 13,),
                        Text('Данные карты', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),)
                      ],),
                      const SizedBox(height: 14,),
                      SizedBox(
                        width: double.infinity,
                        height: 89,
                        child: BarcodeWidget(
                          padding: const EdgeInsets.only(top: 3, right: 65, left: 65, bottom: 8),
                          backgroundColor: Colors.white,
                          barcode: Barcode.code128(useCode128B: false, useCode128A: false),
                          data: '490002624087',
                          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
                          textPadding: 15
                        ),
                      ),
                      const SizedBox(height: 46,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          const Text('Номер карты', style: TextStyle(fontSize: 14, color: AppColors.color808080),),
                          const SizedBox(height: 4,),
                          const Text('490002624087', style: TextStyle(fontSize: 14)),
                    
                          const SizedBox(height: 16,),
                          const Text('Баланс баллов', style: TextStyle(fontSize: 14, color: AppColors.color808080)),
                          const SizedBox(height: 4,),
                          const Text('Идет синхронизация', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    
                          const SizedBox(height: 16,),
                          Container(
                            color: AppColors.color26282F,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: (){
                                  // context.pop();
                                  context.push(Routes.slotHistory);},
                                child: Container(
                                  // margin: const EdgeInsets.symmetric(horizontal: 18),
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Text('История', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                                      ]
                                    ),
                                    ),
                                ),
                              ),
                            ),
                          ),

                          // const SizedBox(height: 25,),
                          // const Text('Акции', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.color808080)),
                          // const SizedBox(height: 10,),
                        ],
                        ),
                      ),
                
                    ],
                  ),
                ],
              ),
            )
          ]
          ),
        ),
        )
      ),
    );
  }
  

  Widget _buildLoyaltyCard({required double height, required BuildContext context}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(A.assetsHomePageLoyaltyCardBackgroundImg),
          fit: BoxFit.fill,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {context.push(Routes.loaltyCard);},
          child: Stack(
            children: <Widget>[
              Align(
                alignment: const Alignment(0.70, -0.8),
                child: Container(
                  child: const Text(
                    'Карта лояльности',
                    style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.6, -0.35),
                child: Container(
                  child: const Text(
                    'ЕГОР',
                    style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const Alignment(0.25, 0.1),
                child: Container(
                  child: const Text(
                    '9834',
                    style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}