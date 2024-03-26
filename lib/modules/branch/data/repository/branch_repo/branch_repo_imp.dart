import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:market_app/core/constants/app_languages.dart';
import 'package:market_app/core/constants/variables.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/newwork/dio_helper.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/branch/data/repository/branch_repo/branch_repo.dart';

class BranchRepo extends BranchAbstractRepo {
  @override
  Future<Either<Response, ServerFailure>> getNearBranch(
      {required double lat,
      required double lng,
      required String subDistrictId}) async {
    // Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      try {
        Response response = await DioHelper.get(
          endPoint: Endpoints.nearBranch,
          lang: AppLanguages.currentLang,
          requestToken: token,
          query: {
            'Lat': lat,
            'Lng': lng,
            'subDistrictId': subDistrictId,
          },
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
