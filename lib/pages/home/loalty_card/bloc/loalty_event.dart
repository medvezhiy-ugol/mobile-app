part of 'loyalty_bloc.dart';

@immutable
abstract class LoyaltyEvent {}

class LoyaltyLoadingEvent extends LoyaltyEvent {}

class LoyaltyLoadedEvent extends LoyaltyEvent {}