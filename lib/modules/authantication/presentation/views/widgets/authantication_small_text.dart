import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class AuthanticationSmallText extends StatelessWidget {
  final String text;
  const AuthanticationSmallText({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          text,
          style: AppSizes.smallTextStyle(context),
        ),
      );
}
