import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:market_app/core/services/failures.dart';

abstract class BranchAbstractRepo {
// Get near branch
  Future<Either<Response, ServerFailure>> getNearBranch({
    required double lat,
    required double lng,
    required String subDistrictId,
  });
}
