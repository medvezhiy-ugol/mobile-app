import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/ui/close_circle_button.dart';
import 'package:medvezhiy_ugol/ui/primary_button.dart';
import 'package:medvezhiy_ugol/utils/app_fonts.dart';

import '../../../generated/l10n.dart';
import '../../../utils/app_assets.dart';

class DetailStockPage extends StatelessWidget {
  final String id;

  const DetailStockPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CloseCircleButton(
                onTap: () => context.pop(),
              ),
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 20,
                    ),
                    _buildHeader(),
                    const SizedBox(
                      height: 24,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '''Сделайте заказ online (на сайте или в приложениях) и заберите его в любом удобном ресторане "Медвежий угол" со скидкой 20%.
                    
          Акция не суммируется с другими скидками и специальными предложениями компании , не распространяется на раздел «Напитки», а так-же не суммируется с промокодами на подарочные пиццы.
                    
          При заказе самовывоза в ресторане - минимальная сумма заказа - 1000 руб.
                    ''',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: PrimaryButton(
                        onTap: () => context.pop(),
                        child: Text(
                          S.current.detailStockScreenToUseButtonText,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack _buildHeader() {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            A.assetsDetailStockPageItemImg,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 8,
          left: 20,
          child: Text(
            "-20% на самовывоз $id",
            maxLines: 2,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.unbounded,
              fontSize: 24,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}