import 'package:dio/dio.dart';

class APIService {
  static const List<String> url = [
    'https://medveshii-ugol.lambda-dev.ru',
    'https://medveshii-ugol.lambda-dev.ru',
  ];

  static Future<dynamic> postRequest({
    required String request,
    Map<String, String> queryParameters = const {},
    Map<String, String> data = const {},
    int serverIndex = 0,
  }) async {
    try {
      var response = await Dio().post(
        '${url[serverIndex]}/$request',
        queryParameters: queryParameters,
        data: data,
      );
      // debugPrint(response.data.toString());
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
    try {
      var response = await Dio().get(
        '${url[serverIndex]}/$request',
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );
      //debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      // debugPrint(e.toString());
      return null;
    }
    return null;
  }
}
