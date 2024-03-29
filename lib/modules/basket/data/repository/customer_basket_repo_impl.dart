import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:either_dart/src/either.dart';
import 'package:market_app/core/constants/app_languages.dart';
import 'package:market_app/core/constants/variables.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/newwork/dio_helper.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/basket/data/repository/customer_basket_repo/customer_basket_repo.dart';

class CustomerBasketRepo extends CustomerBasketAbstractRepo {
  @override
  Future<Either<Response, ServerFailure>> getCustomerBasketProducts() async {
    // Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      try {
        final Response response = await DioHelper.get(
          endPoint: Endpoints.basket,
          lang: AppLanguages.currentLang,
          token: token,
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

  @override
  Future<Either<Response, ServerFailure>> increaseProductQuantity(
      int itemId) async {
    // Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      try {
        final Response response = await DioHelper.patch(
          endPoint: Endpoints.increaseProductQuantity(itemId),
          lang: AppLanguages.currentLang,
          token: token,
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

  @override
  Future<Either<Response, ServerFailure>> decreaseProductQuantity(
      int itemId) async {
    // Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      try {
        final Response response = await DioHelper.patch(
          endPoint: Endpoints.decreaseProductQuantity(itemId),
          lang: AppLanguages.currentLang,
          token: token,
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
