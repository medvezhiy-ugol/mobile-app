import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/loyalty_card_model/loyalty_card.dart';
import 'api_service.dart';
import 'auth_service.dart';

class LoyaltyCardService {
  final authService = Injector().get<AuthService>();
  final SharedPreferences prefs;

  String _cardId = '';
  String _userName = '';

  get cardId => _cardId;
  get userName => _userName;

  LoyaltyCardService({
    required this.prefs,
  }) {
    _cardId = prefs.getString('user_card_id') ?? '';
    _userName = prefs.getString('user_name') ?? '';
  }

  Future<LoyaltyCard?> getUserCard() async {
    final data = await APIService.getRequest(
      serverIndex: 0,
      request: 'v1/whoiam',
      headers: {"Authorization": "Bearer ${authService.accessToken}"},
    );
    if (data != null) {
      var loyaltyCard = LoyaltyCard.fromJson(data);
      _cardId = loyaltyCard.id;
      return loyaltyCard;
    } else {
      return null;
    }
  }
}
