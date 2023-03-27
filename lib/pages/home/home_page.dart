import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/ui/primary_button.dart';

import '../../common_setup/routes.dart';
import '../../generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: PrimaryButton.icon(
            onTap: () => context.pushNamed(Routes.basketMenuName),
            icon: Icons.shopping_basket,
            label: Text(
              S.current.trashBucketScreenBucketTitleText,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
