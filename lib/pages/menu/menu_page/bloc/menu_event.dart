part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent {}

class MenuLoadingEvent extends MenuEvent {}

class MenuLoadedEvent extends MenuEvent {}

class MenuLoadingErrorEvent extends MenuEvent {}

class MenuRemoveEvent extends MenuEvent {
  final MenuProduct menuProduct;

  MenuRemoveEvent({required this.menuProduct});
}

class MenuRemoveAllEvent extends MenuEvent {
  final MenuProduct menuProduct;

  MenuRemoveAllEvent({required this.menuProduct});
}

class MenuAddToOrderEvent extends MenuEvent {
  final MenuProduct menuProduct;

  MenuAddToOrderEvent({
    required this.menuProduct,
  });
}
