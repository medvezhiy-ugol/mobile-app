class Routes {
  static const String main = '/';
  static const String detailMenu = '/detailMenu/:id';
  static const String detailMenuName = 'detailMenu';
  static const String detailStock = '/detailStock/:id';
  static const String detailStockName = 'detailStock';
  static const String home = '/home';
  static const String basket = '/home/basket';
  static const String basketMenuName = 'basketMenu';
  static const String activeOrderPage = '/home/activeOrderPage';
  static const String loaltyCard = '/home/loaltyCard';
  static const String stock = '/stock';
  static const String menu = '/menu';
  static const String map = '/map';
  static const String more = '/more';

  static const String moreAuth = '/more/auth';
  static const String moreAuthCode = '/more/auth/code';
  static const String deliveryInfo = '/more/deliveryInfo';
  static const String aboutApp = '/more/aboutApp';
  static const String termsOfService = '/more/termsOfService';
  static const String contactUs = '/more/contactUs';
  static const String slotHistory = '/stock/slotHistory';
  static const String slotDetail = '/stock/slotDetail';
  static const String myOrders = '/more/myOrders';
  static const String deliveredOrderPage = '/more/myOrders/deliveredOrderPage';
  static const String profilePage = '/more/profilePage';
}

enum MenuRoute {
  home('/home'),
  stock('/stock'),
  menu('/menu'),
  map('/map'),
  more('/more');

  final String path;
  const MenuRoute(this.path);
}
