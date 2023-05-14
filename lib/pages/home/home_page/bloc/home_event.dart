part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeAuthEvent extends HomeEvent {}

class HomeUnAuthEvent extends HomeEvent {}

class HomeLoadingLoyaltyCardEvent extends HomeEvent {}