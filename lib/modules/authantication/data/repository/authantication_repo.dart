import 'dart:async';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/modules/authantication/data/models/sig_up_model.dart';
import 'package:market_app/modules/authantication/data/models/sign_in_model.dart';

abstract class AuthanticationAbstractRepo {
  // Sing in / Login
  Future<Either<ServerFailure, SignInModel>> signIn({
    required String email,
    required String password,
  });

  // Sign up / Register
  Future<Either<ServerFailure, SignUpModel>> signUp({
    required String fullName,
    required String email,
    required String password,
  });

  // Verify OTP
  Future<Either<ServerFailure, SignInModel>> verifyOtp({
    required String userId,
    required String otp,
    required String newPassword,
  });

  // Forget password with email
  Future<Either<ServerFailure, SignUpModel>> forgetPasswordUsingEmail({
    required String email,
  });

  // Create a new password
  Future<Either<ServerFailure, SignInModel>> createNewPassword({
    required String userId,
    required String otp,
    required String newPassword,
  });

  // Config FCM
  Future<Either<ServerFailure, Response>> configFCM();
}
