import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/services/theme_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/font_service.dart';

class ModuleContainer {
  static Future<Injector> initialize(Injector injector) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    injector.map<FontService>((i) => FontService(), isSingleton: true);
    injector.map<ThemeService>((i) => ThemeService(), isSingleton: true);
    return injector;
  }
}
