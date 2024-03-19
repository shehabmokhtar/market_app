import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:market_app/core/services/failures.dart';

abstract class AddressAbstractRepo {
  // Get addresses
  Future<Either<Response, ServerFailure>> getCustomerAddresses();
}
