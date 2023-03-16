class Routes {
  static const String main = '/';
  static const String detail = '/detail/:id';
  static const String detailName = 'detail';
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
