import 'dart:developer';

import 'package:dio/dio.dart';

class APIService {
  static const List<String> url = [
    'http://77.75.230.205:8080',
    'http://77.75.230.205:8080',
  ];

  static Future<dynamic> postRequest({
    required String request,
    Map<String, String> queryParameters = const {},
    Map<String, dynamic> data = const {},
    int serverIndex = 0,
    Map<String, String>? headers = const {},
  }) async {
    try {
      print('${url[serverIndex]}/$request');
      print(headers);
      print(queryParameters);
      print(data);
      var response = await Dio().post(
        '${url[serverIndex]}/$request',
        queryParameters: queryParameters,
        data: data,
        options: Options(
          headers: headers,
        ),
      );
      log(response.statusCode.toString());
      log(response.data.toString());
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      // debugPrint(e.toString());
      return null;
    }
    return null;
  }

  static Future<dynamic> getRequest({
    required String request,
    Map<String, String> queryParameters = const {},
    int serverIndex = 0,
    Map<String, String> headers = const {},
  }) async {
    print("ывфывфыв ${'${url[serverIndex]}/$request'}");
    var response = await Dio().get(
      '${url[serverIndex]}/$request',
      queryParameters: queryParameters,
      options: Options(
        headers: headers
      )
    );
    print("llll ${response.data.toString()}");
    log(response.data.toString());
    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }
}
