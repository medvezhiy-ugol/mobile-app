import 'package:flutter/material.dart';

import '../../../../ui/primary_button.dart';
import '../../../../utils/app_colors.dart';
import '../../map_page.dart';

class FullViewRestaurantWidget extends StatefulWidget {
  FullViewRestaurantWidget({super.key});

  @override
  State<FullViewRestaurantWidget> createState() => _FullViewRestaurantWidgetState();
}

class _FullViewRestaurantWidgetState extends State<FullViewRestaurantWidget> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSwatch(
              accentColor: AppColors.color191A1F,
            ),
          ),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 27,
              ),
              Text(
                'Медвежий угол Свободы Ярославль',
                style: TextStyle(
                  fontFamily: 'Unbounded',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '1,3 км - 150023, Ярославль, улица Свободы, 45',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              InfoBox(
                title: 'Режим работы',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Зал',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Text(
                      'Откроется в 9:00',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.colorFF3838),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 3,
              ),
              InfoBox(
                title: 'Особенности',
                child: RestaurantAttributes(height: 21),
              ),
              SizedBox(
                height: 3,
              ),
              InfoBox(
                title: 'Телефон',
                child: Text(
                  '+79231235673',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              PrimaryButton.icon(
                icon: Icons.map,
                label: Text(
                  'Построить маршрут',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                onTap: () {},
              ),
              SizedBox(
                height: 24,
              ),
              PrimaryButton(
                color: AppColors.colorFFB627,
                child: Text(
                  'Посмотреть меню',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget RestaurantAttributes({
    double height = 30,
  }) {
    return Container(
      height: height,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: AppColors.color26282F,
            child: Center(
              child: Text(
                'Есть завтрак',
                style: TextStyle(
                  fontFamily: 'Unbounded',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            color: AppColors.color26282F,
            child: Center(
              child: Text(
                'Драйв',
                style: TextStyle(
                  fontFamily: 'Unbounded',
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget PrimaryButton({
  Widget InfoBox({required String title, required Widget child}) {
    return Container(
      height: 65,
      color: AppColors.color191A1F,
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.color808080,
            ),
          ),
          Spacer(),
          child
        ],
      ),
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(title: Text('Fade Transition Example')),
//     body: Center(
//       child: 

    // ),
//     floatingActionButton: FloatingActionButton(
//       onPressed: () {
//         setState(() {
//           currentIndex = (currentIndex + 1) % pages.length; // Increment the current index and wrap it around the list.
//         });
//       },
//       child: Icon(Icons.navigate_next),
//     ),
//   );
// }





}
