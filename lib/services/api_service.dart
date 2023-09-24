import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const List<String> url = [
    'https://a8e3-109-161-111-52.ngrok-free.app',
    'https://a8e3-109-161-111-52.ngrok-free.app',
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
      debugPrint(e.toString());
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
    print("ргырыро ${'${url[serverIndex]}/$request'}");
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

  //https://a8e3-109-161-111-52.ngrok-free.app

  static Future<dynamic> customRequest(String url) async {
    final response = await http.get(Uri.parse('https://a8e3-109-161-111-52.ngrok-free.app/v1/$url'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    else {
      return null;
    }
  }
}
