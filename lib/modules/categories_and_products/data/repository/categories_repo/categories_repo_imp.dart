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
import 'package:market_app/modules/categories_and_products/data/repository/categories_repo/categories_repo.dart';

class CategoriesRepo extends CategoriesAbstractRepo {
  @override
  Future<Either<Response, ServerFailure>> getCategories(
      {required String brnachId}) async {
    // Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      try {
        Response response = await DioHelper.get(
          endPoint: Endpoints.category(brnachId),
          lang: AppLanguages.currentLang,
          requestToken: token,
        );
        return Left(response);
      } catch (e) {
        if (e is DioException) {
          return Right(
              ServerFailure.fromResponse(e.response!.statusCode!, e.response));
        }
      }
    }
    return Right(ServerFailure(AppVariables.noInternetConnectionText));
  }

  @override
  Future<Either<Response, ServerFailure>> getSubCategoriesAndProducts(
      {required int branchCategoryId}) async {
    // Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      try {
        Response response = await DioHelper.get(
          endPoint: Endpoints.subCategoriesAndProducts(branchCategoryId),
          lang: AppLanguages.currentLang,
          requestToken: token,
        );
        print(response.statusCode);
        return Left(response);
      } catch (e) {
        if (e is DioException) {
          return Right(
              ServerFailure.fromResponse(e.response!.statusCode!, e.response));
        }
      }
    }
    return Right(ServerFailure(AppVariables.noInternetConnectionText));
  }
}
