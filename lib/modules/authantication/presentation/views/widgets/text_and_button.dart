import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class TextAndButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final String buttonText;
  const TextAndButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) => Padding(
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
