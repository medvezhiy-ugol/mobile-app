import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../services/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(AuthDefaultState()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthShowButtonEvent) {
        emit(AuthWithButtonState());
      } else if (event is AuthHideButtonEvent) {
        emit(AuthDefaultState());
      } else if (event is AuthSendCodeEvent) {
        String response = 'error';
        response = await authService.getVerificationCode(phone: event.phone);
        if (response.contains('Выполнено')) {
          emit(AuthSuccessState());
        } else {
          emit(AuthErrorState(error: response));
        }
      }
    });
  }
}
