part of 'loalty_bloc.dart';

@immutable
abstract class LoaltyState {}

class LoaltyInitial extends LoaltyState {}

class LoaltyLoadedState extends LoaltyState {
  final String name;
  final String cardId;
  final double cardBalance;
  
  LoaltyLoadedState({
    required this.name,
    required this.cardId,
    required this.cardBalance,
  });
}

class LoaltyLoadingState extends LoaltyState {}
