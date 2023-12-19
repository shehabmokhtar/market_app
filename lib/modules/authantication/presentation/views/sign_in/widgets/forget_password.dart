import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

Padding forgetPasswordButton(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: Center(
      child: InkWell(
        onTap: () {},
        child: Text(
          'Forget password?',
          style: AppSizes.smallTextStyle(context),
        ),
      ),
    ),
  );
}
