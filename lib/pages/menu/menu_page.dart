import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common_setup/routes.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          context.pushNamed(
            Routes.detailName,
            params: {'id': '2'},
          );
        },
        child: Container(
          height: 80,
          color: Colors.blue,
          child: Center(child: Text('Detail page')),
        ),
      ),
    );
  }
}
