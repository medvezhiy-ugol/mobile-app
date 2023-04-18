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
    on<MenuDetailEvent>((event, emit) async {
      if (event is MenuDetailLoadedEvent) {
        emit(MenuDetailLoadedState(menuProduct: event.menuProduct));
      } else if (event is MenuDetailErrorEvent) {
        emit(MenuDetailErrorState(error: 'Ошибка, повторите вновь'));
      } else if (event is MenuDetailLoadingEvent) {
        _initProduct();
      }
    });
    add(MenuDetailLoadingEvent());
  }

  Future<void> _initProduct() async {
    MenuProduct? menuProduct = await runMyIsolate(menuService, id);
    if (menuProduct != null) {
      add(MenuDetailLoadedEvent(menuProduct: menuProduct));
    } else {
      add(MenuDetailErrorEvent());
    }
  }
}

Future<MenuProduct?> runMyIsolate(MenuService menuService, String id) async {
  return await Isolate.run(() => menuService.getProductById(id));
}
