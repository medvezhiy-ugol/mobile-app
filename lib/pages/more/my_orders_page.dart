import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:medvezhiy_ugol/generated/l10n.dart';

import '../../ui/close_circle_button.dart';
import '../../utils/app_colors.dart';

class MyOrdersPage extends StatelessWidget {
  MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color111216,
      body: SafeArea(
        child: SingleChildScrollView(
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
                    width: 12,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Заказы',
                    style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 5.0),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildOrderHostoryItem(
                    dateTime: DateTime(
                      2004,
                      1,
                      26,
                      5,
                      45,
                    ),
                    itmes: [
                      'Doner, pizza, vok',
                    ],
                    price: 1550.05,
                    status: 'done',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderHostoryItem({
    required List<String> itmes,
    required double price,
    required String status,
    required DateTime dateTime,
  }) {
    String formattedDateTime = DateFormat('d MMMM HH:mm').format(dateTime);
    return Container(
      color: AppColors.color191A1F,
      padding: EdgeInsets.all(
        12,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                itmes.join(', '),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$price ₽',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _buildStatus(status),
              SizedBox(
                width: 10,
              ),
              Text(
                '$formattedDateTime',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.color808080,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 50,
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  width: 65,
                  color: Colors.red,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 5.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatus(String status) {
    if (status == 'done') {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.colorFF9900,
        ),
        padding: EdgeInsets.all(5),
        child: Center(
          child: Text(
            'Доставлен',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else if (status == 'cancel') {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.color5D6377,
        ),
        padding: EdgeInsets.all(5),
        child: Center(
          child: Text(
            'Отменён',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
