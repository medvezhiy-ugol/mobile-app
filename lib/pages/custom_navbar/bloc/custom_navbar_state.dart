part of 'custom_navbar_cubit.dart';

class CustomNavbarState extends Equatable {
  const CustomNavbarState({
    this.context,
    this.index = 2,
    this.isLoading = true,
    this.menu = const [],
    this.card,
    this.order = const [],
    this.orders = const [],
    this.orderSum = 0,
    this.myAddress,
    this.seconds = 1800,
  });

  final BuildContext? context;
  final int index;
  final bool isLoading;
  final List<MenuCategory> menu;
  final LoyaltyCard? card;
  final List<MenuProduct> order;
  final List<List<MenuProduct>> orders;
  final int orderSum;
  final AddressModel? myAddress;
  final int seconds;

  CustomNavbarState copyWith({
    BuildContext? context,
    int? index,
    bool? isLoading,
    List<MenuCategory>? menu,
    LoyaltyCard? card,
    List<MenuProduct>? order,
    int? orderSum,
    AddressModel? myAddress,
    List<List<MenuProduct>>? orders,
    int? seconds,
  }) => CustomNavbarState(
    context: context ?? this.context,
    isLoading: isLoading ?? this.isLoading,
    index: index ?? this.index,
    menu: menu ?? this.menu,
    card: card ?? this.card,
    order: order ?? this.order,
    orderSum: orderSum ?? this.orderSum,
    myAddress: myAddress ?? this.myAddress,
    orders: orders ?? this.orders,
    seconds: seconds ?? this.seconds,
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
    myAddress,
    orders,
    seconds,
  ];
}