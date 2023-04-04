part of 'menu_detail_bloc.dart';

@immutable
abstract class MenuDetailState {}

class MenuDetailLoadingState extends MenuDetailState {}

class MenuDetailLoadedState extends MenuDetailState {
  final MenuProduct menuProduct;

  MenuDetailLoadedState({required this.menuProduct});
}

class MenuDetailErrorState extends MenuDetailState {}
