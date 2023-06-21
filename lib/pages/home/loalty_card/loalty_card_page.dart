// import 'dart:io';
// import 'package:barcode/barcode.dart';
import 'package:barcode_widget/barcode_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/services/loalty_service.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common_setup/routes.dart';
import '../../../utils/app_assets.dart';
import 'bloc/loyalty_bloc.dart';

class LoyaltyCardPage extends StatefulWidget {
  LoyaltyCardPage({super.key});

  @override
  State<LoyaltyCardPage> createState() => _LoyaltyCardPageState();
}

class _LoyaltyCardPageState extends State<LoyaltyCardPage> {
  final LoyaltyCardService loyaltyCardService =
      Injector().get<LoyaltyCardService>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoyaltyBloc(loyaltyCardService: loyaltyCardService),
      child: Scaffold(
        body: BlocBuilder<LoyaltyBloc, LoyaltyState>(
          builder: (context, state) {
            if (state is LoyaltyLoadedState) {
              return _buildLoadedBody(context, state);
            } else if (state is LoyaltyLoadingState) {
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
    LoyaltyLoadedState state,
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
                    onTap: () => Navigator.of(context).pop(),
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
                        Padding(
                          padding: const EdgeInsets.all(80.0),
                          child: BarcodeWidget(
                            barcode: Barcode.code128(escapes: true),
                            data: state.cardId,
                            backgroundColor: Colors.white,
                            drawText: false,
                            // margin: EdgeInsets.only(
                            //   left: 50,
                            //   right: 50,
                            // ),
                            // padding: EdgeInsets.only(
                            //   left: 50,
                            //   right: 50,
                            // ),
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
                                      Navigator.of(context).pushNamed(Routes.slotHistory);
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
                    onTap: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(
                    width: 2,
                  )
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Shimmer.fromColors(
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
                                      Navigator.of(context).pushNamed(Routes.slotHistory);
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
    required LoyaltyLoadedState state,
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
            // context.push(Routes.loaltyCard);
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
                    (state.name != '') ? '${state.name}' : 'User',
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
                    '${state.cardBalance}',
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
