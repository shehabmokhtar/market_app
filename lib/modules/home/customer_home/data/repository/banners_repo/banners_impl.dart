import 'dart:async';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:market_app/core/constants/app_languages.dart';
import 'package:market_app/core/constants/variables.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/newwork/dio_helper.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/home/customer_home/data/repository/banners_repo/banners_repo.dart';

class BannersRepo extends BannersAbstractRepo {
  @override
  Future<Either<Response, ServerFailure>> getBanners() async {
// Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      try {
        final Response response = await DioHelper.get(
          endPoint: Endpoints.banners,
        );
        return Left(response);
      } catch (e) {
        if (e is DioException) {
          return Right(ServerFailure.fromDioError(e));
        }
      }
    }
    return Right(ServerFailure(AppVariables.noInternetConnectionText));
  }
}
