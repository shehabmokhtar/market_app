import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class ArrowDownIcon extends StatelessWidget {
  const ArrowDownIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.keyboard_arrow_down,
      size: AppSizes.iconSize(context),
      color: AppColors.blackColor.withOpacity(.6),
    );
  }
}
