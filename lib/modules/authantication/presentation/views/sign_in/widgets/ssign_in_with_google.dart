import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

Center signInWithGoogle(BuildContext context) {
  return Center(
    child: InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: AppSizes.screenWidth(context) / 70,
        ),
        child: Container(
          height: (16 + AppSizes.screenWidth(context) * .1).clamp(50, 55),
          width: (AppSizes.screenWidth(context) / 1.5).clamp(60, 400),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              AppSizes.borderRadius,
            ),
            border: Border.all(
              width: 2,
              color: AppColors.primaryColor,
            ),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/images/google.png'),
            const SizedBox(
              width: 10,
            ),
            Text(
              'Sign in with Google',
              style: AppSizes.regularTextStyle(context),
            ),
          ]),
        ),
      ),
    ),
  );
}
