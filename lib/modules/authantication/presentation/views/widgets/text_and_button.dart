import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

Padding textAndButton({
  required BuildContext context,
  required String text,
  required String buttonText,
  required Function onPressed,
}) {
  return Padding(
    padding: EdgeInsetsDirectional.symmetric(
      vertical: AppSizes.screenWidth(context) / 70,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppSizes.smallTextStyle(context),
        ),
        TextButton(
            onPressed: () {
              onPressed();
            },
            child: Text(
              buttonText,
              style: AppSizes.smallTextStyle(context)
                  .copyWith(color: AppColors.primaryColor),
            ))
      ],
    ),
  );
}
