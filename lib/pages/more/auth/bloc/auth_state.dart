part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthDefaultState extends AuthState {}

class AuthWithButtonState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState({required this.error});
}

class AuthSuccessState extends AuthState {}