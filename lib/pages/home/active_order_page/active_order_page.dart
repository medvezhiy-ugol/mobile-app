import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/utils/app_assets.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:medvezhiy_ugol/utils/app_fonts.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import '../../../ui/close_circle_button.dart';

class ActiveOrderPage extends StatelessWidget {
  const ActiveOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 18, top: 18),
              child: CloseCircleButton(
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Ваш заказ",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppFonts.unbounded,
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    _buildProgressBar(),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      "Заказ принят",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    orderStages(
                      progressValue: 1,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    _buildOrderItem(),
                    const SizedBox(
                      height: 4,
                    ),
                    _buildOrderItem(),
                    const SizedBox(
                      height: 12,
                    ),
                    _buildSubsumRow("Сумма заказа", 410),
                    const SizedBox(
                      height: 10,
                    ),
                    _buildSubsumRow("Сервисный сбор", 30),
                    const SizedBox(
                      height: 38,
                    ),
                    _buildTotalRow(),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildProgressBar() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        SimpleCircularProgressBar(
          size: 218,
          progressStrokeWidth: 12,
          backStrokeWidth: 12,
          backColor: AppColors.color191A1F,
          animationDuration: 0,
          progressColors: const [AppColors.colorFF9900],
          maxValue: 100,
          valueNotifier: ValueNotifier(30),
        ),
        Column(
          children: const <Widget>[
            Text(
              'D-72',
              style: TextStyle(
                fontSize: 48,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '24:38',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w200),
            )
          ],
        )
      ],
    );
  }

  Container _buildTotalRow() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "итого",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            '410 ₽',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildSubsumRow(String title, int sum) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: AppColors.color808080,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Text(
            '$sum ₽',
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Container _buildOrderItem() {
    return Container(
      padding: const EdgeInsets.all(10),
      color: AppColors.color191A1F,
      height: 96,
      child: Row(
        children: [
          Image.asset(
            A.assetsDetailPageProductImg,
            width: 108,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Донер с курицей',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '1 шт',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      '190 ₽',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget orderStages({int progressValue = 1}) {
    // progressValue принимает от 1 до 3 включительно
    return SizedBox(
      width: 148,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            A.assetsActiveOrderPageForming,
            width: 32,
          ),
          (progressValue > 1)
              ? Image.asset(A.assetsActiveOrderPageCookingOn, width: 32)
              : Image.asset(A.assetsActiveOrderPageCookingOff, width: 32),
          (progressValue == 3)
              ? Image.asset(A.assetsActiveOrderPageDeliveryOn, width: 32)
              : Image.asset(A.assetsActiveOrderPageDeliveryOff, width: 32)
        ],
      ),
    );
  }
}
