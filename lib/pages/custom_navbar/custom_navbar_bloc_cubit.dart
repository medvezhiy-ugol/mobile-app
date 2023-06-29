import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'custom_navbar_bloc_state.dart';

class CustomNavbarBlocCubit extends Cubit<CustomNavbarBlocState> {
  CustomNavbarBlocCubit() : super(const CustomNavbarBlocState());

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }
}
