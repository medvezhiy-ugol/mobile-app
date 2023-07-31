import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import '../pages/delivery_page.dart';

class DeliverySwitcher extends StatelessWidget {
  const DeliverySwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: const Color(0xff000000),
          borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CustomNavbarCubit, CustomNavbarState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(state.context!).push(MaterialPageRoute(
                        builder: (context) => const DeliveryPage())),
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: const Text(
                    'Доставка',
                    style: TextStyle(
                      fontFamily: 'Unbounded',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
                color: const Color(0xff2D2D2D),
                borderRadius: BorderRadius.circular(30)
            ),
            child: const Text(
              'Самовывоз',
              style: TextStyle(
                fontFamily: 'Unbounded',
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Color(0xffFFFFFF),
              ),
            ),
          )
        ],
      ),
    );
  }
}
