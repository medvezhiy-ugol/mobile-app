import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:hive/hive.dart';
import '../../../models/address_model/address_model.dart';
import '../../../models/loalty_card.dart';
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
  int _orderSum = 0;

  void init() async {
    Box<AddressModel> box = await Hive.openBox<AddressModel>('myAddress');
    List<MenuCategory> menu = await service.getFullMenu();
    LoyaltyCard? card;
    if (authService.accessToken.isNotEmpty) {
      card = await service.getUserCard(authService.accessToken);
    }
    emit(state.copyWith(
      menu: menu,
      isLoading: false,
      card: card,
      myAddress: box.get("address") == null ? "" : box.get("address")!.name,
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
      myAddress: addressModel.name
    ));
  }

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }

  void getUser() async {
    LoyaltyCard? card = await service.getUserCard(authService.accessToken);
    emit(state.copyWith(
      card: card,
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
}
