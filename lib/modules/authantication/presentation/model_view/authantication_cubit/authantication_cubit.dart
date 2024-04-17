// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/chache_helper.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/authantication/data/models/sig_up_model.dart';
import 'package:market_app/modules/authantication/data/models/sign_in_model.dart';
import 'package:market_app/modules/authantication/data/repository/authantication.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/sign_in_screen.dart';
part 'authantication_state.dart';

class AuthanticationCubit extends Cubit<AuthanticationStates> {
  AuthanticationCubit() : super(AuthanticationInitial());

  // Instance from Authantication data class
  AuthanticationRepo authantication = AuthanticationRepo();

  // Sign in
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());

    // Check is there internet or not
    // Todo: Check Internet Connection
    if (await AppUtilities.checkInternet()) {
      // if (true) {
      var result =
          await authantication.signIn(email: email, password: password);

      // await result.fold((left) async=> null, (right) => null);
      if (result.isRight) {
        emit(SignInSuccessState(result.right));
      } else {
        print('>>>>>>>>>>>>>>>>>>>> ERROR <<<<<<<<<<<<<<<<<<');
        print(result.left.errorMessage);
        emit(SignInErrorState(result.left));
      }
    } else {
      emit(SignInErrorState(
          ServerFailure('No internet connection, Please check your internet')));
    }
  }

  // Sign in
  Future<void> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());

    // Check is there internet or not
    if (await AppUtilities.checkInternet()) {
      // if (true) {
      var result = await authantication.signUp(
          fullName: fullName, email: email, password: password);

      if (result.isRight) {
        emit(SignUpSuccessState(result.right));
      } else {
        print('>>>>>>>>>>>>>>>>>>>> ERROR <<<<<<<<<<<<<<<<<<,');
        print(result.left.errorMessage);
        emit(SignUpErrorState(result.left));
      }
    } else {
      emit(SignUpErrorState(
          ServerFailure('No internet connection, Please check your internet')));
    }
  }

  // Verify OTP
  Future<void> verifyOtp({
    required String userId,
    required String otp,
    required String newPassword,
  }) async {
    emit(VerifyOtpLoadingState());
    Either<ServerFailure, SignInModel> result = await authantication.verifyOtp(
        userId: userId, otp: otp, newPassword: newPassword);

    if (await AppUtilities.checkInternet()) {
      await result.fold((left) async => emit(VerifyOtpErrorState(left)),
          (right) async => emit(VerifyOtpSuccessState(right)));
    } else {
      emit(VerifyOtpErrorState(
          ServerFailure('No internet connection, Please check your internet')));
    }
  }

  // Submit Email For Forget Password
  Future<void> forgetPasswordUsingEmail({
    required String email,
  }) async {
    emit(ForgetPasswordLoadingState());
    if (await AppUtilities.checkInternet()) {
      await authantication.forgetPasswordUsingEmail(email: email).fold(
          (left) => emit(ForgetPasswordErrorState(left)),
          (right) => emit(ForgetPasswordSuccessState(right)));
    } else {
      emit(ForgetPasswordErrorState(
          ServerFailure('No internet connection, Please check your internet')));
    }
  }

  // Create a new password after put otp
  Future<void> createNewPassword({
    required String userId,
    required String otp,
    required String newPassword,
  }) async {
    emit(CreateNewPasswordLoadingState());
    if (await AppUtilities.checkInternet()) {
      await authantication
          .createNewPassword(
            userId: userId,
            otp: otp,
            newPassword: newPassword,
          )
          .fold((left) => emit(CreateNewPasswordErrorState(left)),
              (right) => emit(CreateNewPasswordSuccessState(right)));
    } else {
      emit(CreateNewPasswordErrorState(
          ServerFailure('No internet connection, Please check your internet')));
    }
  }

// Logout
  void logout(BuildContext context) {
    emit(SignOutLoadingState());
    try {
      token = '';
      AppUtilities.navigateToAndFinish(
        context: context,
        newPage: SingInScreen(),
      );
      emit(SignOutSuccessState());
    } catch (e) {
      emit(SignOutErrorState(e.toString()));
    }
  }

// Saving token to the local storage and navigating to the specified screen according to the user role
  void saveTokenAndNavigateTo({
    required BuildContext context,
    required String userToken,
    required String role,
  }) {
    Widget homeScreen;
    // Save the user token in the app chache for authorization
    CacheHelper.saveData(key: 'token', value: userToken);

    // Set the the token in the global variables
    token = userToken;
    // Decide which user home screen will be...
    //Todo: Handle users
    //Todo: Navigate to and finish to the home screens
  }

  // Config FCM
  configFCM() async {
    emit(ConfigFCMLoadingState());

    var result = await authantication.configFCM();

    result.fold(
      (l) => emit(ConfigFCMErrorState(l.errorMessage)),
      (r) => emit(ConfigFCMSuccessState()),
    );
  }
}
