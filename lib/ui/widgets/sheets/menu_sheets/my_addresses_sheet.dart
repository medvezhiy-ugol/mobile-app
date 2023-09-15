import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/ui/pages/map/map_page.dart';
import 'package:medvezhiy_ugol/ui/widgets/buttons/custom_button.dart';

import '../../../../models/address_model/address_model.dart';
import '../../../../utils/app_colors.dart';
import '../../menu/my_address.dart';

class MyAddressesSheet extends StatefulWidget {
  const MyAddressesSheet({super.key});

  @override
  State<MyAddressesSheet> createState() => _MyAddressesSheetState();
}

class _MyAddressesSheetState extends State<MyAddressesSheet> {
  late Box<AddressModel> box;
  int _index = 0;
  bool isLoading = true;

  @override
  void initState() {
    getAdresses();
    super.initState();
  }

  void getAdresses() async {
    box = await Hive.openBox<AddressModel>('addresses');
    for (int i = 0; i < box.values.length; i++) {
      if (context.read<CustomNavbarCubit>().state.myAddress == box.values.elementAt(i).name) {
        _index = i;
      }
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
      child: CircularProgressIndicator(),
    )
        : SingleChildScrollView(
          child: Column(
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
              vertical: 8.5,
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
                for (int i = 0; i < box.values.length; i++)
                  GestureDetector(
                    onTap: () {
                      _index = i;
                      setState(() {});
                    },
                    child: MyAddress(
                        title: box.values.elementAt(i).name,
                        subtitle: 'Ярославль',
                        isTapped: _index == i,
                    ),
                  ),
                const SizedBox(height: 1),
                GestureDetector(
                  onTap: () async {
                    context.read<CustomNavbarCubit>().changeIsTakeaway(false);
    await Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const MapPage(
    fromPage: true,
    )));
    setState(() {

    });
    },
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
                  onTap: () async {
                    context.read<CustomNavbarCubit>().changeAddress(box.values.elementAt(_index));
                    Navigator.of(context).pop();
                  },
                  child: const CustomButton(text: 'Готово')
                ),
              ],
            ),
          ),
      ],
    ),
        );
  }
}
