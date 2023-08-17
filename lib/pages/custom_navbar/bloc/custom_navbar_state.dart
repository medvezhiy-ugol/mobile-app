part of 'custom_navbar_cubit.dart';

class CustomNavbarState extends Equatable {
  const CustomNavbarState({
    this.context,
    this.index = 0,
    this.isLoading = true,
    this.menu = const [],
    this.card,
    this.order = const [],
    this.orderSum = 0,
    this.adress = '',
  });

  final BuildContext? context;
  final int index;
  final bool isLoading;
  final List<MenuCategory> menu;
  final LoyaltyCard? card;
  final List<MenuProduct> order;
  final int orderSum;
  final String adress;

  CustomNavbarState copyWith({
    BuildContext? context,
    int? index,
    bool? isLoading,
    List<MenuCategory>? menu,
    LoyaltyCard? card,
    List<MenuProduct>? order,
    int? orderSum,
    String? adress,
  }) => CustomNavbarState(
    context: context ?? this.context,
    isLoading: isLoading ?? this.isLoading,
    index: index ?? this.index,
    menu: menu ?? this.menu,
    card: card ?? this.card,
    order: order ?? this.order,
    orderSum: orderSum ?? this.orderSum,
    adress: adress ?? this.adress,
  );

  @override
  List<Object?> get props => [
    context,
    isLoading,
    index,
    menu,
    card,
    order,
    orderSum,
    adress,
  ];
}