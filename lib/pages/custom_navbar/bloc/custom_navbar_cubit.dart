import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'custom_navbar_state.dart';

class CustomNavbarCubit extends Cubit<CustomNavbarState> {
  CustomNavbarCubit(BuildContext context)
      : super(CustomNavbarState(context: context));

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }
}
