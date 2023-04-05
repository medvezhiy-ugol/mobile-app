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

  int menuTabCount = 0;
  List<double> menuSelectionHeight = [];

  List<MenuCategory> get menu => _menu;

  MenuBloc({
    required this.menuService,
  }) : super(MenuLoadingState()) {
    on<MenuEvent>((event, emit) {
      if (event is MenuLoadedEvent) {
        emit(MenuLoadedState(menu: menu, menuTabs: event.menuTabs));
      } else if (event is MenuLoadingErrorEvent) {
        emit(MenuLoadingErrorState(error: 'Ошибка, повторите вновь'));
      } else if (event is MenuLoadingEvent) {
        _initMenu();
      }
    });
    add(MenuLoadingEvent());
    _updaterForMenuSelectionPosition();
  }

  Future<void> _initMenu() async {
    double accumulationHeight = 0.0;

    _menu = await Isolate.run(menuService.getFullMenu);

    if (!_menu.isEmpty) {
      add(MenuLoadedEvent(
        menuTabs: List.generate(menu.length, (index) {
          return Tab(text: menu[index].name);
        }),
      ));
      menuTabCount = menu.length;
      for (int i = 0; i < menu.length; i++) {
        accumulationHeight += (menu[i].items.length / 2).ceil() * (272.0 + 10);
        // print('$i - ${(menu[i].items.length / 2).ceil()} - $accumulationHeight');
        menuSelectionHeight.add(accumulationHeight);
      }
    } else {
      add(MenuLoadingErrorEvent());
    }
  }

  void _updaterForMenuSelectionPosition() async {
//Смена индекса при прокрутке
    while (true) {
      if (listController.hasClients) {
        int tabSectionChangeIndex = 0;
        double position = listController.position.pixels + 0.01;
        for (int i = 1; i < _menu.length; i++) {
          if ((position >= menuSelectionHeight[i - 1]) &&
              (position <= menuSelectionHeight[i])) {
            print(
                '$position - ${menuSelectionHeight[i - 1]} - ${menuSelectionHeight[i]}');
            tabSectionChangeIndex = i;
          }
        }
        print('$position - $tabSectionChangeIndex');
        if (tabSectionChangeIndex <= menu.length - 1 &&
            !(tabController.indexIsChanging)) {
          tabController.animateTo(tabSectionChangeIndex);
        }
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }
}