import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:market_app/core/services/failures.dart';

abstract class UserAbstractRepo {
  // get user data
  Future<Either<Response, ServerFailure>> getUserData();
}
