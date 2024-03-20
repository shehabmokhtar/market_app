import 'package:flutter/material.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/sign_in_screen.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          AppUtilities.navigateToNewPage(
            context: context,
            newPage: SingInScreen(),
          );
        },
        child: Container(
          padding: const EdgeInsetsDirectional.symmetric(
            vertical: 3,
            horizontal: 10,
          ),
          decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(AppSizes.borderRadius)),
          child: Text(
            'Sign in',
            style: AppSizes.regularTextStyle(context).copyWith(
              color: AppColors.white,
            ),
          ),
        ));
  }
}
