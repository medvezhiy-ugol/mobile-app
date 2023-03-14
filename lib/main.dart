import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/pages/home/home_page.dart';
import 'package:medvezhiy_ugol/pages/map/map_page.dart';
import 'package:medvezhiy_ugol/pages/menu/menu_page.dart';
import 'package:medvezhiy_ugol/pages/more/more_page.dart';
import 'package:medvezhiy_ugol/pages/stock/stock_page.dart';

import 'generated/l10n.dart';
import 'pages/main_page.dart';
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
        initialLocation: Routes.home,
        routes: [
          ShellRoute(
              builder: (context, state, child) {
                return MainPage(
                  child: child,
                );
              },
              routes: [
                GoRoute(
                  path: Routes.home,
                  pageBuilder: (context, state) =>
                      NoTransitionPage(child: HomePage()),
                ),
                GoRoute(
                  path: Routes.stock,
                  pageBuilder: (context, state) =>
                      NoTransitionPage(child: StockPage()),
                ),
                GoRoute(
                  path: Routes.menu,
                  pageBuilder: (context, state) =>
                      NoTransitionPage(child: MenuPage()),
                ),
                GoRoute(
                  path: Routes.map,
                  pageBuilder: (context, state) =>
                      NoTransitionPage(child: MapPage()),
                ),
                GoRoute(
                  path: Routes.more,
                  pageBuilder: (context, state) =>
                      NoTransitionPage(child: MorePage()),
                ),
              ])
        ],
      ),
    );
  }
}
