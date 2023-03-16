import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({
    super.key,
    this.id = 0,
  });

  final int id;

  final String title = 'Донер c курицей';
  final String weight = '300';
  final String coast = '220';
  final String ingredients =
      'куриное бедро, помидор, огурец, айсберг, кинза, базилик, соус на выбор';

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.color191A1F,
            border: Border.all(color: Colors.blue, width: 1),
          ),
          child: Column(
            children: [
              Container(
                height: 126,
                color: Colors.blueAccent,
              ),
              SizedBox(
                height: 8,
              ),
              Text('$title'),
              SizedBox(
                height: 8,
              ),
              Text('$weight г.'),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        ingredients,
                        // style: ThemeService
                        //     .detailPageProductIngredientsTextStyle(),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Text('$coast ₽'),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.color26282F,
                  borderRadius: BorderRadius.circular(30)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
