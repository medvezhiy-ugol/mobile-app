class Routes {
  static const String main = '/';
  static const String detailMenu = '/detailMenu/:id';
  static const String detailMenuName = 'detailMenu';
  static const String detailStock = '/detailStock/:id';
  static const String detailStockName = 'detailStock';
  static const String home = '/home';
  static const String stock = '/stock';
  static const String menu = '/menu';
  static const String map = '/map';
  static const String more = '/more';
  static const String moreAuth = '/more/auth';
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
