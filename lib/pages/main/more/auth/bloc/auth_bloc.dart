import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TextEditingController textController = TextEditingController();

  AuthBloc() : super(AuthDefaultState()) {
    on<AuthEvent>((event, emit) {
      if (event is AuthShowButtonEvent) {
        emit(AuthWithButtonState());
      } else if (event is AuthHideButtonEvent) {
        emit(AuthDefaultState());
      }
    });
  }
}
