import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/services/theme_service.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import '../../../generated/l10n.dart';

import '../../../common_setup/routes.dart';
import 'menu_card_widget.dart';

List<Widget> menuSections = [
  DonerSection(),
  DonerSection(),
  DonerSection(),
  DonerSection(),
  DonerSection(),
];

class DonerSection extends StatelessWidget {
  const DonerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                S.current.menuScreenDoners,//'Донеры',
                style: ThemeService.tabBarTitleSectionTextStyle(),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          LayoutGrid(
            columnSizes: [1.fr, 1.fr],
            rowSizes: [auto, auto],
            columnGap: 10,
            rowGap: 10,
            children: [
              //здесь ставь открытие деталки
              MenuCardWidget(onTap: () {
                context.pushNamed(
                  Routes.detailMenuName,
                  params: {'id': '2'},
                );
              }),
              MenuCardWidget(onTap: () {
                context.pushNamed(
                  Routes.detailMenuName,
                  params: {'id': '2'},
                );
              }),
              MenuCardWidget(onTap: () {
                context.pushNamed(
                  Routes.detailMenuName,
                  params: {'id': '2'},
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}