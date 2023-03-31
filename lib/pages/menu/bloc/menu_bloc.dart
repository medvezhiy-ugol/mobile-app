// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/models/menu.dart';
import 'package:meta/meta.dart';

import 'package:medvezhiy_ugol/services/menu_service.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuService menuService;
  List<MenuCategory> _menu = [];
  AutoScrollController listController = AutoScrollController();
  late TabController tabController;

  List<MenuCategory> get menu => _menu;

  MenuBloc({
    required this.menuService,
  }) : super(MenuLoadingState()) {
    _initMenu();
    _updaterForMenuSelectionPosition();
    on<MenuEvent>((event, emit) {
      if (event is MenuLoadedEvent) {
        emit(MenuLoadedState(menu: menu, menuTabs: event.menuTabs));
      }
    });
  }

  Future<void> _initMenu() async {
    _menu = await Isolate.run(menuService.getFullMenu);
    add(MenuLoadedEvent(
      menuTabs: List.generate(menu.length, (index) {
        return Tab(text: menu[index].name);
      }),
    ));
  }

  void _updaterForMenuSelectionPosition() async {
    const double menuSelectionHeight = 300 + 300 + 10 + 10;

    while (true) {
      if (listController.hasClients) {
        int tabSelectionChangeIndex = 0;
        double position = 0;

        position = listController.position.pixels;

        tabSelectionChangeIndex = position ~/ menuSelectionHeight;

        if (tabSelectionChangeIndex <= _menu.length - 1 &&
            !(tabController.indexIsChanging)) {
          tabController.animateTo(tabSelectionChangeIndex);
        }
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }
}
