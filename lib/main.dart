import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:medvezhiy_ugol/pages/home/active_order_page/active_order_page.dart';
import 'package:medvezhiy_ugol/pages/home/loalty_card/loalty_card_page.dart';
import 'package:medvezhiy_ugol/pages/more/auth/auth_code_page/code_auth_page.dart';
import 'package:medvezhiy_ugol/pages/discounts/discounts_lottery_page/lottery_detail_page.dart';
import 'package:medvezhiy_ugol/pages/discounts/discounts_history_page/discounts_history.dart';
import 'package:medvezhiy_ugol/widgets/custom_navbar.dart';

import 'common_setup/module_container.dart';
import 'common_setup/routes.dart';
import 'pages/home/home_page/home_page.dart';
import 'pages/map/map_page/map_page.dart';
import 'pages/menu/menu_page/bloc/menu_bloc.dart';
import 'pages/menu/menu_page/menu_page.dart';
import 'pages/more/about_app/about_app_page.dart';
import 'pages/more/about_app/personal_data_policy.dart';
import 'pages/more/about_app/privacy_policy.dart';
import 'pages/more/about_app/term_of_service_page.dart';
import 'pages/more/auth/auth_page/auth_page.dart';
import 'pages/more/over_pages/contact_us_page.dart';
import 'pages/more/over_pages/delivery_info_page.dart';
import 'pages/more/profile/profile_page.dart';
import 'pages/more/more_page.dart';
import 'pages/more/my_orders/my_orders_page.dart';
import 'pages/more/my_orders/order_delivered_page.dart';
import 'pages/discounts/discounts_page/discounts_page.dart';
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
  final ThemeService themeService = Injector().get<ThemeService>();
  final MenuService menuService = Injector().get<MenuService>();

  UgolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MenuBloc(menuService: menuService),
      child: MaterialApp(
        title: 'Медвежий угол',
        debugShowCheckedModeBanner: false,
        // localizationsDelegates: const [
        //   S.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate
        // ],
        // supportedLocales: S.delegate.supportedLocales,
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
        initialRoute: Routes.main,
        routes: {
          Routes.main: (context) => const CustomNavbar(),
          Routes.home: (context) => const HomePage(),
          Routes.stock: (context) => StockPage(),
          Routes.menu: (context) => const MenuPage(),
          Routes.map: (context) => MapPage(),
          Routes.more: (context) => MorePage(),
          Routes.deliveryInfo: (context) => const DeliveryInfoPage(),
          Routes.slotDetail: (context) => const SlotDetailPage(
            amountWinners: 4,
          ),
          Routes.aboutApp: (context) => const AboutAppPage(),
          Routes.slotHistory: (context) => const SlotHistoryPage(),
          Routes.loaltyCard: (context) => LoyaltyCardPage(),
          Routes.termsOfService: (context) => const TermsOfServicePage(),
          Routes.privacyPolicy: (context) => const PrivacyPolicyPage(),
          Routes.personalDataPolicy: (context) => const PersonalDataPolicyPage(),
          Routes.contactUs: (context) => ContactUsPage(),
          Routes.moreAuth: (context) => const AuthPage(),
          Routes.activeOrderPage: (context) => const ActiveOrderPage(),
          Routes.myOrders: (context) => MyOrdersPage(),
          Routes.deliveredOrderPage: (context) => OrderDeliveredPage(),
          Routes.moreAuthCode: (context) => const CodeAuthPage(),
          Routes.profilePage: (context) => const ProfilePage(),
        },
      ),
    );
  }
}
