import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/ui/pages/map/map_page.dart';
import 'package:medvezhiy_ugol/ui/widgets/buttons/custom_button.dart';

import '../../../utils/app_colors.dart';
import '../menu/my_address.dart';

class MyAddressesSheet extends StatefulWidget {
  const MyAddressesSheet({super.key});

  @override
  State<MyAddressesSheet> createState() => _MyAddressesSheetState();
}

class _MyAddressesSheetState extends State<MyAddressesSheet> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 4,
          width: 48,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: const Color(0xffD9D9D9)
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          decoration: const BoxDecoration(
              color: AppColors.color191A1F,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 24,
                  left: 16,
                  bottom: 23,
                ),
                child: Text(
                  'Мои адреса',
                  style: TextStyle(
                    color: AppColors.colorEFEFEF,
                    fontFamily: 'Unbounded',
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              for (int i = 0; i < 2; i++)
                GestureDetector(
                  onTap: () {
                    _index = i;
                    setState(() {});
                  },
                  child: MyAddress(
                      title: '',
                      subtitle: '',
                      isTapped: _index == i,
                  ),
                ),
              const SizedBox(height: 1),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MapPage(
                    isOrder: true,
                    isDelivery: true
                ),
                )),
                child: Container(
                  height: 65,
                  width: double.infinity,
                  alignment: Alignment.center,
                  color: AppColors.color26282F,
                  child: const Row(
                    children: [
                      SizedBox(width: 16),
                      Icon(
                          Icons.add,
                        color: AppColors.colorFFFFFF,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Добавить новый',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.colorFFFFFF,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 32,
                  left: 16,
                  bottom: 12,
                ),
                child: Text(
                  'Выберите время доставки',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.colorFFFFFF,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const CustomButton(text: 'Готово')
              ),
              // SizedBox(
              //     height: 115,
              //     child: ListView(
              //       children: [
              //         Container(
              //
              //         )
              //       ],
              //     )
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
