import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medvezhiy_ugol/pages/stock/slot_machine_widget/slot_machine_widget.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:medvezhiy_ugol/utils/app_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import '../../generated/l10n.dart';

import '../../common_setup/routes.dart';
import '../../ui/primary_button.dart';
import '../../utils/app_assets.dart';

class StockPage extends StatelessWidget {
  StockPage({super.key});
  // final TextEditingController _textMailBodyController = TextEditingController();
  // final TextEditingController _textMailSubjectController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildActiveLotteryBody(context),
            // _buildCompletedLotteryBody(context),
            const SizedBox(
              height: 10,
            ),
            promoTextField(context),
            const SizedBox(
              height: 26,
            ),
            Text(
              S.current.stocksScreenStocksTitleText, //'Акции и комбо',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.unbounded,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            _buildStockItem(context, '1'),
            const SizedBox(
              height: 8,
            ),
            _buildStockItem(context, '2'),
            const SizedBox(
              height: 8,
            ),
            _buildStockItem(context, '3'),
          ],
        ),
      ),
    );
  }

  DateTime dateTime = DateTime(
    2004,
    1,
    26,
    5,
    45,
  );
  Widget _buildCompletedLotteryBody(BuildContext context) {
    String formattedDateTime = DateFormat('d MMMM HH:mm').format(dateTime);
    return Column(
      children: <Widget>[
        SizedBox(
          height: 259,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 259,
                  child: Image.asset(
                    A.assetsStockPageDrawResultsImg,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Результаты\nрозыгрыша',
                  style: TextStyle(
                    fontFamily: 'Unbounded',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        // Icon(Icons.close, color: AppColors.color808080,),
                        Image.asset(
                          'assets/images/stock_page/clock.png',
                          height: 16,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        const Text(
                          '16:30:16 ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'ДО КОНЦА РОЗЫГРЫША',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      formattedDateTime,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PrimaryButton(
                onTap: () => context.push(Routes.slotHistory),
                child: Text(
                  'История',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            VerticalDivider(width: 5.0),
            Expanded(
              child: PrimaryButton(
                onTap: () => context.push(Routes.slotDetail),
                child: Text(
                  'Предыдущая лотерея',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActiveLotteryBody(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Розыгрыш', //'Акции и комбо',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.unbounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const SlotMachineWidget(),
        Container(
          color: AppColors.color191A1F,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => context.push(Routes.slotDetail),
              child: Container(
                padding: const EdgeInsets.all(9),
                height: 100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SimpleCircularProgressBar(
                      size: 45,
                      progressStrokeWidth: 6,
                      backStrokeWidth: 6,
                      backColor: AppColors.color808080,
                      animationDuration: 0,
                      progressColors: const [AppColors.colorFF9900],
                      maxValue: 100,
                      valueNotifier: ValueNotifier(65),
                    ),
                    const SizedBox(
                      width: 13.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              '65%',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              'Ваш процент выигрыша',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.color808080),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            // Icon(Icons.close, color: AppColors.color808080,),
                            Image.asset(
                              'assets/images/stock_page/clock.png',
                              height: 16,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Text(
                              '16:30:16 ',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              'ДО КОНЦА РОЗЫГРЫША',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.color808080),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Text(
                          '7 мар 10:00',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.color808080),
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
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => context.push(Routes.slotHistory),
                child: const Text(
                  'Посмотреть выигрыши',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Stack _buildStockItem(BuildContext context, String id) {
    return Stack(
      children: [
        Container(
          height: 130,
          color: AppColors.color191A1F,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                A.assetsStockPageItemImg,
                height: 130,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Две лучше, чем одна $id',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.unbounded,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      "Скидка на вторую пиццу 20%",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.color808080,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                    const Spacer(),
                    const Text(
                      'Действует до 07.04.2023 г.',
                      style: TextStyle(
                          fontSize: 10,
                          color: AppColors.color808080,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.pushNamed(
                Routes.detailStockName,
                params: {'id': id},
              );
            },
            child: Container(
              height: 127,
            ),
          ),
        ),
      ],
    );
  }

  Container promoTextField(BuildContext context) {
    return Container(
      height: 60,
      color: AppColors.color191A1F,
      alignment: Alignment.center,
      child: const TextField(
        autofocus: false,
        textAlign: TextAlign.center,
        cursorHeight: 26,
        cursorColor: AppColors.colorFF9900,
        // keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Введите промокод',
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.color808080),
          // hintText: ,
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        // inputFormatters: [
        //   MaskTextInputFormatter(
        //     mask: '+7 (###) ###-##-##',
        //   )
        // ],
        // onChanged: (value) {
        //   if (value.length == 18) {
        //     context.read<AuthBloc>().add(AuthShowButtonEvent());
        //   } else if (state is AuthWithButtonState) {
        //     context.read<AuthBloc>().add(AuthHideButtonEvent());
        //   }
        // },
      ),
    );
  }
}
