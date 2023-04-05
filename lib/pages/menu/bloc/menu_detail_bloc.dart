import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/menu.dart';
import '../../../services/menu_service.dart';

part 'menu_detail_event.dart';
part 'menu_detail_state.dart';

class MenuDetailBloc extends Bloc<MenuDetailEvent, MenuDetailState> {
  final MenuService menuService;
  final String id;

  MenuDetailBloc({
    required this.menuService,
    required this.id,
  }) : super(MenuDetailLoadingState()) {
    _initProduct();
    on<MenuDetailEvent>((event, emit) async {
      if (event is MenuDetailLoadProductByIdEvent) {
        emit(
          (event.menuProduct != null)
              ? MenuDetailLoadedState(menuProduct: event.menuProduct!)
              : MenuDetailErrorState(),
        );
      }
    });
  }

  Future<void> _initProduct() async {
    MenuProduct? menuProduct =
        await Isolate.run(() => menuService.getProductById(id));
    add(MenuDetailLoadProductByIdEvent(menuProduct: menuProduct));
  }
}
