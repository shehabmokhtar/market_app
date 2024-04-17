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
import 'package:market_app/modules/favorites/customer_favorites/data/repository/favorites_repo/favorites_repo.dart';

class FavoritesRepo extends FavoritesAbstractRepo {
  @override
  Future<Either<Response, ServerFailure>> getFavoriteProducts() async {
    // Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      try {
        Response response = await DioHelper.get(
          endPoint: Endpoints.favorites,
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
  Future<Either<Response, ServerFailure>> addProductToFavorites(
      String productId, Map<String, dynamic> data) async {
    // Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      try {
        Response response = await DioHelper.post(
          endPoint: Endpoints.favoritesId(productId),
          lang: AppLanguages.currentLang,
          token: token,
          data: data,
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
  Future<Either<Response, ServerFailure>> deleteProductFromFavorites(
      String productId) async {
    // Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      try {
        Response response = await DioHelper.delete(
          endPoint: Endpoints.favoritesId(productId),
          lang: AppLanguages.currentLang,
          requestToken: token,
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
