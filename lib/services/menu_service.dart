import 'dart:convert';
import 'dart:developer';

import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:http/http.dart';
import 'package:medvezhiy_ugol/services/api_service.dart';

import '../models/get_menu.dart';
import '../models/loyalty_card.dart';
import '../models/menu.dart';
import 'auth_service.dart';

class MenuService {

  Future<List<MenuCategory>> getFullMenu() async {
    final List<ExternalMenu> externalMenus = await _getAllMenus();
    print(externalMenus);
    final response = await APIService.postRequest(
      request: 'v1/menu/iiko/by_id/${externalMenus[0].id}',
    );


    if (response != null) {
      final List<MenuCategory> categories = [];
      for (var menu in response['itemCategories']) {
        categories.add(MenuCategory.fromJson(menu));
      }

      return categories;
    }
    return [];
  }

  Future<MenuProduct?> getProductById(String id) async {
    final response = await APIService.getRequest(
      request: 'v1/menu/product/$id',
    );

    if (response != null) {
      return MenuProduct.fromJson(response);
    }

    return null;
  }

  void getListOfOrgs() {}

  Future<List<ExternalMenu>> _getAllMenus() async {
    final response = await APIService.customRequest('menu');

    if (response != null) {
      final List<ExternalMenu> menus = [];
      for (final menu in response['externalMenus']) {
        menus.add(ExternalMenu.fromJson(menu));
      }
      return menus;
    }
    return [];
  }

  Future<LoyaltyCard?> getUserCard(String accessToken) async {
    final authService = Injector().get<AuthService>();
    var request = await get(
      Uri.parse("https://a8e3-109-161-111-52.ngrok-free.app/v1/whoiam"),
      headers: {"Authorization": "Bearer ${authService.accessToken}"},
    );
    if (request.statusCode == 401) {
      final refresh = await post(
        Uri.parse("https://a8e3-109-161-111-52.ngrok-free.app/v1/refresh"),
        headers: {"Authorization": "Bearer ${authService.refreshToken}"},
      );
      final body = jsonDecode(refresh.body);
      authService.setTokens(body['access_token'], body['refresh_token']);
      request = await get(
        Uri.parse("https://a8e3-109-161-111-52.ngrok-free.app/v1/whoiam"),
        headers: {"Authorization": "Bearer ${body['access_token']}"},
      );
    }
    log(request.body);
    if (request.statusCode == 200) {
      return LoyaltyCard.fromJson(jsonDecode(request.body));
    }
    else {
      return null;
    }
  }
}
