part of 'custom_navbar_cubit.dart';

class CustomNavbarState extends Equatable {
  const CustomNavbarState({
    this.context,
    this.index = 2,
    this.isLoading = true,
    this.menu = const [],
    this.name = '',
    this.birthday = '',
    this.sex = false,
    this.order = const [],
    this.orders = const [],
    this.orderSum = 0,
    this.myAddress,
    this.orderSeconds = 1800,
    this.balance = 0.0,
    this.valueNotifier,
  });

  final BuildContext? context;
  final int index;
  final bool isLoading;
  final List<MenuCategory> menu;
  final List<MenuProduct> order;
  final List<List<MenuProduct>> orders;
  final int orderSum;
  final AddressModel? myAddress;
  final int orderSeconds;
  final String name;
  final String birthday;
  final bool sex;
  final double balance;
  final ValueNotifier<double>? valueNotifier;

  CustomNavbarState copyWith({
    BuildContext? context,
    int? index,
    bool? isLoading,
    List<MenuCategory>? menu,
    List<MenuProduct>? order,
    int? orderSum,
    AddressModel? myAddress,
    List<List<MenuProduct>>? orders,
    int? orderSeconds,
    String? name,
    String? birthday,
    bool? sex,
    double? balance,
    ValueNotifier<double>? valueNotifier,
  }) => CustomNavbarState(
    context: context ?? this.context,
    isLoading: isLoading ?? this.isLoading,
    index: index ?? this.index,
    menu: menu ?? this.menu,
    name: name ?? this.name,
    birthday: birthday ?? this.birthday,
    sex: sex ?? this.sex,
    order: order ?? this.order,
    orderSum: orderSum ?? this.orderSum,
    myAddress: myAddress ?? this.myAddress,
    orders: orders ?? this.orders,
    orderSeconds: orderSeconds ?? this.orderSeconds,
    balance: balance ?? this.balance,
    valueNotifier: valueNotifier ?? this.valueNotifier,
  );

  @override
  List<Object?> get props => [
    context,
    isLoading,
    index,
    menu,
    name,
    birthday,
    sex,
    order,
    orderSum,
    myAddress,
    orders,
    orderSeconds,
    balance,
    valueNotifier,
  ];
}