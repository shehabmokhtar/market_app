import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/loading_progress_indicator.dart';
import 'package:market_app/core/Widgets/custom_text_form_filed.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/sign_in_screen.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/reset_password_screen.dart';

// ignore: must_be_immutable
class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({
    super.key,
    required this.userId,
    required this.otp,
  });
  final String userId;
  final String otp;
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthanticationCubit, AuthanticationStates>(
      listener: (context, state) {
        if (state is CreateNewPasswordSuccessState) {
          // Save the token and navigate to home screen
          serviceLocator<AuthanticationCubit>().saveTokenAndNavigateTo(
            context: context,
            token: state.signInModel.token,
            role: state.signInModel.role,
          );
          // show message to user
          AppUtilities.toastMessage(
            context: context,
            msg: '${state.signInModel.message}',
            messageType: MessageType.success,
          );
        } else if (state is CreateNewPasswordErrorState) {
          AppUtilities.toastMessage(
            context: context,
            msg: '${state.serverFailure.errorMessage}',
            messageType: MessageType.error,
          );
          if (state.serverFailure.errorMessage.toString().toLowerCase() ==
              'wrong otp') {
            Navigator.pop(context);
          }
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Stack(
            children: [
              ResetPasswordAndOtpVerificationScreen(
                  mainText: 'Create a new password',
                  smallText: 'Create a new password for your account.',
                  pageContent: [
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormFiled(
                      isPassword: true,
                      controller: passwordController,
                      prefixIcon: Icons.lock_outline,
                      hintText: 'Password',
                      validationMessage: 'Password Must Not Be Empty',
                    ),
                    CustomTextFormFiled(
                      isPassword: true,
                      controller: confirmPasswordController,
                      prefixIcon: Icons.lock_outline,
                      hintText: 'Confirm Password',
                      validationMessage: 'Confirm Your Password',
                    ),
                  ],
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (passwordController.text ==
                          confirmPasswordController.text) {
                        serviceLocator<AuthanticationCubit>().createNewPassword(
                          userId: userId,
                          otp: otp,
                          newPassword: passwordController.text,
                        );
                      } else {
                        AppUtilities.toastMessage(
                          context: context,
                          msg:
                              'Password and confirm password are not the same, Be sure the both are the same',
                          messageType: MessageType.error,
                        );
                      }
                    }
                  },
                  buttonText: 'Confirm'),
              if (state is CreateNewPasswordLoadingState)
                const LoadingProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
