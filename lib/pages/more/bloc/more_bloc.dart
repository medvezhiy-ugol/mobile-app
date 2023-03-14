import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'more_event.dart';
part 'more_state.dart';

class MoreBloc extends Bloc<MoreEvent, MoreState> {
  MoreBloc() : super(MoreDefaultState()) {
    on<MoreEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
