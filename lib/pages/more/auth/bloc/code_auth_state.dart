part of 'code_auth_bloc.dart';

@immutable
abstract class CodeAuthState {}

class CodeAuthDefaultState extends CodeAuthState {}

class CodeAuthWithButtonState extends CodeAuthState {}

class CodeAuthSuccessState extends CodeAuthState {}

class CodeAuthErrorState extends CodeAuthState {
  final String error;

  CodeAuthErrorState({
    required this.error,
  });
}
