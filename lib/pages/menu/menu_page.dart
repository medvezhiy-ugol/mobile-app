import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

import '../../common_setup/routes.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: InkWell(
          onTap: () {
            context.push(
              Uri(
                path: Routes.detail,
                queryParameters: {'id': '001'},
              ).toString(),
            );
          },
          child: Container(
            height: 80,
            color: Colors.blue,
            child: Center(child: Text('Detail page')),
          ),
        ),
      ),
    );
  }
}