part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeAuthState extends HomeState {
  final String name;
  final String cardId;
  final double cardBalance;

  HomeAuthState({
    required this.name,
    required this.cardId,
    required this.cardBalance,
  });
}

class HomeUnAuthState extends HomeState {}

class HomeLoadingLoyaltyCardState extends HomeState {}