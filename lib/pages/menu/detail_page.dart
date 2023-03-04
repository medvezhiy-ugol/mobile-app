import 'package:flutter/material.dart';

import '../../ui/Buttons.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Center(
              child: Container(
                width: 48,
                height: 4,
                decoration: const BoxDecoration(color: AppColors.colorD9D9D9),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
              child: Image.asset(A.assetsDetailPageImg),
            ),
            Text('Донер с курицей'),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: PrimaryButton(
                height: 50,
                text: '220 Р Добавить',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              child: Text('sostav'),
            ),
            StatsBar(),
          ],
        ),
      ),
    );
  }

  Widget StatsBarWidget() {
    return Row();
  }
}
