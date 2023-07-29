import 'package:flutter/material.dart';

import '../../pages/more/over_pages/delivery_info_page.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DeliveryInfoPage())),
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
