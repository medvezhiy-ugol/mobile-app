import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';

import '../../../utils/app_colors.dart';

class LoyaltyCardSheet extends StatelessWidget {
  const LoyaltyCardSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff111216),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                        width: 28,
                        height: 28
                    ),
                    Container(
                      width: 48,
                      height: 4,
                      decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(9)
                      ),
                    ),
                    GestureDetector(onTap: () {
                      Navigator.of(context).pop();
                    },
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                            color: Color(0xff808080),
                            shape: BoxShape.circle
                        ),
                        child: const Icon(
                            Icons.close,
                            color: Color(0xffD9D9D9)
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 34),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                      color: const Color(0xff191A1F),
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8, left: 10.34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Карта лояльности",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10,
                                  color: Color(0xffEFEFEF)
                              ),
                            ),
                            SizedBox(height: 19),
                            Text(
                              state.card!.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.colorF3CF7F,
                              ),
                            ),
                            SizedBox(height: 33),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${state.card!.walletBalances[0].balance} ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: AppColors.colorF3CF7F,
                                  ),
                                ),
                                SizedBox(width: 1),
                                Text(
                                  'бонусов',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                    color: AppColors.colorF3CF7F,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Bronze',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xffF3CF7F),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                          ),
                          child:
                          Image.asset(
                              "assets/images/home_page/loyalty_card4.png")
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13, vertical: 17),
                  color: const Color(0xff191A1F),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Данные карты',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Color(0xffE3E3E3),
                        ),
                      ),
                      const SizedBox(height: 14),
                      Image.asset("assets/images/code.png"),
                      const SizedBox(height: 46),
                      const Text(
                        'Номер карты',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff808080),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '000000000000000000',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xffE3E3E3),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Баланс баллов',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff808080),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Синхронизация',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xffE3E3E3),
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'Акции',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xff808080),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
