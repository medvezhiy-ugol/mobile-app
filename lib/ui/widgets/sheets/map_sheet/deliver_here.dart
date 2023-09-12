import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medvezhiy_ugol/models/address_model/address_model.dart';
import 'package:medvezhiy_ugol/ui/pages/map/deliver_here_block.dart';
import 'package:medvezhiy_ugol/ui/widgets/buttons/custom_button.dart';
import '../../../../utils/app_colors.dart';

class DeliverHere extends StatefulWidget {
  const DeliverHere({super.key, required this.onTap, required this.address});

  final Function() onTap;
  final String address;

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
              DeliverHereBlock(controller: apartment),
              DeliverHereBlock(controller: entrance),
              DeliverHereBlock(controller: floor),
              DeliverHereBlock(controller: intercom),
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
              await box.add(AddressModel(
                name: widget.address,
                apartment: apartment.text,
                entrance: entrance.text,
                floor: floor.text,
                intercom: intercom.text,
                comment: comment.text,
              ));
              Navigator.of(context).pop();
            },
              child: const CustomButton(text: 'Доставить сюда')
          ),
          const SizedBox(height: 84)
        ],
      ),
    );
  }
}
