import 'package:dio/dio.dart';
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
    String? requestToken,
  }) async {
    _dio!.options.headers = {
      'accept': lang,
      'Content-Type': 'application/json',
      'Authorization': requestToken
    };
    return await _dio!.post(
      endPoint,
      data: data,
    );
  }

  static Future<Response> patch({
    required String endPoint,
    dynamic data,
    String? lang,
    String? token,
  }) async {
    _dio!.options.headers = {
      'accept': lang ?? '*/*',
      'Content-Type': 'application/json',
      'Authorization': token ?? ''
    };
    return await _dio!.patch(
      endPoint,
      data: data,
    );
  }

  static Future<Response> get({
    required String endPoint,
    String? lang,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    _dio!.options.headers = {
      'accept': lang ?? '*/*',
      'Content-Type': 'application/json',
      'Authorization': token ?? ''
    };
    return await _dio!.get(
      endPoint,
      queryParameters: query,
    );
  }

  static Future<Response> delete({
    required String endPoint,
    String? lang,
    String? requestToken,
  }) async {
    _dio!.options.headers = {
      'accept': lang ?? '*/*',
      'Content-Type': 'application/json',
      'Authorization': requestToken ?? ''
    };
    return await _dio!.delete(
      endPoint,
    );
  }
}
