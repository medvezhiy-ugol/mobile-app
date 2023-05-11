part of 'loalty_bloc.dart';

@immutable
abstract class LoaltyEvent {}

class LoaltyLoadingEvent extends LoaltyEvent {}

class LoaltyLoadedEvent extends LoaltyEvent {}