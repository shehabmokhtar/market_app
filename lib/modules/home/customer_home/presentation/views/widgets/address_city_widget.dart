import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class AddresCitysWidget extends StatelessWidget {
  const AddresCitysWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Istanbul, Uskudar',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppSizes.smallTextStyle(context).copyWith(
        color: AppColors.blackColor.withOpacity(.6),
      ),
    );
  }
}
