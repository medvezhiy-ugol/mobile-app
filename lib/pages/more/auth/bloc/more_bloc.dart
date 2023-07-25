import 'package:bloc/bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:meta/meta.dart';

import '../../../../services/auth_service.dart';

part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  final authService = Injector().get<AuthService>();
  MoreBloc() : super(MoreDefaultState()) {
    on<MoreEvent>((event, emit) {
      if (event is MoreUnRegisteredEvent) {
        emit(MoreDefaultState());
      } else if (event is MoreRegisteredEvent || authService.accessToken != '') {
        emit(MoreRegisteredState());
      }
    });
  }
}
