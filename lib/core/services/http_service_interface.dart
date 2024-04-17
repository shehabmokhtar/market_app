import 'package:dartz/dartz.dart';
import 'package:market_app/core/error/http_failure.dart';

abstract class HttpServiceInterface {
  Future<Either<HttpFailure, T?>> get<T>({
    required String url,
    String? query,
    required T? Function(dynamic) fromJson,
    Map<String, dynamic> headers = const {},
    bool requireToken = true,
  });
}
