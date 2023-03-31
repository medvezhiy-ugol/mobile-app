// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'menu_bloc.dart';

@immutable
abstract class MenuState {}

class MenuLoadingState extends MenuState {}

class MenuLoadedState extends MenuState {
  final List<MenuCategory> menu;
  final List<Widget> menuTabs;

  MenuLoadedState({
    required this.menu,
    required this.menuTabs,
  });
}
