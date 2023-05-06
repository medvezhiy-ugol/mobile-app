part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthShowButtonEvent extends AuthEvent {}

class AuthHideButtonEvent extends AuthEvent {}

class AuthSendCodeEvent extends AuthEvent {
  final String phone;

  AuthSendCodeEvent({
    required this.phone,
  });
}
