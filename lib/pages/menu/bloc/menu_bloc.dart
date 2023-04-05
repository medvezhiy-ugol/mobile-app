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
  double menuSelectionHeight = 0;
  int menuTabCount = 0;

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
    menuTabCount = menu.length;
    for (int i = 0; i < menu.length; i++) {
      print('$i - ${menu[i].items.length}');
      menuSelectionHeight +=
          (menu[i].items.length / 2).ceil() * (272.0 + 10) - 150;
    }
  }

  void _updaterForMenuSelectionPosition() async {
    // final List<double> menuSelectionHeight =
    //     List.generate(menu.length, (index) {
    //   print(menu[index].items.length);
    //   return (menu[index].items.length ~/ 2) * 60.0;
    // });

//Смена индекса при прокруткек
    while (true) {
      if (listController.hasClients) {
        double position = listController.position.pixels + 0.01;
        int tabSectionChangeIndex =
            ((menuTabCount * position) / menuSelectionHeight).toInt();
        print(
            '$position - $menuSelectionHeight - ${((menuTabCount * position) / menuSelectionHeight).toInt()}');
        if (tabSectionChangeIndex <= menu.length - 1 &&
            !(tabController.indexIsChanging)) {
          tabController.animateTo(tabSectionChangeIndex);
        }
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }
}
