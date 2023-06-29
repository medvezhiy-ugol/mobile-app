import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../ui/close_circle_button.dart';
import '../../../ui/primary_button.dart';
import '../../../utils/app_colors.dart';
import '../menu_page/bloc/menu_bloc.dart';

class BasketPage extends StatefulWidget {
  BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MenuBloc, MenuState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MenuLoadedState) {
          return _buildLoadedBody(state: state);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  final TextEditingController _textPromoCodeController =
      TextEditingController();
  Widget _buildLoadedBody({required MenuLoadedState state}) {
    var elements = List<String>.generate(
      state.order.length,
      (int index) => state.order[index].id,
    );
    var mapQuantity = Map();
    elements.forEach((element) {
      if (!mapQuantity.containsKey(element)) {
        mapQuantity[element] = 1;
      } else {
        mapQuantity[element] += 1;
      }
    });
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CloseCircleButton(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Text(
                'Корзина',
                style: TextStyle(
                  fontFamily: 'Unbounded',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Очистить корзину',
                style: TextStyle(
                  // fontFamily: 'Unbounded',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.color808080,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              ListView.builder(
                itemCount: state.order.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return _buildSlidableElement(
                    state: state,
                    itemOrderIndex: index,
                    itemPrice: state
                        .order[index].itemSizes.first.prices.first.price
                        .toInt(),
                    quantity: 10,
                    imgUrl: state.order[index].itemSizes.first.buttonImageUrl
                        .toString(),
                    itemName: state.order[index].name,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                color: AppColors.color191A1F,
                child: TextField(
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  controller: _textPromoCodeController,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Promocode',
                    hintStyle: TextStyle(
                      color: Color(0xffFFFFFF)
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: ChooseDeliveryType(),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _buildChooseTimeDelivery(),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: _buildChooseTimeDelivery(),
              ),
              const SizedBox(
                height: 45,
              ),
              _buildSubsumRow(
                title: 'Сумма заказа',
                sum: state.orderSum.toInt(),
              ),
              _buildSubsumRow(title: 'Сервисный сбор', sum: 30),
              const SizedBox(
                height: 56,
              ),
              _buildSubsumRow(
                title: 'При самовывозе',
                sum: state.orderSum.toInt(),
              ),
              _buildTotalRow(sum: state.orderSum.toInt() + 30),
              const SizedBox(
                height: 33,
              ),
              PrimaryButton(
                onTap: () {},
                color: AppColors.color26282F,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.map,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Построить маршрут',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              PrimaryButton(
                height: 56,
                onTap: () {},
                color: AppColors.colorFFB627,
                child: Text(
                  'Оформить заказ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.color121212,
                  ),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlidableElement({
    required String itemName,
    required String imgUrl,
    required int quantity,
    required int itemPrice,
    required int itemOrderIndex,
    required MenuLoadedState state,
  }) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext conteext) {
              setState(() {
                state.order.removeAt(itemOrderIndex);
              });
            },
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
            _buildCachedImg(imgUrl),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text('${itemName}'),
                  ],
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildCirleButton(
                            onTap: () {},
                            icon: Icons.remove,
                          ),
                          // Text('${_counter}'),
                          _buildCirleButton(
                            onTap: () {},
                            icon: Icons.add,
                          ),
                        ],
                      ),
                      Text(
                        '${itemPrice}',
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
      return SizedBox(
        width: 110,
        height: 100,
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          placeholder: (context, url) => Container(
            color: AppColors.color26282F,
          ),
          errorWidget: (context, url, error) => Container(
            color: AppColors.color26282F,
          ),
          fit: BoxFit.fill,
        ),
      );
    } else {
      return Container(
        color: AppColors.color26282F,
        width: 110,
        height: 100,
      );
    }
  }

  Container _buildTotalRow({required int sum}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "итого",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '${sum} ₽',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildSubsumRow({required String title, required int sum}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: AppColors.color808080,
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          Text(
            '$sum ₽',
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _buildChooseTimeDelivery() {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.color191A1F,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.timeline,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                        'Доставка 30-40 минут',
                      style: TextStyle(
                        color: Color(0xffFFFFFF)
                      ),
                    ),
                    Text(
                        'Выберите время доставки',
                      style: TextStyle(
                          color: Color(0xffFFFFFF)
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_right,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum TypeOfOrder<T> {
  delivery<String>('Доставка'),
  pickup<String>('Навынос');

  const TypeOfOrder(this.getType);
  final T getType;
}

class ChooseDeliveryType extends StatefulWidget {
  const ChooseDeliveryType({super.key});

  @override
  State<ChooseDeliveryType> createState() => _ChooseDeliveryTypeState();
}

class _ChooseDeliveryTypeState extends State<ChooseDeliveryType> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: <Widget>[
            Text(
              '${(index == 0) ? 'Доставка' : 'Навынос'}: ',
              style: const TextStyle(
                fontFamily: 'Unbounded',
                fontSize: 16,
                  color: Color(0xffFFFFFF)
              ),
            ),
            Text(
              'Ярославль',
              style: TextStyle(
                fontFamily: 'Unbounded',
                fontSize: 16,
                color: Color(0xffFFFFFF)
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //delivery
            Container(
              decoration: BoxDecoration(
                color: (TypeOfOrder.delivery.index == index)
                    ? AppColors.color2D2D2D
                    : const Color(0xFF000000),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    setState(() {
                      index = 0;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.motorcycle,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Доставка',
                              style: TextStyle(
                                color: Color(0xffFFFFFF)
                              ),
                            ),
                            Text(
                                '30-40 минут',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF)
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            //pickup
            Container(
              decoration: BoxDecoration(
                color: (TypeOfOrder.pickup.index == index)
                    ? AppColors.color2D2D2D
                    : const Color(0xFF000000),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    setState(() {
                      index = 1;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.shopping_bag_rounded,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Навынос'),
                            Text('Московский пр. 178'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
