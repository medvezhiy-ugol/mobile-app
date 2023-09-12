import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import '../../../../utils/app_colors.dart';
import 'my_addresses_sheet.dart';

class AddressConfirmationSheet extends StatelessWidget {
  const AddressConfirmationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 40,
      ),
      decoration: const BoxDecoration(
        color: AppColors.color191A1F,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(14),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Хотите сделать заказ по этому адресу?',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w400,
              fontSize: 10,
              color: AppColors.color808080,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Хотите сделать заказ по этому адресу?',
            style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: AppColors.colorEFEFEF,
            ),
          ),
          const SizedBox(height: 36),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 39,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: AppColors.colorEFEFEF,
                    ),
                    child: const Text(
                      'Да',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.color26282F,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    showModalBottomSheet(
                      context: context.read<CustomNavbarCubit>().state.context!,
                      backgroundColor: Colors.transparent,
                      builder: (sheetContext) => Padding(
                          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                          child: const MyAddressesSheet()
                      ),
                    );
                  },
                  child: Container(
                    height: 39,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                        border: Border.all(
                          color: AppColors.colorEFEFEF,
                        ),
                    ),
                    child: const Text(
                      'Нет',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: AppColors.colorEFEFEF,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
