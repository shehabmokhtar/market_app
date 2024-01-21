import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/loading_progress_indicator.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/utils.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';
import 'package:market_app/modules/authantication/presentation/views/create_new_password/create_new_password_screen.dart';
import 'package:market_app/modules/authantication/presentation/views/otp_verification/widgets/otp_verification_text_filed.dart';
import 'package:market_app/modules/authantication/presentation/views/otp_verification/widgets/resend_otp_in_seconds.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/sign_in_screen.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/authantication_small_text.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/reset_password_screen.dart';

// ignore: must_be_immutable
class OtpVerificationScreen extends StatelessWidget {
  final bool isVerifyOtpWhileRegisteration;
  final String userId;
  final String newPassword;
  OtpVerificationScreen({
    super.key,
    required this.isVerifyOtpWhileRegisteration,
    required this.userId,
    required this.newPassword,
  });
  String otp = '';
  @override
  Widget build(BuildContext context) =>
      BlocConsumer<AuthanticationCubit, AuthanticationStates>(
        listener: (context, state) {
          if (state is VerifyOtpSuccessState) {
            sl<AuthanticationCubit>().saveTokenAndNavigateTo(
              context: context,
              token: state.signInModel.token,
              role: state.signInModel.role,
            );
            AppUtilities.toastMessage(
                context: context,
                msg: 'Registration Completed Successfully',
                messageType: MessageType.success);
          }
          if (state is VerifyOtpErrorState) {
            AppUtilities.toastMessage(
                context: context,
                msg: '${state.serverFailure.errorMessage}',
                messageType: MessageType.error);
          }
        },
        builder: (context, state) => Stack(
          children: [
            ResetPasswordAndOtpVerificationScreen(
              mainText: 'Verification',
              smallText:
                  'We\'ve sent OTP to your email ********com.Please enter 4 digits code you receive.',
              pageContent: [
                // Verify Otp
                OtpVerificationTextField(
                  otp: otp,
                  userId: userId,
                  newPassword: newPassword,
                  isVerifyOtpWhileRegisteration: isVerifyOtpWhileRegisteration,
                ),
                // Didn't recive a code
                const AuthanticationSmallText(text: 'Didn\'t receive a code?'),
                const SizedBox(height: 5),
                const ResendOtpInSeconds(),
              ],
              onPressed: () {
                if (isVerifyOtpWhileRegisteration) {
                  sl<AuthanticationCubit>().verifyOtp(
                    userId: userId,
                    otp: otp,
                    newPassword: newPassword,
                  );
                } else {
                  AppUtilities.navigateToNewPage(
                    context: context,
                    newPage: CreateNewPasswordScreen(
                      userId: userId,
                      otp: otp,
                    ),
                  );
                }
              },
              buttonText: isVerifyOtpWhileRegisteration
                  ? 'Complete Sign Up'
                  : 'Continue',
            ),
            if (state is VerifyOtpLoadingState)
              const LoadingProgressIndicator(),
          ],
        ),
      );
}
