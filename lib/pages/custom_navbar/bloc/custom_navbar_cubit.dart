import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:hive/hive.dart';
import '../../../models/address_model/address_model.dart';
import '../../../models/loyalty_card.dart';
import '../../../models/menu.dart';
import '../../../services/auth_service.dart';
import '../../../services/menu_service.dart';

part 'custom_navbar_state.dart';

class CustomNavbarCubit extends Cubit<CustomNavbarState> {
  CustomNavbarCubit({required this.service})
      : super(const CustomNavbarState()) {
    init();
  }

  final MenuService service;
  final AuthService authService = Injector().get<AuthService>();
  final List<MenuProduct> _order = [];
  final List<List<MenuProduct>> orders = [];
  int _orderSum = 0;
  late Timer timer;
  int seconds = 1800;

  void init() async {
    Box<AddressModel> box = await Hive.openBox<AddressModel>('myAddress');
    List<MenuCategory> menu = await service.getFullMenu();
    if (authService.accessToken.isNotEmpty) {
      LoyaltyCard? card = await service.getUserCard(authService.accessToken);
      emit(state.copyWith(
        name: card?.name,
        birthday: card?.birthday,
        sex: card?.sex == 1,
        balance: card?.walletBalances[0].balance,
      ));
    }
    emit(state.copyWith(
      menu: menu,
      isLoading: false,
      myAddress: box.get("address"),
    ));
  }

  void getContext(BuildContext context) async {
    emit(state.copyWith(
      context: context,
    ));
  }

  void changeAddress(AddressModel addressModel) async {
    Box<AddressModel> box = await Hive.openBox<AddressModel>('myAddress');
    await box.put("address", addressModel);
    emit(state.copyWith(
      myAddress: addressModel
    ));
  }

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }

  void getUser() async {
    LoyaltyCard? card = await service.getUserCard(authService.accessToken);
    // Box<LoyaltyCard> box = await Hive.openBox<LoyaltyCard>('user');
    // await box.put("user", card!);
    emit(state.copyWith(
      name: card?.name,
      birthday: card?.birthday,
      sex: card?.sex == 1,
      balance: card?.walletBalances[0].balance,
    ));
  }

  void changeUser(String name, String date, bool sex) {
    // Box<LoyaltyCard> box = await Hive.openBox<LoyaltyCard>('user');
    // await box.put("user", card!);
    emit(state.copyWith(
      name: name,
      birthday: date,
      sex: sex,
    ));
  }

  void addToOrder(MenuProduct menuProduct) {
    _order.add(menuProduct);
    _orderSum += menuProduct.itemSizes.first.prices.first.price;
    emit(state.copyWith(
      order: _order,
      orderSum: _orderSum,
    ));
  }

  void removeFromOrder(MenuProduct menuProduct) {
    _order.remove(menuProduct);
    _orderSum -= menuProduct.itemSizes.first.prices.first.price;
    emit(state.copyWith(
      order: _order,
      orderSum: _orderSum,
    ));
  }

  void removeAllFromOrder(MenuProduct menuProduct) {
    for (int i = 0; i < _order.length; i++) {
      if (_order[i].id == menuProduct.id) {
        _orderSum -= _order[i].itemSizes.first.prices.first.price;
      }
    }
    _order.removeWhere((element) => element.id == menuProduct.id);
    emit(state.copyWith(
      order: _order,
      orderSum: _orderSum,
    ));
  }

  void pay() {
    orders.add(_order);
    _order.clear();
    timer = Timer.periodic(
        const Duration(seconds: 1),
            (timer) {
      if (seconds > 0) {
        seconds--;
        emit(state.copyWith(seconds: seconds));
      }
    });
    emit(state.copyWith(
      orders: orders,
      order: _order,
    ));
  }
}
