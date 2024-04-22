import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:market_app/core/constants/app_languages.dart';
import 'package:market_app/core/constants/variables.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/newwork/dio_helper.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/payment/data/repository/payment_repo.dart';

class PaymentRepo extends PaymentAbstractRepo {
  @override
  Future<Either<Response, ServerFailure>> getPayments() async {
    // Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      try {
        Response response = await DioHelper.get(
          endPoint: Endpoints.payment,
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
