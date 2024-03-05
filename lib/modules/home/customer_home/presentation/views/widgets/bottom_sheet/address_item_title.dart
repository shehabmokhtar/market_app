import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class AddressNameItemTitle extends StatelessWidget {
  const AddressNameItemTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Home',
      style: AppSizes.regularTextStyle(context)
          .copyWith(color: AppColors.primaryColor),
    );
  }
}
