part of 'custom_navbar_cubit.dart';

class CustomNavbarState extends Equatable {
  const CustomNavbarState({
    required this.context,
    this.index = 0,
  });

  final BuildContext context;
  final int index;

  CustomNavbarState copyWith({
    int? index,
  }) => CustomNavbarState(
    context: context,
      index: index ?? this.index,
  );

  @override
  List<Object?> get props => [
    context,
    index,
  ];
}