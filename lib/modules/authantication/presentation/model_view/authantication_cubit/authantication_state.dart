part of 'authantication_cubit.dart';

@immutable
sealed class AuthanticationState {}

final class AuthanticationInitial extends AuthanticationState {}

final class AuthanticationSignInLoadingState extends AuthanticationState {}

// ignore: must_be_immutable
final class AuthanticationSignInSuccessState extends AuthanticationState {
  SignInModel signInModel;
  AuthanticationSignInSuccessState(this.signInModel);
}

// ignore: must_be_immutable
final class AuthanticationSignInErrorState extends AuthanticationState {
  Failure failure;
  AuthanticationSignInErrorState(this.failure);
}
