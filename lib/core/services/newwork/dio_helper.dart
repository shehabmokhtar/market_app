import 'package:dio/dio.dart';
import 'package:market_app/core/constants/app_languages.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';

class DioHelper {
  static Dio? _dio;

  static intial() {
    _dio = Dio(BaseOptions(
      baseUrl: Endpoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ));
  }

  static Future<Response> post({
    required String endPoint,
    required Map<String, dynamic> data,
    String? lang,
  }) async {
    _dio!.options.headers = {
      'accept': lang,
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return await _dio!.post(
      endPoint,
      data: data,
    );
  }

  static Future<Response> patch({
    required String endPoint,
    required Map<String, dynamic> data,
    int timeout = 15,
  }) async {
    _dio!.options.headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };
    return await _dio!
        .patch(
          endPoint,
          data: data,
        )
        .timeout(Duration(seconds: timeout));
  }

  static Future<Response> get({
    required String endPoint,
    String lang = AppLanguages.english,
    int timeout = 15,
  }) async {
    _dio!.options.headers = {
      'accept': lang,
      'Content-Type': 'application/json',
    };
    return await _dio!.get(endPoint).timeout(Duration(seconds: timeout));
  }
}
