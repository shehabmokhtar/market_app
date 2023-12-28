import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/core/utils.dart';
import 'package:market_app/modules/authantication/presentation/views/forget_passwrod.dart/forget_password_screen.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: InkWell(
            onTap: () {
              AppUtilities.navigateToNewPage(
                context: context,
                newPage: ForgetPasswordScreen(),
              );
            },
            child: Text(
              'Forget password?',
              style: AppSizes.smallTextStyle(context),
            ),
          ),
        ),
      );
}
