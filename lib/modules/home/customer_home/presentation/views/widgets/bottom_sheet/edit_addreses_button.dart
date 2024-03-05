import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class EditAddresesButton extends StatelessWidget {
  const EditAddresesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Edit Addresses',
        style: AppSizes.smallTextStyle(context).copyWith(
          color: AppColors.primaryColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
