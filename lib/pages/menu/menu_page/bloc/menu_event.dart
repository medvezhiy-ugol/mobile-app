part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent {}

class MenuLoadingEvent extends MenuEvent {}

class MenuLoadedEvent extends MenuEvent {}

class MenuLoadingErrorEvent extends MenuEvent {}

class MenuAddToOrderEvent extends MenuEvent {
  final MenuProduct menuProduct;

  MenuAddToOrderEvent({
    required this.menuProduct,
  });
}
