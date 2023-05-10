import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class APIService {
  static const url = 'http://194.116.172.13';

  static Future<dynamic> postRequest(
      {required String request,
      Map<String, String> queryParameters = const {},
      Map<String, String> data = const {}}) async {
    try {
      var response = await Dio()
          .post('$url/$request', queryParameters: queryParameters, data: data);
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }

  static Future<dynamic> getRequest(
      {required String request,
      Map<String, String> queryParameters = const {}}) async {
    try {
      var response =
          await Dio().get('$url/$request', queryParameters: queryParameters);
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
    return null;
  }
}
