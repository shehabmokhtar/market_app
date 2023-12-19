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
    return await _dio!.post(
      endPoint,
      data: data,
    );
  }
}
