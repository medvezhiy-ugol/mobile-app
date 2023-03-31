// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:go_router/go_router.dart';

import 'package:medvezhiy_ugol/models/menu.dart';
import 'package:medvezhiy_ugol/services/theme_service.dart';

import '../../../common_setup/routes.dart';
import '../../../generated/l10n.dart';
import 'menu_card_widget.dart';

class DonerSection extends StatelessWidget {
  final MenuCategory menuCategory;

  const DonerSection({
    Key? key,
    required this.menuCategory,
  }) : super(key: key);

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
                menuCategory.name,
                style: ThemeService.tabBarTitleSectionTextStyle(),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          LayoutGrid(
            columnSizes: [1.fr, 1.fr],
            rowSizes: List.generate(
                menuCategory.items.length ~/ 2 + 1, (index) => auto),
            columnGap: 10,
            rowGap: 10,
            children: List.generate(
              menuCategory.items.length,
              (i) => MenuCardWidget(
                menuProduct: menuCategory.items[i],
                onTap: () {
                  context.pushNamed(
                    Routes.detailMenuName,
                    params: {'id': menuCategory.items[i].id},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
