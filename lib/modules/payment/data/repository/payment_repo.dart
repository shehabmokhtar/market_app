import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_app/core/services/failures.dart';

abstract class PaymentAbstractRepo {
  Future<Either<Response, ServerFailure>> getPayments();
}
