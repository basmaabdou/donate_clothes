import 'package:dio/dio.dart';
class DioHelper {
  static Dio? dio;

  static init() {
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://lovely-red-overshirt.cyclic.app/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang='en',
    String? token,
  }) async
  {

    dio!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization': 'Bearer ${token}'??'',
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }


  static Future<Response> postData({
    required String url,
    Map<String,dynamic>? query,
    required Map<String,dynamic> data,
    String lang='en',
    // String? token,
  })async
  {
    dio!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      // 'Authorization':token,
    };
    return dio!.post(url,queryParameters: query,data: data);
  }


  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async
  {
    dio!.options.headers =
    {
      'lang':lang,
      'Authorization': 'Bearer ${token}'??'',
      'Content-Type': 'application/json',
    };

    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}