part of 'loyalty_bloc.dart';

@immutable
abstract class LoyaltyState {}

class LoyaltyInitial extends LoyaltyState {}

class LoyaltyLoadedState extends LoyaltyState {
  final String name;
  final String cardId;
  final double cardBalance;
  
  LoyaltyLoadedState({
    required this.name,
    required this.cardId,
    required this.cardBalance,
  });
}

class LoyaltyLoadingState extends LoyaltyState {}
