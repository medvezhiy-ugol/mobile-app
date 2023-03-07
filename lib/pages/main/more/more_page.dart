import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:medvezhiy_ugol/utils/more_page_icons.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color151515,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Профиль',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 26,
                ),
                Container(
                  color: AppColors.color1C1C1C,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(17),
                        child: Row(
                          children: [
                            const Icon(
                              MorePageIcons.icon_person,
                              size: 30,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Войти',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Чтобы стать ближе, получать бонусы',
                                  style: TextStyle(
                                      color: AppColors.color808080,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: AppColors.color1C1C1C,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: const [
                            Icon(
                              MorePageIcons.icon_settings,
                              size: 24,
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Text(
                              'Настройки',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: AppColors.color1C1C1C,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: const [
                            Icon(
                              MorePageIcons.icon_car_estate,
                              size: 24,
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Text(
                              'Условия доставки',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: AppColors.color1C1C1C,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: const [
                            Icon(
                              MorePageIcons.icon_star,
                              size: 24,
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Text(
                              'Связаться с нами',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: AppColors.color1C1C1C,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: const [
                            Icon(
                              MorePageIcons.icon_info,
                              size: 24,
                            ),
                            SizedBox(
                              width: 26,
                            ),
                            Text(
                              'О приложении',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class RegisteredPage extends StatelessWidget {
//   const RegisteredPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.color151515,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(10),
//           child: Center(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: const [
//                     Text(
//                       'Денис',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 25,
//                           fontWeight: FontWeight.w600),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: const [
//                     Text(
//                       '+7 930 103 28 35',
//                       style: TextStyle(
//                           color: AppColors.color808080,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400),
//                     ),
//                     SizedBox(
//                       width: 17,
//                     ),
//                     Text(
//                       'youremail@mail.com',
//                       style: TextStyle(
//                           color: AppColors.color808080,
//                           fontSize: 12,
//                           fontWeight: FontWeight.w400),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 26,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         color: AppColors.color1C1C1C,
//                         child: Material(
//                           color: Colors.transparent,
//                           child: InkWell(
//                             onTap: () {},
//                             child: Container(
//                               padding: const EdgeInsets.only(
//                                   top: 17, left: 20, bottom: 20),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: const [
//                                       Icon(
//                                         MorePageIcons.icon_location,
//                                         size: 28,
//                                       ),
//                                       SizedBox(
//                                         height: 14,
//                                       ),
//                                       Text(
//                                         'Адреса',
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 3,
//                     ),
//                     Expanded(
//                       child: Container(
//                         color: AppColors.color1C1C1C,
//                         child: Material(
//                           color: Colors.transparent,
//                           child: InkWell(
//                             onTap: () {},
//                             child: Container(
//                               padding: const EdgeInsets.only(
//                                   top: 17, left: 20, bottom: 20),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: const [
//                                       Icon(
//                                         MorePageIcons.icon_card,
//                                         size: 28,
//                                       ),
//                                       SizedBox(
//                                         height: 14,
//                                       ),
//                                       Text(
//                                         'Лояльность',
//                                         style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.w600),
//                                       ),
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 12,
//                 ),
//                 Container(
//                   color: AppColors.color1C1C1C,
//                   child: Material(
//                     color: Colors.transparent,
//                     child: InkWell(
//                       onTap: () {},
//                       child: Container(
//                         padding: const EdgeInsets.all(18),
//                         child: Row(
//                           children: const [
//                             Icon(
//                               MorePageIcons.icon_settings,
//                               size: 24,
//                             ),
//                             SizedBox(
//                               width: 26,
//                             ),
//                             Text(
//                               'Настройки',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: AppColors.color1C1C1C,
//                   child: Material(
//                     color: Colors.transparent,
//                     child: InkWell(
//                       onTap: () {},
//                       child: Container(
//                         padding: const EdgeInsets.all(18),
//                         child: Row(
//                           children: const [
//                             Icon(
//                               MorePageIcons.icon_car_estate,
//                               size: 24,
//                             ),
//                             SizedBox(
//                               width: 26,
//                             ),
//                             Text(
//                               'Условия доставки',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: AppColors.color1C1C1C,
//                   child: Material(
//                     color: Colors.transparent,
//                     child: InkWell(
//                       onTap: () {},
//                       child: Container(
//                         padding: const EdgeInsets.all(18),
//                         child: Row(
//                           children: const [
//                             Icon(
//                               MorePageIcons.icon_star,
//                               size: 24,
//                             ),
//                             SizedBox(
//                               width: 26,
//                             ),
//                             Text(
//                               'Связаться с нами',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   color: AppColors.color1C1C1C,
//                   child: Material(
//                     color: Colors.transparent,
//                     child: InkWell(
//                       onTap: () {},
//                       child: Container(
//                         padding: const EdgeInsets.all(18),
//                         child: Row(
//                           children: const [
//                             Icon(
//                               MorePageIcons.icon_info,
//                               size: 24,
//                             ),
//                             SizedBox(
//                               width: 26,
//                             ),
//                             Text(
//                               'О приложении',
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 Container(
//                   color: AppColors.color1C1C1C,
//                   padding: const EdgeInsets.all(17),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Column(
//                         children: [
//                           const Text(
//                             'Наши соцсети',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                           const SizedBox(
//                             height: 17,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Material(
//                                   color: Colors.transparent,
//                                   // shape: CircleBorder(),
//                                   child: InkWell(
//                                     onTap: () {},
//                                     customBorder: const CircleBorder(),
//                                     child: Container(
//                                         padding: const EdgeInsets.all(10),
//                                         child:
//                                         const Icon(MorePageIcons.icon_vk)),
//                                   )),
//                               Material(
//                                   color: Colors.transparent,
//                                   // shape: CircleBorder(),
//                                   child: InkWell(
//                                     onTap: () {},
//                                     customBorder: const CircleBorder(),
//                                     child: Container(
//                                         padding: const EdgeInsets.all(10),
//                                         child: const Icon(
//                                             MorePageIcons.icon_youtube)),
//                                   )),
//                               const SizedBox(
//                                 width: 4,
//                               ),
//                               Material(
//                                   color: Colors.transparent,
//                                   // shape: CircleBorder(),
//                                   child: InkWell(
//                                     onTap: () {},
//                                     customBorder: const CircleBorder(),
//                                     child: Container(
//                                         padding: const EdgeInsets.all(10),
//                                         child: const Icon(
//                                             MorePageIcons.icon_instagram_fill)),
//                                   )),
//                             ],
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
