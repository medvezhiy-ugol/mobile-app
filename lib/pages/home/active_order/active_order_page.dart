import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/utils/app_assets.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import '../../generated/l10n.dart';

class ActiveOrderPage extends StatelessWidget {
  const ActiveOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color1E1E1E,
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch(
              accentColor: AppColors.color191A1F,
            ),
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            context.pop();
                          },
                          customBorder: const CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 24,
                              height: 24,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.grey),
                                child: const Icon(
                                  Icons.close,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 19,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    S.current.activeOrderScreenYourOrder, //'Ваш заказ',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Stack(alignment: Alignment.center, children: [
                    SimpleCircularProgressBar(
                      size: 217,
                      progressStrokeWidth: 12,
                      backStrokeWidth: 12,
                      backColor: AppColors.color191A1F,
                      animationDuration: 0,
                      progressColors: const [AppColors.colorFF9900],
                      maxValue: 100, // Макс значение бара
                      valueNotifier: ValueNotifier(80), // Значение бара
                    ),
                    Column(
                      children: const [
                        Text(
                          'D-72',
                          style: TextStyle(
                              fontSize: 48,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '24:38',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    )
                  ]),
                  const SizedBox(
                    height: 17,
                  ),
                  Text(
                    S.current.activeOrderScreenOrderAccepted, //'Заказ принят'
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Image.asset(A.assetsActiveOrderPageButtonsImg),
                  orderStages(
                    progressValue: 2,
                  ), //SizedBox with content
                  const SizedBox(
                    height: 49,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: AppColors.color191A1F,
                    height: 96,
                    child: Row(
                      children: [
                        Image.asset(
                          A.assetsDetailPageProductImg,
                          width: 108,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Донер с курицей',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '3 шт',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Text(
                                  '440 ₽',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 11,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: AppColors.color191A1F,
                    height: 96,
                    child: Row(
                      children: [
                        Image.asset(
                          A.assetsDetailPageProductImg,
                          width: 108,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Донер с курицей',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  '3 шт',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 100,
                                ),
                                Text(
                                  '440 ₽',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 11,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 22, right: 27),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.orderSumText, //'Сумма заказа'
                          style: const TextStyle(
                              color: AppColors.color808080,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          '971 ₽',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 22, right: 27),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.serviceFeeText, //'Сервисный сбор'
                          style: const TextStyle(
                              color: AppColors.color808080,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          '30 ₽',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 22, right: 27),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          S.current.activeOrderScreenInTotal, //'Итого'
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Text(
                          '971 ₽',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

SizedBox orderStages({int progressValue = 1}) {
  // progressValue принимает от 1 до 3 включительно
  return SizedBox(
    width: 148,
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Image.asset(
        A.assetsActiveOrderPageForming,
        width: 32,
      ),
      (progressValue > 1)
          ? Image.asset(A.assetsActiveOrderPageCookingOn, width: 32)
          : Image.asset(A.assetsActiveOrderPageCookingOff, width: 32),
      (progressValue == 3)
          ? Image.asset(A.assetsActiveOrderPageDeliveryOn, width: 32)
          : Image.asset(A.assetsActiveOrderPageDeliveryOff, width: 32)
    ]),
  );
}
