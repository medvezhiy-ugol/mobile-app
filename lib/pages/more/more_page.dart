import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/pages/home/loalty_card/loalty_card_page.dart';
import 'package:medvezhiy_ugol/pages/more/about_app/about_app_page.dart';
import 'package:medvezhiy_ugol/pages/more/about_app/history_order.dart';
import 'package:medvezhiy_ugol/pages/more/my_orders/my_orders_page.dart';
import 'package:medvezhiy_ugol/pages/more/over_pages/contact_us_page.dart';
import 'package:medvezhiy_ugol/pages/more/profile/profile_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/app_colors.dart';
import '../../common_setup/routes.dart';
import '../../services/auth_service.dart';
import '../../utils/icons/more_page_icons.dart';
import '../../utils/icons/social_icons_icons.dart';
import 'auth/auth_page/auth_page.dart';
import 'auth/bloc/more_bloc.dart';
import 'over_pages/delivery_info_page.dart';

class MorePage extends StatelessWidget {
  MorePage({super.key});
  final authService = Injector().get<AuthService>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => MoreBloc(),
  child: BlocBuilder<MoreBloc, MoreState>(
      builder: (context, state) {
        if (state is MoreDefaultState && authService.token != '') {
          context.read<MoreBloc>().add(MoreRegisteredEvent());
        } else if (state is MoreRegisteredState && authService.token == '') {
          context.read<MoreBloc>().add(MoreUnRegisteredEvent());
        }
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            backgroundColor: Color(0xff151515),
            body: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    (state is MoreDefaultState)
                        ? _buildAuthRow(context)
                        : Container(),
                    SizedBox(
                      height: (state is MoreDefaultState) ? 16 : 0,
                    ),
                    (state is MoreRegisteredState)
                        ? _buildProfileWidget(context)
                        : Container(),
                    SizedBox(
                      height: (state is MoreRegisteredState) ? 84 : 0,
                    ),
                    (state is MoreRegisteredState)
                        ? _buildRegisteredRow(context)
                        : Container(),
                    SizedBox(
                      height: (state is MoreRegisteredState) ? 10 : 0,
                    ),
                    _buildDefaultRows(context, state),
                    const SizedBox(
                      height: 7,
                    ),
                    (state is MoreRegisteredState)
                        ? _buildOurSocials(context)
                        : Container()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
);
  }

  Column _buildAuthRow(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Text(
          'Профиль',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'Unbounded'
          ),
        ),
        const SizedBox(
          height: 26,
        ),
        Container(
          color: AppColors.color191A1F,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthPage())),
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(17),
                child: Row(
                  children: [
                    const Icon(
                      MorePageIcons.person,
                      color: Color(0xffffffff),
                      size: 32,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Войти",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        SizedBox(
                          width: screenWidth * 0.6,
                          // color: Colors.blue,
                          child: Text(
                            'Чтобы стать ближе, получать бонусы',
                            style: const TextStyle(
                              color: AppColors.color808080,
                              fontSize: 14,
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
    );
  }

  Container _buildOurSocials(BuildContext context) {
    return Container(
      color: AppColors.color191A1F,
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "Наши соцсети",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
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
    );
  }

  Column _buildDefaultRows(BuildContext context, MoreState state) {
    return Column(
      children: <Widget>[
        //My Orders
        (state is MoreRegisteredState)
            ? Container(
                color: AppColors.color191A1F,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      // context.push(Routes.myOrders);
                      _showSnackBar(
                        context: context,
                        text: 'Данный раздел пока недоступен',
                      );
                    },
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (contex)=> HistoryOrder()));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 21,
                              height: 24,
                              child: Image.asset(
                                'assets/images/more_page/my_orders_icon.png',
                              ),
                            ),
                            const SizedBox(
                              width: 26,
                            ),
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
              )
            : Container(),
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
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => DeliveryInfoPage()));
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    const Icon(
                      MorePageIcons.car,
                      color: Color(0xffffffff),
                      size: 28,
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Text(
                      'Условия доставки',
                      style: const TextStyle(
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
        Container(
          color: AppColors.color191A1F,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactUsPage()));
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    const Icon(
                      MorePageIcons.star,
                      color: Color(0xffffffff),
                      size: 28,
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Text(
                      'Связаться с нами',
                      style: const TextStyle(
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
        Container(
          color: AppColors.color191A1F,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutAppPage()));
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    const Icon(
                      MorePageIcons.info,
                      color: Color(0xffffffff),
                      size: 28,
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Text(
                      'О приложении',
                      style: const TextStyle(
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
      ],
    );
  }

  Row _buildRegisteredRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 100,
            color: AppColors.color191A1F,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/map');
                  // _showSnackBar(
                  //   context: context,
                  //   text: 'Данный раздел пока недоступен',
                  // );
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 17, left: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          ImageIcon(
                            AssetImage('assets/images/more_page/Location.png'),
                            size: 24,
                            color: Color(0xffffffff),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Text(
                            'Адреса',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
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
                  Navigator.of(context).pushNamed('/home');
                  // _showSnackBar(
                  //   context: context,
                  //   text: 'Данный раздел пока недоступен',
                  // );
                },
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoyaltyCardPage()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 17, left: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Icon(
                              MorePageIcons.loyal,
                              size: 28,
                                color: Color(0xffFFFFFF)
                            ),
                            Expanded(
                              child: SizedBox(),
                            ),
                            Text(
                              'Лояльность', // 'Мои карты' (на будущее записал),
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
        ),
      ],
    );
  }

  Column _buildProfileWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
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
        SizedBox(
          height: 6.87 ,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'User',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Unbounded'
              ),
            ),
            // Material(
            //   color: Colors.transparent,
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.of(context).pushNamed(Routes.profilePage);
            //     },
            //     customBorder: const CircleBorder(),
            //     child: Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: SizedBox(
            //         width: 24,
            //         height: 24,
            //         child: DecoratedBox(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(100),
            //             color: Colors.transparent,
            //           ),
            //           child: const Icon(
            //             Icons.more_horiz,
            //             size: 25,
            //             color: Color(0xffEFEFEF),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
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
    );
  }

  _showSnackBar({required BuildContext context, required String text}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      behavior: SnackBarBehavior.floating,
    ));
  }
}
