import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medvezhiy_ugol/models/menu.dart';

import '../../../pages/menu/menu_page/bloc/menu_bloc.dart';
import '../../../utils/app_colors.dart';
import '../add_button.dart';
import '../remove_button.dart';

class BasketItem extends StatefulWidget {
  const BasketItem({super.key, required this.product, required this.count});

  final MenuProduct product;
  final int count;

  @override
  State<BasketItem> createState() => _BasketItemState();
}

class _BasketItemState extends State<BasketItem> {

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              context.read<MenuBloc>().add(MenuRemoveAllEvent(menuProduct: widget.product));
            },
            backgroundColor: const Color(0xFFE64646),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Удалить',
          ),
        ],
      ),
      child: Container(
        color: const Color(0xff191A1F),
        child: Row(
          children: [
            SizedBox(
              width: 110,
              height: 100,
              child: CachedNetworkImage(
                imageUrl: widget.product.itemSizes.first.buttonImageUrl!,
                placeholder: (context, url) =>
                    Container(
                      color: AppColors.color26282F,
                    ),
                errorWidget: (context, url, error) =>
                    Container(
                      color: AppColors.color26282F,
                    ),
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                  widget.product.name,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffffffff)
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.read<MenuBloc>().add(MenuRemoveEvent(menuProduct: widget.product));
                        },
                        child: const RemoveButton(),
                      ),
                      const SizedBox(width: 13),
                      Text(
                        widget.count.toString(),
                        style: const TextStyle(
                            color: Color(0xffffffff)
                        ),
                      ),
                      const SizedBox(width: 13),
                      GestureDetector(
                          onTap: () {
                            context.read<MenuBloc>().add(MenuAddToOrderEvent(menuProduct: widget.product));
                          },
                          child: const AddButton()
                      ),
                      const Spacer(),
                      Text(
                        '${widget.product.itemSizes.first.prices.first.price} ₽',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffffffff)
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
