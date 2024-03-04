import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class AddressNameWidget extends StatelessWidget {
  const AddressNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Home, ',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppSizes.regularTextStyle(context).copyWith(
        color: AppColors.primaryColor,
      ),
    );
  }
}
