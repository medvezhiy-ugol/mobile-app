import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:go_router/go_router.dart';
import 'package:medvezhiy_ugol/pages/home/active_order/active_order_page.dart';
import 'package:medvezhiy_ugol/pages/home/loalty_card_page.dart';

import 'package:medvezhiy_ugol/pages/menu/basket_menu_page.dart';
import 'package:medvezhiy_ugol/pages/more/about_app_page.dart';
import 'package:medvezhiy_ugol/pages/more/auth/code_auth_page.dart';
import 'package:medvezhiy_ugol/pages/more/contact_us_page.dart';
import 'package:medvezhiy_ugol/pages/more/delivery_info_page.dart';
import 'package:medvezhiy_ugol/pages/more/term_of_service_page.dart';
import 'package:medvezhiy_ugol/pages/stock/detail_stock_page.dart';
import 'package:medvezhiy_ugol/pages/stock/slot_detail_page.dart';
import 'package:medvezhiy_ugol/pages/stock/slot_history.dart';

import 'common_setup/module_container.dart';
import 'common_setup/routes.dart';
import 'generated/l10n.dart';
import 'pages/home/home_page.dart';
import 'pages/main_page.dart';
import 'pages/map/map_page.dart';
import 'pages/menu/bloc/menu_bloc.dart';
import 'pages/menu/detail_menu_page.dart';
import 'pages/menu/menu_page.dart';
import 'pages/more/auth/auth_page.dart';
import 'pages/more/auth/profile_page.dart';
import 'pages/more/more_page.dart';
import 'pages/more/my_orders_page.dart';
import 'pages/more/order_delivered_page.dart';
import 'pages/stock/stock_page.dart';
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

class UgolApp extends StatelessWidget {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final ThemeService themeService = Injector().get<ThemeService>();
  final MenuService menuService = Injector().get<MenuService>();

  UgolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuBloc(menuService: menuService),
      child: MaterialApp.router(
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
        routerConfig: GoRouter(
          navigatorKey: _rootNavigatorKey,
          initialLocation: Routes.home,
          routes: [
            ShellRoute(
              builder: (context, state, child) {
                return MainPage(
                  location: state.location,
                  child: child,
                );
              },
              routes: [
                GoRoute(
                  path: Routes.home,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: HomePage()),
                ),
                GoRoute(
                  path: Routes.stock,
                  pageBuilder: (context, state) =>
                      NoTransitionPage(child: StockPage()),
                ),
                GoRoute(
                  path: Routes.menu,
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: MenuPage()),
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
                GoRoute(
                  path: Routes.deliveryInfo,
                  pageBuilder: (context, state) =>
                      buildPageWithPopupTransition<void>(
                    context: context,
                    state: state,
                    child: const DeliveryInfoPage(),
                  ),
                ),
                GoRoute(
                  path: Routes.slotDetail,
                  pageBuilder: (context, state) =>
                      buildPageWithPopupTransition<void>(
                    context: context,
                    state: state,
                    child: const SlotDetailPage(
                      amountWinners: 4,
                    ),
                  ),
                ),
                GoRoute(
                  path: Routes.aboutApp,
                  pageBuilder: (context, state) =>
                      buildPageWithPopupTransition<void>(
                    context: context,
                    state: state,
                    child: const AboutAppPage(),
                  ),
                ),
                GoRoute(
                  path: Routes.slotHistory,
                  pageBuilder: (context, state) =>
                      buildPageWithPopupTransition<void>(
                    context: context,
                    state: state,
                    child: const SlotHistoryPage(),
                  ),
                ),
                GoRoute(
                  path: Routes.loaltyCard,
                  pageBuilder: (context, state) =>
                      buildPageWithPopupTransition<void>(
                    context: context,
                    state: state,
                    child: const LoaltyCardPage(),
                  ),
                ),
                GoRoute(
                  path: Routes.termsOfService,
                  pageBuilder: (context, state) =>
                      buildPageWithPopupTransition<void>(
                    context: context,
                    state: state,
                    child: const TermsOfServicePage(),
                  ),
                ),
                GoRoute(
                  path: Routes.contactUs,
                  pageBuilder: (context, state) =>
                      buildPageWithPopupTransition<void>(
                    context: context,
                    state: state,
                    child: ContactUsPage(),
                  ),
                ),
              ],
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: Routes.moreAuth,
              builder: (context, state) => const AuthPage(),
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: Routes.detailMenu,
              name: Routes.detailMenuName,
              pageBuilder: (context, state) =>
                  buildPageWithPopupTransition<void>(
                context: context,
                state: state,
                child: DetailMenuPage(
                  id: state.params['id'] ?? '1',
                ),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: Routes.detailStock,
              name: Routes.detailStockName,
              pageBuilder: (context, state) =>
                  buildPageWithPopupTransition<void>(
                context: context,
                state: state,
                child: DetailStockPage(
                  id: state.params['id'] ?? '1',
                ),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: Routes.basket,
              name: Routes.basketMenuName,
              pageBuilder: (context, state) =>
                  buildPageWithPopupTransition<void>(
                context: context,
                state: state,
                child: BasketPage(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: Routes.activeOrderPage,
              pageBuilder: (context, state) =>
                  buildPageWithPopupTransition<void>(
                context: context,
                state: state,
                child: const ActiveOrderPage(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: Routes.myOrders,
              pageBuilder: (context, state) =>
                  buildPageWithPopupTransition<void>(
                context: context,
                state: state,
                child: MyOrdersPage(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: Routes.deliveredOrderPage,
              pageBuilder: (context, state) =>
                  buildPageWithPopupTransition<void>(
                context: context,
                state: state,
                child: OrderDeliveredPage(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: Routes.moreAuthCode,
              pageBuilder: (context, state) =>
                  buildPageWithPopupTransition<void>(
                context: context,
                state: state,
                child: CodeAuthPage(),
              ),
            ),
            GoRoute(
              parentNavigatorKey: _rootNavigatorKey,
              path: Routes.profilePage,
              pageBuilder: (context, state) =>
                  buildPageWithPopupTransition<void>(
                context: context,
                state: state,
                child: ProfilePage(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomTransitionPage buildPageWithPopupTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) {
    return CustomTransitionPage<T>(
      opaque: false,
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
