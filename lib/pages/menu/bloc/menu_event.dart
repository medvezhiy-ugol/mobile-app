part of 'menu_bloc.dart';

@immutable
abstract class MenuEvent {}

class MenuLoadedEvent extends MenuEvent {
  final List<Widget> menuTabs;

  MenuLoadedEvent({required this.menuTabs});
}
