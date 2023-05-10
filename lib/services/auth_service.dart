import 'package:shared_preferences/shared_preferences.dart';

import 'api_service.dart';

class AuthService {
  final SharedPreferences prefs;

  String _token = '';
  String _phone = '';

  get token => _token;
  get phone => _phone;

  AuthService({
    required this.prefs,
  }) {
    _token = prefs.getString('token') ?? '';
    _phone = prefs.getString('phone') ?? '';
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
    try {
      final data = await APIService.postRequest(
        request: 'v1/check/code',
        data: {
          'phone': phoneNumber,
          'code': code,
        },
      );
      if (data != '' && data['access_token'] != '') {
        _token = data['access_token'];
        _phone = phone;
        await prefs.setString('token', data['access_token']);
        await prefs.setString('phone', phone);
        return 'Token: ${data['access_token']}';
      }
    } catch (e) {
      return 'Такого пользователя не существует или введен неправильный пароль.';
    }
    return 'Такого пользователя не существует или введен неправильный пароль.';
  }

  signOut() async {
    _token = '';
    _phone = '';
    await prefs.setString('token', _token);
    await prefs.setString('phone', _phone);
  }
}
