import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/loading_progress_indicator.dart';
import 'package:market_app/core/Widgets/custom_text_form_filed.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';
import 'package:market_app/modules/authantication/presentation/views/otp_verification/otp_verification_screen.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/reset_password_screen.dart';

// ignore: must_be_immutable
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});
  var emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthanticationCubit, AuthanticationStates>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccessState) {
          AppUtilities.navigateToNewPage(
            context: context,
            newPage: OtpVerificationScreen(
              isVerifyOtpWhileRegisteration: false,
              userId: state.signUpModel.userId!,
              newPassword: '',
            ),
          );
          AppUtilities.toastMessage(
            context: context,
            msg: '${state.signUpModel.message}',
            messageType: MessageType.success,
          );
        } else if (state is ForgetPasswordErrorState) {
          AppUtilities.toastMessage(
            context: context,
            msg: '${state.serverFailure.errorMessage}',
            messageType: MessageType.error,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Stack(
            children: [
              ResetPasswordAndOtpVerificationScreen(
                  mainText: 'Forget Password',
                  smallText: 'Please enter your email address to get OTP',
                  pageContent: [
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        vertical: 10,
                      ),
                      child: CustomTextFormFiled(
                        controller: emailController,
                        prefixIcon: Icons.email_outlined,
                        hintText: 'Email Address',
                        validationMessage: 'Email Address Must Not Be Empty',
                      ),
                    ),
                  ],
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await sl<AuthanticationCubit>().forgetPasswordUsingEmail(
                          email: emailController.text);
                    }
                  },
                  buttonText: 'Continue'),
              if (state is ForgetPasswordLoadingState)
                const LoadingProgressIndicator(),
            ],
          ),
        );
      },
    );
  }
}
