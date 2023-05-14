// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'menu_bloc.dart';

@immutable
abstract class MenuState {}

class MenuLoadingState extends MenuState {}

class MenuLoadedState extends MenuState {
  final List<MenuCategory> menu;
  final List<Widget> menuTabs;
  final List<MenuProduct> order;
  final double orderSum;

  MenuLoadedState({
    required this.menu,
    required this.menuTabs,
    required this.order,
    required this.orderSum,
  });
}

class MenuLoadingErrorState extends MenuState {
  final String error;

  MenuLoadingErrorState({required this.error});
}
