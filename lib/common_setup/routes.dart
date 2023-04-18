class Routes {
  static const String main = '/';
  static const String detailMenu = '/detailMenu/:id';
  static const String detailMenuName = 'detailMenu';
  static const String detailStock = '/detailStock/:id';
  static const String detailStockName = 'detailStock';
  static const String home = '/home';
  static const String basket = '/home/basket';
  static const String basketMenuName = 'basketMenu';
  static const String stock = '/stock';
  static const String menu = '/menu';
  static const String map = '/map';
  static const String more = '/more';
  
  static const String moreAuth = '/more/auth';
  static const String deliveryInfo = '/more/deliveryInfo';
  static const String aboutApp = '/more/aboutApp';
  static const String termsOfService = '/more/termsOfService';
  static const String contactUs = '/more/contactUs';
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
