import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:market_app/core/failures.dart';
import 'package:market_app/modules/authantication/data/models/sign_in_model.dart';
import 'package:market_app/modules/authantication/data/repository/authantication.dart';

part 'authantication_state.dart';

class AuthanticationCubit extends Cubit<AuthanticationState> {
  AuthanticationCubit() : super(AuthanticationInitial());

  // Instance from Authantication data class
  Authantication authantication = Authantication();

  // Sign in
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(AuthanticationSignInLoadingState());

    await authantication.signIn(email: email, password: password).then((value) {
      if (value.isRight) {
        emit(AuthanticationSignInSuccessState(value.right));
      } else {
        emit(AuthanticationSignInErrorState(value.left));
      }
    }).catchError((error) {
      emit(AuthanticationSignInErrorState(error));
    });
  }
}
