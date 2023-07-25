import 'package:shared_preferences/shared_preferences.dart';

import 'api_service.dart';

class AuthService {
  final SharedPreferences prefs;

  String _accessToken = '';
  String _refreshToken = '';
  String _phone = '';

  get accessToken => _accessToken;
  get refreshToken => _refreshToken;
  get phone => _phone;

  AuthService({
    required this.prefs,
  }) {
    _accessToken = prefs.getString('token') ?? '';
    _refreshToken = prefs.getString('refresh') ?? '';
    _phone = prefs.getString('phone') ?? '';
  }

  Future<String> getVerificationCode({
    required String phone,
  }) async {
    String phoneNumber = phone;
    phoneNumber = phoneNumber.replaceAll(
        RegExp(r'[^0-9]'), ''); // Remove all non-digit characters
    phoneNumber = "+$phoneNumber";
    final data = await APIService.postRequest(
      serverIndex: 1,
      request: 'v1/login',
      data: {'phone': phoneNumber},
    );
    print(data);
    if (data != null) {
      return data.toString();
    } else {
      return 'Ошибка. Введите корректный телефонный номер и повторите попытку.';
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
    try {
      final data = await APIService.postRequest(
        serverIndex: 1,
        request: 'v1/check/code',
        data: {
          'phone': phoneNumber,
          'code': code,
        },
      );
      if (data != '' && data['access_token'] != '') {
        _accessToken = data['access_token'];
        _phone = phone;
        await prefs.setString('token', data['access_token']);
        await prefs.setString('refresh', data['refresh_token']);
        await prefs.setString('phone', phone);
        return 'Token: ${data['access_token']}';
      }
    } catch (e) {
      return 'Ошибка. Введите корректный код из смс и повторите попытку.';
    }
    return 'Ошибка. Введите корректный код из смс и повторите попытку.';
  }

  signOut() async {
    _accessToken = '';
    _refreshToken = '';
    _phone = '';
    await prefs.setString('token', _accessToken);
    await prefs.setString('refresh', _accessToken);
    await prefs.setString('phone', _phone);
  }
}
