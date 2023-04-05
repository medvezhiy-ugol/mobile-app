part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent {}

class MenuLoadingEvent extends MenuEvent {}

class MenuLoadedEvent extends MenuEvent {
  final List<Widget> menuTabs;

  MenuLoadedEvent({required this.menuTabs});
}

class MenuLoadingErrorEvent extends MenuEvent {}
