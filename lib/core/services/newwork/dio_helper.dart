import 'package:dio/dio.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';

class DioHelper {
  static Dio? dio;

  static intial() {
    dio = Dio(BaseOptions(
      baseUrl: Endpoints.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }
}
