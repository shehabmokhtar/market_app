part of 'authantication_cubit.dart';

@immutable
sealed class AuthanticationStates {}

final class AuthanticationInitial extends AuthanticationStates {}

final class SignInLoadingState extends AuthanticationStates {}

final class SignInSuccessState extends AuthanticationStates {
  final SignInModel signInModel;
  SignInSuccessState(this.signInModel);
}

final class SignInErrorState extends AuthanticationStates {
  final ServerFailure serverFailure;
  SignInErrorState(this.serverFailure);
}

final class SignUpLoadingState extends AuthanticationStates {}

final class SignUpSuccessState extends AuthanticationStates {
  final SignUpModel signUpModel;
  SignUpSuccessState(this.signUpModel);
}

final class SignUpErrorState extends AuthanticationStates {
  final ServerFailure serverFailure;
  SignUpErrorState(this.serverFailure);
}

final class VerifyOtpLoadingState extends AuthanticationStates {}

final class VerifyOtpSuccessState extends AuthanticationStates {
  final SignInModel signInModel;
  VerifyOtpSuccessState(this.signInModel);
}

final class VerifyOtpErrorState extends AuthanticationStates {
  final ServerFailure serverFailure;
  VerifyOtpErrorState(this.serverFailure);
}

final class ForgetPasswordLoadingState extends AuthanticationStates {}

final class ForgetPasswordSuccessState extends AuthanticationStates {
  final SignUpModel signUpModel;
  ForgetPasswordSuccessState(this.signUpModel);
}

final class ForgetPasswordErrorState extends AuthanticationStates {
  final ServerFailure serverFailure;
  ForgetPasswordErrorState(this.serverFailure);
}

final class CreateNewPasswordLoadingState extends AuthanticationStates {}

final class CreateNewPasswordSuccessState extends AuthanticationStates {
  final SignInModel signInModel;
  CreateNewPasswordSuccessState(this.signInModel);
}

final class CreateNewPasswordErrorState extends AuthanticationStates {
  final ServerFailure serverFailure;
  CreateNewPasswordErrorState(this.serverFailure);
}

final class SignOutLoadingState extends AuthanticationStates {}

final class SignOutSuccessState extends AuthanticationStates {}

final class SignOutErrorState extends AuthanticationStates {
  final String error;
  SignOutErrorState(this.error);
}

final class ConfigFCMLoadingState extends AuthanticationStates {}

final class ConfigFCMSuccessState extends AuthanticationStates {}

final class ConfigFCMErrorState extends AuthanticationStates {
  final String error;
  ConfigFCMErrorState(this.error);
}
