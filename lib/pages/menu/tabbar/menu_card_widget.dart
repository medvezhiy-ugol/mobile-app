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
          height: 300,
          decoration: BoxDecoration(
            color: AppColors.color191A1F,
            border: Border.all(color: Colors.blue, width: 1),
          ),
          child: Column(
            children: [
              // NetworkImg(),
              Container(height: 100,),
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
                    borderRadius: BorderRadius.circular(30)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NetworkImg extends StatelessWidget {
  const NetworkImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://img.freepik.com/free-photo/side-view-chicken-roll-grilled-chicken-lettuce-cucumber-tomato-and-mayo-in-pita_141793-4849.jpg',
      height: 125,
      fit: BoxFit.fill,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return const Placeholder();
      },
    );
  }
}
