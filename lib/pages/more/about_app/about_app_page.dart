import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

import '../../../common_setup/routes.dart';
import '../../../generated/l10n.dart';
import '../../../ui/close_circle_button.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.color111216,
      child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 22,
                  ),
                  //  Button
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

                  // Title
                  Text(
                    S.current.profileScreenAboutApp,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 22,
                  ),

                  Row(
                    children: [
                      Image.asset(
                        'assets/images/about_app_page/bearLogo.png',
                        height: 120,
                      ),
                      const SizedBox(
                        width: 17,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: const Text(
                          '''ИП “Красильщиков Роман”\nВерсия 0.1.build2''',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),

                  // "Пользовательское соглашение" Plate
                  Container(
                    color: AppColors.color191A1F,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => context.push(Routes.termsOfService),
                        child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: const Text(
                                    'Пользовательское соглашение',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  // "Пользовательское соглашение" Plate
                  Container(
                    color: AppColors.color191A1F,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          context.push(Routes.privacyPolicy);
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: const Text(
                                    'Политика конфеденциональности',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  // "Пользовательское соглашение" Plate
                  Container(
                    color: AppColors.color191A1F,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          context.push(Routes.personalDataPolicy);
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: const Text(
                                    'Положение об обработке персональных данных',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              )),
            ),
            const SizedBox(
              height: 22,
            ),
          ],
        )),
      ),
    );
  }
}
