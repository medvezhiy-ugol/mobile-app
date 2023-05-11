import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../services/auth_service.dart';

part 'code_auth_event.dart';
part 'code_auth_state.dart';

class CodeAuthBloc extends Bloc<CodeAuthEvent, CodeAuthState> {
  final AuthService authService;
  CodeAuthBloc({required this.authService}) : super(CodeAuthDefaultState()) {
    on<CodeAuthEvent>((event, emit) async {
      if (event is CodeAuthShowButtonEvent) {
        emit(CodeAuthWithButtonState());
      } else if (event is CodeAuthVerificationEvent) {
        String response = 'error';
        response = await authService.authUser(
          phone: event.phone,
          code: event.code,
        );
        if (response.contains('Token: ')) {
        emit(CodeAuthSuccessState());
      } else {
        emit(CodeAuthErrorState(error: response));
      }
        emit(CodeAuthDefaultState());
      }
    });
  }
}
