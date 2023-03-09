import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/theme_service.dart';

class ModuleContainer {
  static Future<Injector> initialize(Injector injector) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    injector.map<ThemeService>((i) => ThemeService(), isSingleton: true);
    return injector;
  }
}
