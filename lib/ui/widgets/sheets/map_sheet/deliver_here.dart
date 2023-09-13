import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:medvezhiy_ugol/models/address_model/address_model.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/ui/pages/map/deliver_here_block.dart';
import 'package:medvezhiy_ugol/ui/widgets/buttons/custom_button.dart';
import '../../../../utils/app_colors.dart';

class DeliverHere extends StatefulWidget {
  const DeliverHere({super.key, required this.onTap, required this.address, required this.fromPage});

  final Function() onTap;
  final String address;
  final bool fromPage;

  @override
  State<DeliverHere> createState() => _DeliverHereState();
}

class _DeliverHereState extends State<DeliverHere> {
  final TextEditingController apartment = TextEditingController();
  final TextEditingController entrance = TextEditingController();
  final TextEditingController floor = TextEditingController();
  final TextEditingController intercom = TextEditingController();
  final TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: widget.onTap,
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: const BoxDecoration(
                  color: Color(0xff191A1F)
              ),
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  const Icon(
                      Icons.search_rounded,
                      color: Color(0xff808080)
                  ),
                  const SizedBox(width: 11),
                  Text(
                      widget.address,
                    style: const TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 36),
          Row(
            children: [
              DeliverHereBlock(
                text: "Квартира",
                  controller: apartment
              ),
              DeliverHereBlock(
                  text: "Подъезд",
                  controller: entrance
              ),
              DeliverHereBlock(
                  text: "Этаж",
                  controller: floor
              ),
              DeliverHereBlock(
                  text: "Домофон",
                  controller: intercom
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Комментарий для курьера',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff808080)
            ),
          ),
          const SizedBox(height: 2),
          Container(
            height: 112,
            color: AppColors.color191A1F,
            child: TextField(
              controller: comment,
              maxLines: 5,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.colorFFFFFF,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () async {
              Box<AddressModel> box = await Hive.openBox<AddressModel>('addresses');
              AddressModel addressModel = AddressModel(
                name: widget.address,
                apartment: apartment.text,
                entrance: entrance.text,
                floor: floor.text,
                intercom: intercom.text,
                comment: comment.text,
              );
              await box.add(addressModel);
              box = await Hive.openBox<AddressModel>('myAddress');
              box.put("address", addressModel);
              context.read<CustomNavbarCubit>().changeAddress(addressModel);
              if (widget.fromPage) {
                Navigator.of(context).pop();
              }
              else {
                context.read<CustomNavbarCubit>().changeIndex(2);
              }
            },
              child: const CustomButton(text: 'Доставить сюда')
          ),
          const SizedBox(height: 84)
        ],
      ),
    );
  }
}
