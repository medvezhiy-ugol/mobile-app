import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';

import 'generated/l10n.dart';
import 'pages/main/main_page.dart';
import 'pages/main/more/auth/auth_page.dart';
import 'pages/menu/detail_page.dart';
import 'services/theme_service.dart';
import 'utils/app_colors.dart';
import 'common_setup/module_container.dart';
import 'common_setup/routes.dart';

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
    return MaterialApp.router(
      title: 'Медвежий угол',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.color111216,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
        bottomNavigationBarTheme: themeService.bottomNavigationBarTheme(),
      ),
      themeMode: ThemeMode.dark,
      routerConfig: GoRouter(
        initialLocation: Routes.main,
        routes: [
          GoRoute(
            path: Routes.main,
            builder: (context, state) => MainPage(),
          ),
          GoRoute(
            path: Routes.auth,
            builder: (context, state) => AuthPage(),
          ),
          GoRoute(
            path: Routes.detail,
            builder: (context, state) => DetailPage(id: state.params['id']),
          ),
        ],
      ),
    );
  }
}
