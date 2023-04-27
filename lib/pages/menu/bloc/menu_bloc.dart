// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:isolate';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medvezhiy_ugol/models/menu.dart';
import 'package:medvezhiy_ugol/pages/menu/tabbar/menu_card_widget.dart';
import 'package:medvezhiy_ugol/pages/menu/tabbar/menu_sections_widget.dart';
import 'package:meta/meta.dart';

import 'package:medvezhiy_ugol/services/menu_service.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuService menuService;
  List<MenuCategory> _menu = [];
  List<Widget> _menuTabs = [];
  List<MenuProduct> _order = [];
  double _orderSum = 0;
  AutoScrollController listController = AutoScrollController();
  late TabController tabController;

  int menuTabCount = 0;
  List<double> menuSelectionHeight = [];

  List<MenuCategory> get menu => _menu;

  MenuBloc({
    required this.menuService,
  }) : super(MenuLoadingState()) {
    on<MenuEvent>((event, emit) async {
      if (event is MenuLoadedEvent) {
        emit(MenuLoadedState(
            menu: menu,
            menuTabs: _menuTabs,
            order: _order,
            orderSum: _orderSum));
      } else if (event is MenuLoadingErrorEvent) {
        emit(MenuLoadingErrorState(error: 'Ошибка, повторите вновь'));
      } else if (event is MenuLoadingEvent) {
        _initMenu();
      } else if (event is MenuAddToOrderEvent) {
        _order.add(event.menuProduct);
        _orderSum += event.menuProduct.itemSizes.first.prices.first.price;
        emit(MenuLoadedState(
            menu: menu,
            menuTabs: _menuTabs,
            order: _order,
            orderSum: _orderSum));
      }
    });
    add(MenuLoadingEvent());
    _updaterForMenuSelectionPosition();
  }

  Future<void> _initMenu() async {
    double accumulationHeight = 10;
    int gapCount = 0;
    int rowCount = 0;
    try {
      _menu = await Isolate.run(menuService.getFullMenu);
    } catch (e) {
      _menu = [];
    }

    if (_menu.isNotEmpty) {
      _menuTabs = List.generate(menu.length, (index) {
        return Tab(text: menu[index].name);
      });
      add(MenuLoadedEvent());
      menuTabCount = menu.length;
      for (int i = 0; i < menu.length; i++) {
        gapCount = getGapCount((menu[i].items.length / 2).ceil());
        rowCount = getRowCount(i);
        accumulationHeight += (10 +
            5 +
            (rowCount * MenuCardWidget.menuCardWidgetHeight) +
            (gapCount * MenuSection.menuSectionWidgetGapValue) +
            15);
        // print('$i - ${(menu[i].items.length / 2).ceil()} - $accumulationHeight');
        menuSelectionHeight.add(accumulationHeight);
      }
    } else {
      add(MenuLoadingErrorEvent());
    }
  }

  int getRowCount(int index) {
    return (menu[index].items.length / 2).ceil();
  }

  int getGapCount(int rowCount) {
    if (rowCount >= 2) {
      return (rowCount - 1);
    }
    return 1;
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
            // print(
            // '$position - ${menuSelectionHeight[i - 1]} - ${menuSelectionHeight[i]}');
            tabSectionChangeIndex = i;
          }
        }
        // print('$position - $tabSectionChangeIndex');
        if (tabSectionChangeIndex <= menu.length - 1 &&
            !(tabController.indexIsChanging)) {
          tabController.animateTo(tabSectionChangeIndex);
        }
      }
      await Future.delayed(const Duration(milliseconds: 50));
    }
  }
}
