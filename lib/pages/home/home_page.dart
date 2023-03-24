import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/services/models/get_menu.dart';
import 'package:medvezhiy_ugol/services/models/menu.dart';
import '../../generated/l10n.dart';

import '../../common_setup/routes.dart';
import '../../services/api_service.dart';
import '../../services/models/product.dart';
import '../../services/models/user.dart';
import '../../utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Container(
          color: AppColors.color26282F,
          height: 50,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () async {
                context.pushNamed(Routes.basketMenuName);

//API test

//User - Пока есть только хто я, рег ещё доделывается как я понял 
                var response = await APIService.getRequest(
                  request: 'v1/whoiam',
                );
                print(response);

//Get Menu
                // var response = await APIService.getRequest(
                //   request: 'v1/menu',
                // );
                // print(GetMenu.fromJson(response).externalMenus[0].id);

//Menu
                // var response = await APIService.postRequest(
                //   request: 'v1/menu/by_id',
                //   data: {
                //     "organizationIds": '503caace-cc66-4f5f-be4a-93b65e03017c',
                //     "externalMenuId": '9583'
                //   },
                // );
                // print(Menu.fromJson(response).itemCategories[0].items[0].name);

//Product
                // var response = await APIService.getRequest(
                //     request:
                //         'v1/menu/product/b5dacdfa-cca8-4e37-9468-e955697f1f52');
                // print(Product.fromJson(response).name);

//API test
              },
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_basket_rounded,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      S.current.trashBucketScreenBucketTitleText,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
