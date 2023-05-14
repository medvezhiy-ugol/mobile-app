part of 'code_auth_bloc.dart';

@immutable
abstract class CodeAuthEvent {}

class CodeAuthShowButtonEvent extends CodeAuthEvent {}

class CodeAuthHideButtonEvent extends CodeAuthEvent {}

class CodeAuthVerificationEvent extends CodeAuthEvent {
  final String phone;
  final String code;
  CodeAuthVerificationEvent({
    required this.phone,
    required this.code,
  });
}
