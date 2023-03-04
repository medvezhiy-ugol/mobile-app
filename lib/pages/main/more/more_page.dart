import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/utils/app_colors.dart';
import 'package:medvezhiy_ugol/utils/more_page_icons.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color151515,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                const Text('Профиль', style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),),
                const SizedBox(height: 26,),
                InkWell(
                  onTap: (){},
                  child: Container(
                    color: AppColors.color1C1C1C,
                    padding: const EdgeInsets.all(17),
                    child: Row(
                      children: [
                        const Icon(Icons.person, size: 30,),
                        SizedBox(width: 25,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Войти', style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),),
                            SizedBox(height: 3,),
                            Text('Чтобы стать ближе, получать бонусы', style: TextStyle(
                                color: AppColors.color808080,
                                fontSize: 12,
                                fontWeight: FontWeight.w400
                            ),),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                InkWell(
                  child: Container(
                    color: AppColors.color1C1C1C,
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: const [
                        Icon(Icons.ac_unit, size: 24,),
                        SizedBox(width: 26,),
                        Text('Настройки', style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    color: AppColors.color1C1C1C,
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: const [
                        Icon(Icons.delivery_dining_rounded, size: 24,),
                        SizedBox(width: 26,),
                        Text('Условия доставки', style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    color: AppColors.color1C1C1C,
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: const [
                        Icon(Icons.star, size: 24,),
                        SizedBox(width: 26,),
                        Text('Связаться с нами', style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    color: AppColors.color1C1C1C,
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: const [
                        Icon(Icons.info, size: 24,),
                        SizedBox(width: 26,),
                        Text('О приложении', style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
