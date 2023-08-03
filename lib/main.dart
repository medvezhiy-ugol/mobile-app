import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/pages/custom_navbar/bloc/custom_navbar_cubit.dart';
import 'package:medvezhiy_ugol/ui/pages/custom_navbar.dart';

import 'common_setup/module_container.dart';
import 'services/menu_service.dart';
import 'services/theme_service.dart';
import 'utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ModuleContainer.initialize(Injector());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.color111216,
    ),
  );
  runApp(UgolApp());
}

class UgolApp extends StatefulWidget {

  UgolApp({super.key});

  @override
  State<UgolApp> createState() => _UgolAppState();
}

class _UgolAppState extends State<UgolApp> {
  final ThemeService themeService = Injector().get<ThemeService>();

  final MenuService menuService = Injector().get<MenuService>();

  double a = 60.5;
  bool b = false;
  double c = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomNavbarCubit(
        service: Injector().get<MenuService>(),
      ),
      child: MaterialApp(
        title: 'Медвежий угол',
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.color111216,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
          bottomNavigationBarTheme: themeService.bottomNavigationBarTheme(),
        ),
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: AppColors.color111216,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
          bottomNavigationBarTheme: themeService.bottomNavigationBarTheme(),
        ),
        themeMode: ThemeMode.dark,
        home: const CustomNavbar()
        ),
    );
  }
}
