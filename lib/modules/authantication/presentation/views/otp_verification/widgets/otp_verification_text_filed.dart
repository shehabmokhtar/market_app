import 'package:flutter/material.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';
import 'package:market_app/modules/authantication/presentation/views/create_new_password/create_new_password_screen.dart';
import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class OtpVerificationTextField extends StatelessWidget {
  String otp;
  final String userId;
  final String newPassword;
  final bool isVerifyOtpWhileRegisteration;
  OtpVerificationTextField({
    super.key,
    required this.otp,
    required this.userId,
    required this.newPassword,
    required this.isVerifyOtpWhileRegisteration,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: 40,
        ),
        child: Center(
          child: Pinput(
            defaultPinTheme: PinTheme(
              height: (AppSizes.screenWidth(context) / 6).clamp(70, 100),
              width: (AppSizes.screenWidth(context) / 6).clamp(70, 100),
              decoration: BoxDecoration(
                color: AppColors.fifthColor,
                border: const Border(),
                borderRadius: BorderRadius.circular(25),
              ),
              textStyle: AppSizes.regularTextStyle(context),
            ),
            onCompleted: (value) {
              otp = value;
              if (isVerifyOtpWhileRegisteration) {
                sl<AuthanticationCubit>().verifyOtp(
                  // userId: '3e8fac30-d640-4e32-9f51-08dc07771ac9',
                  userId: userId,
                  otp: otp,
                  // newPassword: 'a1234567890',
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
          ),
        ),
      );
}
