part of 'menu_detail_bloc.dart';

@immutable
abstract class MenuDetailEvent {}

class MenuDetailLoadProductByIdEvent extends MenuDetailEvent {
  final MenuProduct? menuProduct;

  MenuDetailLoadProductByIdEvent({required this.menuProduct});
}
