import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import '../../../ui/close_circle_button.dart';
import '../../../utils/app_assets.dart';

class DeliveryInfoPage extends StatelessWidget {
  const DeliveryInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CloseCircleButton(
                          onTap: () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(
                          width: 12,
                        )
                      ],
                    ),
                    Text(
                      "Условия доставки",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 48,
                              width: 139,
                              child: Text(
                                'Принимаем заказы',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.color808080,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              height: 76,
                              width: 139,
                              color: AppColors.color191A1F,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                  child: Text(
                                    'Ежедневно с 10:00 до 23:00',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Container(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 48,
                              width: 139,
                              child: Text(
                                'Минимальная сумма',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.color808080,
                                ),
                                maxLines: 2,
                              ),
                            ),
                            Container(
                              height: 76,
                              width: 139,
                              color: AppColors.color191A1F,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                  child: Text(
                                    '500 ₽',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 48,
                            width: 139,
                            child: Text(
                              'Стоимость доставки',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.color808080,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Container(
                            height: 76,
                            width: 139,
                            color: AppColors.color191A1F,
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Center(
                                child: Text(
                                  'Бесплатно',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 22,
              ),

              // Middle Page content
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // "Delivery Time" Plate
                    Container(
                      color: AppColors.color191A1F,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            SizedBox(
                                width: 40,
                                child: Image.asset(
                                  A.assetsActiveOrderPageCookingOff,
                                  height: 40,
                                )),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Время доставки',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: const Text(
                                    'По Ярославлю - 45 минут, по остальной территории - не доставляем',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.color808080,
                                    ),
                                    // maxLines: 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    // "Delivery by courer" Plate
                    Container(
                      color: AppColors.color191A1F,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            // Image.asset(Icon(), width: 40),
                            SizedBox(
                              width: 40,
                              // child: Icon(MorePageIcons.car, size: 25,)
                              child: Image.asset(
                                A.assetsDelveryInfoPageScooter,
                                height: 18,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Доставка курьером',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: const Text(
                                    'Вы оплачиваете только заказ, доставка - бесплатная',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.color808080,
                                    ),
                                    // maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),

                    // "Take away with 10% discount" Plate
                    Container(
                      color: AppColors.color191A1F,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 40,
                              child: Image.asset(
                                  A.assetsActiveOrderPageDeliveryOff,
                                  width: 40),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'С собой со скидкой 10%',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                  maxLines: 2,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: const Text(
                                    '''Вы можете сами забрать заказ из ближайшего ресторана со скидкой в 10%.
Время приготовления заказа - 15 минут.
      
*скидки не распространяются на раздел меню “Напитки”''',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.color808080,
                                    ),
                                    // maxLines: 2,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
