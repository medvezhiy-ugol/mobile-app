import 'package:shared_preferences/shared_preferences.dart';

import 'api_service.dart';

class AuthService {
  final SharedPreferences prefs;

  String _token = '';

  get token => _token;

  AuthService({
    required this.prefs,
  }) {
    _token = prefs.getString('token') ?? '';
  }

  Future<void> getVerificationCode({
    required String phone,
  }) async {
    String phoneNumber = phone;
    phoneNumber = phoneNumber.replaceAll(
        RegExp(r'[^0-9]'), ''); // Remove all non-digit characters
    phoneNumber = "+$phoneNumber";

    final data = await APIService.postRequest(
        request: 'v1/login', data: {'phone': phoneNumber});
    if (data != null) {
      print('getVerificationCode');
    }
  }

  Future<String> authUser({
    required String phone,
    required String code,
  }) async {
    String phoneNumber = phone;
    phoneNumber = phoneNumber.replaceAll(
        RegExp(r'[^0-9]'), ''); // Remove all non-digit characters
    phoneNumber = "+$phoneNumber";

    final data = await APIService.postRequest(
      request: 'v1/check/code',
      data: {
        'phone': phoneNumber,
        'code': code,
      },
    );
    try {
      if (data != '' && data['access_token'] != '') {
        await prefs.setString('token', data['access_token']);
        return 'Token: ${data['access_token']}';
      }
    } catch (e) {
      return 'Такого пользователя не существует или введен неправильный пароль.';
    }
    return 'Такого пользователя не существует или введен неправильный пароль.';
  }
}
