import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../generated/l10n.dart';
import '../../../utils/app_colors.dart';
import '../../common_setup/routes.dart';
import '../../utils/app_fonts.dart';
import '../../utils/icons/more_page_icons.dart';
import '../../utils/icons/social_icons_icons.dart';
import 'bloc/more_bloc.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreBloc, MoreState>(
      builder: (context, state) {
        return SafeArea(
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
                    ? _buildProfileWidget()
                    : Container(),
                SizedBox(
                  height: (state is MoreRegisteredState) ? 84 : 0,
                ),
                (state is MoreRegisteredState)
                    ? _buildRegisteredRow()
                    : Container(),
                SizedBox(
                  height: (state is MoreRegisteredState) ? 10 : 0,
                ),
                _buildDefaultRows(context),
                const SizedBox(
                  height: 7,
                ),
                (state is MoreRegisteredState)
                    ? _buildOurSocials()
                    : Container()
              ],
            ),
          ),
        );
      },
    );
  }

  Column _buildAuthRow(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Text(
          S.of(context).profileScreenProfileTitleText,//'Профиль',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.unbounded),
        ),
        const SizedBox(
          height: 26,
        ),
        Container(
          color: AppColors.color191A1F,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.push(Routes.moreAuth),
              child: Container(
                padding: const EdgeInsets.all(17),
                child: Row(
                  children: [
                    const Icon(
                      MorePageIcons.person,
                      size: 32,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).profileScreenSingIn,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Container(
                          width: screenWidth * 0.6,
                          // color: Colors.blue,
                          child: Text(
                            S.current.profileScreenSlogan,//'Чтобы стать ближе, получать бонусы',
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

  Container _buildOurSocials() {
    return Container(
      color: AppColors.color191A1F,
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                S.current.profileScreenSocialNetworksTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        customBorder: const CircleBorder(),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Icon(SocialIcons.vk)),
                      )),
                  Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        customBorder: const CircleBorder(),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Icon(SocialIcons.youtube)),
                      )),
                  const SizedBox(
                    width: 4,
                  ),
                  Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        customBorder: const CircleBorder(),
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Icon(SocialIcons.instagram)),
                      )),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Column _buildDefaultRows(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: AppColors.color191A1F,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){},
              
              child: Container(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    const Icon(
                      MorePageIcons.settings,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Text(
                      S.current.profileScreenSettings,
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
              onTap: () => context.push(Routes.deliveryInfo),
              child: Container(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children:  [
                    const Icon(
                      MorePageIcons.car,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Text(
                      S.current.profileScreenDeliveryConditions,//'Условия доставки',
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
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(18),
                child: Row(
                  children: [
                    const Icon(
                      MorePageIcons.star,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Text(
                      S.current.profileScreenContactUs,//'Связаться с нами',
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
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    const Icon(
                      MorePageIcons.info,
                      size: 28,
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Text(
                      S.current.profileScreenAboutApp,//'О приложении',
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

  Row _buildRegisteredRow() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 100,
            color: AppColors.color191A1F,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(top: 17, left: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            MorePageIcons.location,
                            size: 24,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            S.current.profileScreenAddresses,//'Адреса',
                            style: const TextStyle(
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
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.only(top: 17, left: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            MorePageIcons.loyal,
                            size: 28,
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            S.current.profileScreenLoyalty,//'Лояльность',
                            style: const TextStyle(
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
    );
  }

  Column _buildProfileWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Денис',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.unbounded),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              '+7 930 103 28 35',
              style: TextStyle(color: AppColors.color808080, fontSize: 14),
            ),
            SizedBox(
              width: 17,
            ),
            Text('youremail@mail.com',
                style: TextStyle(
                  color: AppColors.color808080,
                  fontSize: 14,
                )),
          ],
        ),
      ],
    );
  }
}
