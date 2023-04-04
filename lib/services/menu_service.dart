import 'package:medvezhiy_ugol/services/api_service.dart';

import '../models/get_menu.dart';
import '../models/menu.dart';

class MenuService {
  Future<List<MenuCategory>> getFullMenu() async {
    final List<ExternalMenu> externalMenus = await _getAllMenus();
    final response = await APIService.postRequest(
      request: 'v1/menu/iiko/by_id/${externalMenus[1].id}',
    );

    if (response != null) {
      final List<MenuCategory> categories = [];
      for (final menu in response['itemCategories']) {
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
    final response = await APIService.getRequest(request: 'v1/menu');
    if (response != null) {
      final List<ExternalMenu> menus = [];
      for (final menu in response['externalMenus']) {
        menus.add(ExternalMenu.fromJson(menu));
      }
      return menus;
    }
    return [];
  }
}
