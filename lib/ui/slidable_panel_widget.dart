import 'dart:collection';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../utils/app_colors.dart';

class SlidableWidget extends StatefulWidget {
  const SlidableWidget({
    super.key,
    required this.imgUrl,
    required this.quantity,
    required this.itemPrice,
    required this.itemName,
  });

  final String itemName;
  final String imgUrl;
  final int quantity;
  final int itemPrice;

  @override
  State<SlidableWidget> createState() => _SlidableWidgetState();
}

class _SlidableWidgetState extends State<SlidableWidget> {
  int _counter = 0;

  @override
  initState() {
    super.initState();
    _counter = widget.quantity;
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext conteext) {},
            backgroundColor: const Color(0xFFE64646),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Удалить',
          ),
        ],
      ),
      child: Container(
        // constraints: BoxConstraints(
        //   minHeight: 100,
        // ),
        child: Row(
          children: [
            _buildCachedImg(widget.imgUrl),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text('${widget.itemName}'),
                  ],
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildCirleButton(
                            onTap: () {
                              _decrementCounter();
                            },
                            icon: Icons.remove,
                          ),
                          Text('${_counter}'),
                          _buildCirleButton(
                            onTap: () {
                              _incrementCounter();
                            },
                            icon: Icons.add,
                          ),
                        ],
                      ),
                      Text(
                        '${widget.itemPrice}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCirleButton(
      {required VoidCallback onTap, required IconData icon}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 24,
            height: 24,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: Colors.grey),
              child: Icon(
                icon,
                size: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCachedImg(String imgUrl) {
    if (imgUrl != '') {
      return CachedNetworkImage(
        imageUrl: imgUrl,
        placeholder: (context, url) => Container(
          color: AppColors.color26282F,
        ),
        errorWidget: (context, url, error) => Container(
          color: AppColors.color26282F,
        ),
        fit: BoxFit.fill,
      );
    } else {
      return Container(
        color: AppColors.color26282F,
        width: 110,
        height: 100,
      );
    }
  }
}
