import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/pages/auth/auth_page.dart';
import 'package:medvezhiy_ugol/services/theme_service.dart';
import 'utils/app_colors.dart';
import 'utils/module_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ModuleContainer.initialize(Injector());
  runApp(UgolApp());
}

class UgolApp extends StatelessWidget {
  final ThemeService themeService = Injector().get<ThemeService>();

  UgolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Медвежий угол',
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: const [
      //   S.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: S.delegate.supportedLocales,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.color111216,
        bottomNavigationBarTheme: themeService.bottomNavigationBarTheme(),
      ),
      themeMode: ThemeMode.dark,
      home: AuthPage(),
    );
  }
}
