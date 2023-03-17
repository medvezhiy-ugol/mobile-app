import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

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
          Align(alignment: Alignment.centerLeft, child: Text('Donery'),),
          SizedBox(
            height: 5,
          ),
          LayoutGrid(
            columnSizes: [1.fr, 1.fr],
            rowSizes: [auto, auto],
            columnGap: 10,
            rowGap: 10,
            children: [
              Container(height: 100, color: Colors.red,),
              Container(height: 300, color: Colors.red,),
              Container(height: 300, color: Colors.red,),
              Container(height: 300, color: Colors.red,),
            ],
          ),
        ],
      ),
    );
  }
}
