part of 'custom_navbar_bloc_cubit.dart';

class CustomNavbarBlocState extends Equatable {
  const CustomNavbarBlocState({
    this.index = 0,
  });

  final int index;

  CustomNavbarBlocState copyWith({
    int? index,
  }) => CustomNavbarBlocState(
      index: index ?? this.index,
  );

  @override
  List<Object?> get props => [
    index,
  ];
}