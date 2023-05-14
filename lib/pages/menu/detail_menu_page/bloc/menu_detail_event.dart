part of 'menu_detail_bloc.dart';

@immutable
abstract class MenuDetailEvent {}

class MenuDetailLoadingEvent extends MenuDetailEvent {
  MenuDetailLoadingEvent();
}

class MenuDetailLoadedEvent extends MenuDetailEvent {
  final MenuProduct menuProduct;

  MenuDetailLoadedEvent({required this.menuProduct});
}

class MenuDetailErrorEvent extends MenuDetailEvent {
  MenuDetailErrorEvent();
}
