import 'package:dio/dio.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';

class DioHelper {
  static Dio? _dio;

  static intial() {
    _dio = Dio(BaseOptions(
      baseUrl: Endpoints.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    _dio!.options.headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };
    return await _dio!.post(
      endPoint,
      data: data,
    );
  }

  static Future<Response> patch({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    _dio!.options.headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };
    return await _dio!.patch(
      endPoint,
      data: data,
    );
  }

  static Future<Response> get({
    required String endPoint,
  }) async {
    _dio!.options.headers = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };
    return await _dio!.get(endPoint);
  }
}
