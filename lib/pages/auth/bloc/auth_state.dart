part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthDefaultState extends AuthState {}

class AuthWithButtonState extends AuthState {}
