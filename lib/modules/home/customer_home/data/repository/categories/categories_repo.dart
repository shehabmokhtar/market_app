import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:market_app/core/services/failures.dart';

abstract class CategoriesAbstractRepo {
  Future<Either<Response, ServerFailure>> getCategories(
      {required String brnachId});
}
