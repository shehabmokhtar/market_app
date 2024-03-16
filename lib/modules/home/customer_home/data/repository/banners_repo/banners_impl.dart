import 'dart:async';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/newwork/dio_helper.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';
import 'package:market_app/modules/home/customer_home/data/repository/banners_repo/banners_repo.dart';

class BannersRepo extends BannersAbstractRepo {
  @override
  Future<Either<Response, ServerFailure>> getBanners() async {
    final Response response = await DioHelper.get(
      endPoint: Endpoints.banners,
    ).timeout(const Duration(
      seconds: 15,
    ));

    if (response.statusCode == 200) return Left(response);
    return Right(ServerFailure(response.statusMessage));
  }
}
