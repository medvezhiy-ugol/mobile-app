part of 'more_bloc.dart';

@immutable
abstract class MoreEvent {}

class MoreUnRegisteredEvent extends MoreEvent {}

class MoreRegisteredEvent extends MoreEvent {}