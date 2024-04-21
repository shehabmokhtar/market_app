import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:either_dart/src/either.dart';
import 'package:market_app/core/constants/variables.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/newwork/dio_helper.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/authantication/data/models/sig_up_model.dart';
import 'package:market_app/modules/authantication/data/models/sign_in_model.dart';
import 'package:market_app/modules/authantication/data/repository/authantication_repo.dart';

class AuthanticationRepo extends AuthanticationAbstractRepo {
  // Sign in / Login
  @override
  Future<Either<ServerFailure, SignInModel>> signIn({
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
        return Left(ServerFailure('Unknown Error'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure('Unknown Error'));
    }
  }

// Sign up / Register
  @override
  Future<Either<ServerFailure, SignUpModel>> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      Response response = await DioHelper.post(
        endPoint: Endpoints.signUp,
        data: {"email": email, "password": password, "fullName": fullName},
      );

      if (response.statusCode == 200) {
        return Right(SignUpModel.fromJson(response.data));
      } else {
        return Left(ServerFailure('Unknown Error'));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure('Unknown Error'));
    }
  }

// Verify Otp
  @override
  Future<Either<ServerFailure, SignInModel>> verifyOtp({
    required String userId,
    required String otp,
    required String newPassword,
  }) async {
    try {
      Response response = await DioHelper.post(
        endPoint: Endpoints.verifyOtp,
        data: {"userId": userId, "otp": otp, "newPassword": newPassword},
      );

      if (response.statusCode == 200) {
        return Right(SignInModel.fromJson(response.data));
      }
      return Left(ServerFailure('Unknown Error'));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure('Unknown Error'));
    }
  }

  @override
  Future<Either<ServerFailure, SignUpModel>> forgetPasswordUsingEmail({
    required String email,
  }) async {
    try {
      Response response = await DioHelper.post(
          endPoint: Endpoints.forgetPassword, data: {"email": email});
      if (response.statusCode == 200) {
        return Right(SignUpModel.fromJson(response.data));
      }
      return Left(ServerFailure('Unkown Error'));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure('Unknown Error'));
    }
  }

  @override
  Future<Either<ServerFailure, SignInModel>> createNewPassword({
    required String userId,
    required String otp,
    required String newPassword,
  }) async {
    try {
      Response response = await DioHelper.patch(
          endPoint: Endpoints.resetPassword,
          data: {"userId": userId, "otp": otp, "newPassword": newPassword});
      if (response.statusCode == 200) {
        return Right(SignInModel.fromJson(response.data));
      }
      return Left(ServerFailure('Unkown Error'));
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }

      return Left(ServerFailure('Unkown Error'));
    }
  }

  @override
  Future<Either<ServerFailure, Response>> configFCM() async {
    // Check is there internet or not
    if (await AppUtilities.checkInternet()) {
      try {
        Response response = await DioHelper.patch(
          endPoint: Endpoints.configFCM(),
          token: token,
        );
        return Right(response);
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure.fromDioError(e));
        }
      }
    }
    // In the case of failure
    else {
      return Left(ServerFailure(AppVariables.noInternetConnectionText));
    }
    // For unkown error
    return Left(ServerFailure('Unkown Error'));
  }
}
