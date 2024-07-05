import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://donation-system-utjy.onrender.com/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': 'Bearer ${token}' ?? '',
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': 'Bearer ${token}' ?? '',
    };
    return dio!.post(url, queryParameters: query, data: data);
  }
  static Future<Response> postDonateData({
    required String url,
    Map<String, dynamic>? query,
    FormData? data,
    String lang = 'en',
    String? token, required Options options,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'multipart/form-data',
      'lang': lang,
      'Authorization': 'Bearer ${token ?? ''}',
    };

    try {
      print('Request URL: ${dio!.options.baseUrl}$url');
      print('Request Data: $data');
      print('Request Headers: ${dio!.options.headers}');
      Response response = await dio!.post(url, queryParameters: query, data: data);
      print('Response Data: ${response.data}');
      return response;
    } catch (e) {
      print('Dio Error: $e');
      rethrow;
    }
  }

  static Future<Response> putData({
    required String url,
    required dynamic data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'lang': lang,
      'Authorization': 'Bearer ${token}' ?? '',
      'Content-Type': 'application/json',
    };

    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

}
