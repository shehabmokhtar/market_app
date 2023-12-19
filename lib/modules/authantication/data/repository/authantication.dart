import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:either_dart/src/either.dart';
import 'package:market_app/core/failures.dart';
import 'package:market_app/core/services/newwork/dio_helper.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';
import 'package:market_app/modules/authantication/data/models/sign_in_model.dart';
import 'package:market_app/modules/authantication/data/repository/authantication_repo.dart';

class Authantication extends AuthanticationRepo {
  @override
  Future<Either<Failure, SignInModel>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      Response response = await DioHelper.post(
        endPoint: Endpoints.signIn,
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        return Right(SignInModel.fromJson(response.data));
      } else {
        return Left(ServerFailure.fromResponse(response.statusCode!, response));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
