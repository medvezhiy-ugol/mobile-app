// import 'dart:io';
// import 'package:barcode/barcode.dart';
import 'package:barcode_widget/barcode_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/services/loalty_service.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common_setup/routes.dart';
import '../../../services/menu_service.dart';
import '../../../utils/app_assets.dart';
import 'bloc/loalty_bloc.dart';

class LoaltyCardPage extends StatefulWidget {
  LoaltyCardPage({super.key});

  @override
  State<LoaltyCardPage> createState() => _LoaltyCardPageState();
}

class _LoaltyCardPageState extends State<LoaltyCardPage> {
  final LoaltyCardService loaltyCardService =
      Injector().get<LoaltyCardService>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoaltyBloc(loaltyCardService: loaltyCardService),
      child: Scaffold(
        body: BlocBuilder<LoaltyBloc, LoaltyState>(
          builder: (context, state) {
            if (state is LoaltyLoadedState) {
              return _buildLoadedBody(context, state);
            } else if (state is LoaltyLoadingState) {
              return _buildLoadingBody(context);
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoadedBody(
    BuildContext context,
    LoaltyLoadedState state,
  ) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
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
              _buildLoyaltyCard(height: 180, context: context, state: state),
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
                        Row(
                          children: const [
                            SizedBox(
                              width: 13,
                            ),
                            Text(
                              'Данные карты',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 89,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 13),
                            child: BarcodeWidget(
                              barcode: Barcode.code128(escapes: true),
                              data: state.cardId,
                              backgroundColor: Colors.white,
                              drawText: false,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Номер карты',
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.color808080),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(state.cardId.toString(),
                                  style: TextStyle(fontSize: 14)),

                              const SizedBox(
                                height: 16,
                              ),
                              const Text('Баланс баллов',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.color808080)),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(state.cardBalance.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),

                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                color: AppColors.color26282F,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      // context.pop();
                                      // context.push(Routes.slotHistory);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'История в данный момент недоступна',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: AppColors.color111216,
                                              fontSize: 15,
                                            ),
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      // margin: const EdgeInsets.symmetric(horizontal: 18),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'История',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                  baseColor: AppColors.color191A1F,
                  highlightColor: AppColors.color5D6377.withOpacity(0.5),
                  child: Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
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
                        Row(
                          children: const [
                            SizedBox(
                              width: 13,
                            ),
                            Text(
                              'Данные карты',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Shimmer.fromColors(
                            baseColor: AppColors.color191A1F,
                            highlightColor:
                                AppColors.color5D6377.withOpacity(0.5),
                            child: Container(
                              width: double.infinity,
                              height: 89,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Номер карты',
                                style: TextStyle(
                                    fontSize: 14, color: AppColors.color808080),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Shimmer.fromColors(
                                baseColor: AppColors.color191A1F,
                                highlightColor:
                                    AppColors.color5D6377.withOpacity(0.5),
                                child: Container(
                                  color: Colors.white,
                                  height: 20,
                                  width: 150,
                                ),
                              ),

                              const SizedBox(
                                height: 16,
                              ),
                              const Text('Баланс баллов',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.color808080)),
                              const SizedBox(
                                height: 4,
                              ),
                              Shimmer.fromColors(
                                baseColor: AppColors.color191A1F,
                                highlightColor:
                                    AppColors.color5D6377.withOpacity(0.5),
                                child: Container(
                                  height: 20,
                                  width: 150,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Container(
                                color: AppColors.color26282F,
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      // context.pop();
                                      // context.push(Routes.slotHistory);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'История в данный момент недоступна',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: AppColors.color111216,
                                              fontSize: 15,
                                            ),
                                          ),
                                          behavior: SnackBarBehavior.floating,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      // margin: const EdgeInsets.symmetric(horizontal: 18),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              'История',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoyaltyCard({
    required double height,
    required BuildContext context,
    required LoaltyLoadedState state,
  }) {
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
          onTap: () {
            context.push(Routes.loaltyCard);
          },
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
                  child: Text(
                    '${state.name}',
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
                  child: Text(
                    '${state.cardId.substring(state.cardId.length - 4)}',
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
