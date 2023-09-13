import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/pages/more/auth/auth_code_page/code_auth_page.dart';
import 'package:medvezhiy_ugol/ui/pages/more/about_app_page.dart';
import 'package:medvezhiy_ugol/pages/more/about_app/history_order.dart';
import 'package:medvezhiy_ugol/pages/more/over_pages/contact_us_page.dart';
import 'package:medvezhiy_ugol/pages/more/profile/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../utils/app_colors.dart';
import '../../../services/auth_service.dart';
import '../../../utils/icons/more_page_icons.dart';
import '../../../utils/icons/social_icons_icons.dart';
import '../../../pages/more/auth/auth_page/auth_page.dart';
import '../../../pages/more/over_pages/delivery_info_page.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  final authService = Injector().get<AuthService>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color(0xff111216),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                authService.accessToken == ""
                    ? Column(
                  children: [
                    const Text(
                      'Профиль',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Unbounded'
                      ),
                    ),
                    const SizedBox(height: 26),
                    Container(
                      color: AppColors.color191A1F,
                      child: Material(
                        color: Colors.transparent,
                        child: GestureDetector(onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            const AuthPage())),
                          child: Container(
                            color: Colors.transparent,
                            padding: const EdgeInsets.all(17),
                            child: Row(
                              children: [
                                const Icon(
                                    MorePageIcons.person,
                                    color: Color(0xffffffff),
                                    size: 32
                                ),
                                const SizedBox(width: 25),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Войти",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.6,
                                      // color: Colors.blue,
                                      child: const Text(
                                        'Чтобы стать ближе, получать бонусы',
                                        style: TextStyle(
                                            color: AppColors.color808080,
                                            fontSize: 14
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            const ProfilePage()));
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
                                    color: Colors.transparent,
                                  ),
                                  child: const Icon(
                                    Icons.more_horiz,
                                    size: 25,
                                    color: Color(0xffEFEFEF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6.87 ,
                    ),
                    BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
                      buildWhen: (previous, current) => previous.card?.name != current.card?.name,
                      builder: (context, state) {
                        return Text(
                          state.card?.name ?? "",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Unbounded'
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          (authService.phone == '') ? 'phone' : authService.phone,
                          style:
                          const TextStyle(color: AppColors.color808080, fontSize: 14),
                        ),
                        // const SizedBox(
                        //   width: 17,
                        // ),
                        // const Text('youremail@mail.com',
                        //     style: TextStyle(
                        //       color: AppColors.color808080,
                        //       fontSize: 14,
                        //     )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 84,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 100,
                        color: AppColors.color191A1F,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(onTap: () {
                            context.read<CustomNavbarCubit>().changeIndex(3);
                          },
                            child: Container(
                              padding: const EdgeInsets.only(top: 17, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/images/more_page/Location.png'),
                                      const Text(
                                        'Адреса',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),

                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: Container(
                        height: 100,
                        color: AppColors.color191A1F,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              context.read<CustomNavbarCubit>().changeIndex(0);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(top: 17, left: 20, bottom: 20),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                          MorePageIcons.loyal,
                                          size: 28,
                                          color: Color(0xffFFFFFF)
                                      ),
                                      Expanded(
                                        child: SizedBox(),
                                      ),
                                      Text(
                                        'Мои Карты', // 'Мои карты' (на будущее записал),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10
                ),
                Column(
                  children: <Widget>[
                    //My Orders
                    Container(
                      color: AppColors.color191A1F,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (contex) =>
                          const HistoryOrder()));
                        },
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 21,
                                  height: 24,
                                  child: Image.asset('assets/images/more_page/my_orders_icon.png'),
                                ),
                                const SizedBox(width: 26),
                                const Text(
                                  'Мои заказы',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   color: AppColors.color191A1F,
                    //   child: Material(
                    //     color: Colors.transparent,
                    //     child: InkWell(
                    //       onTap: () {},
                    //       child: Container(
                    //         padding: const EdgeInsets.all(18),
                    //         child: Row(
                    //           children: [
                    //             const Icon(
                    //               MorePageIcons.settings,
                    //               size: 28,
                    //             ),
                    //             const SizedBox(
                    //               width: 26,
                    //             ),
                    //             Text(
                    //               S.current.profileScreenSettings,  // Настройки
                    //               style: const TextStyle(
                    //                   color: Colors.white,
                    //                   fontSize: 18,
                    //                   fontWeight: FontWeight.w600),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Container(
                      color: AppColors.color191A1F,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          const DeliveryInfoPage()));
                        },
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            child: const Row(
                              children: [
                                Icon(
                                    MorePageIcons.car,
                                    color: Color(0xffffffff),
                                    size: 28
                                ),
                                SizedBox(width: 26),
                                Text(
                                  'Условия доставки',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: AppColors.color191A1F,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                ContactUsPage()));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            child: const Row(
                              children: [
                                Icon(
                                    MorePageIcons.star,
                                    color: Color(0xffffffff),
                                    size: 28
                                ),
                                SizedBox(width: 26),
                                Text(
                                  'Связаться с нами',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: AppColors.color191A1F,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          const AboutAppPage()));
                        },
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            child: const Row(
                              children: [
                                Icon(
                                    MorePageIcons.info,
                                    color: Color(0xffffffff),
                                    size: 28
                                ),
                                SizedBox(width: 26),
                                Text(
                                  'О приложении',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  color: AppColors.color191A1F,
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            const CodeAuthPage()));
                          },
                            child: const Text(
                              "Наши соцсети",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () async {
                                    var url = Uri.parse('https://vk.com/medvezh_ugol');
                                    try {
                                      await launchUrl(
                                        url,
                                        mode: LaunchMode.externalApplication,
                                      );
                                    } catch (e) {
                                      await launchUrl(
                                        url,
                                        mode: LaunchMode.platformDefault,
                                      );
                                    }
                                  },
                                  customBorder: const CircleBorder(),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: const Icon(
                                        SocialIcons.vk,
                                        color: Color(0xffFFFFFF)
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(onTap: () async {
                                  var url = Uri.parse(
                                      'https://www.instagram.com/medvezh.ugol/');
                                  try {
                                    await launchUrl(
                                      url,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  } catch (e) {
                                    await launchUrl(
                                      url,
                                      mode: LaunchMode.platformDefault,
                                    );
                                  }
                                },
                                  customBorder: const CircleBorder(),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: const Icon(
                                        SocialIcons.youtube,
                                        color: Color(0xffFFFFFF)
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () async {
                                    var url = Uri.parse(
                                        'https://www.instagram.com/medvezh.ugol/');
                                    try {
                                      await launchUrl(
                                        url,
                                        mode: LaunchMode.externalApplication,
                                      );
                                    } catch (e) {
                                      await launchUrl(
                                        url,
                                        mode: LaunchMode.platformDefault,
                                      );
                                    }
                                  },
                                  customBorder: const CircleBorder(),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    child: const Icon(
                                        SocialIcons.instagram,
                                        color: Color(0xffFFFFFF)
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
