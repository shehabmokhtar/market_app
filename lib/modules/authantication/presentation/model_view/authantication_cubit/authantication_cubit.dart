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
import 'package:market_app/modules/homee/presentation/views/admin_home_screen.dart';
import 'package:market_app/modules/homee/presentation/views/customer_home_screen.dart';
import 'package:market_app/modules/homee/presentation/views/driver_home_screen.dart';
import 'package:market_app/modules/homee/presentation/views/manager_home_screen.dart';
part 'authantication_state.dart';

class AuthanticationCubit extends Cubit<AuthanticationStates> {
  AuthanticationCubit() : super(AuthanticationInitial());

  // Instance from Authantication data class
  Authantication authantication = Authantication();

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
    required String token,
    required String role,
  }) {
    Widget homeScreen;
    // Save the user token in the app chache for authorization
    CacheHelper.saveData(key: 'token', value: token);

    // Set the the token in the global variables
    token = token;
    // Decide which user home screen will be...
    switch (role) {
      case 'Customer':
        homeScreen = const CustomerHomeScreen();
        break;
      case 'Driver':
        homeScreen = const DriverHomeScreen();
        break;
      case 'Admin':
        homeScreen = const AdminHomeScreen();
        break;
      case 'Manager':
        homeScreen = const ManagerHomeScreen();
        break;
      default:
        // Todo: Navigate to the Splash Screen
        homeScreen = const CustomerHomeScreen();
    }
    // Navigate to and finish to the home screen
    AppUtilities.navigateToAndFinish(
      context: context,
      newPage: homeScreen,
    );
  }
}
