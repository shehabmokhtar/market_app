import 'package:dio/dio.dart';
import 'package:dio/src/response.dart';
import 'package:either_dart/src/either.dart';
import 'package:market_app/core/constants/app_languages.dart';
import 'package:market_app/core/constants/variables.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/newwork/dio_helper.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/profile/customer_profile/data/repository/user_repo/user_repo.dart';

import '../../../../../../core/services/global_variables.dart';

class UserRepo extends UserAbstractRepo {
  @override
  Future<Either<Response, ServerFailure>> getUserData() async {
    // Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      try {
        Response response = await DioHelper.get(
          endPoint: Endpoints.user,
          requestToken: token,
          // Todo: Change language
          lang: AppLanguages.english,
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
}
