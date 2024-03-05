import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class BottomSheetLineWidget extends StatelessWidget {
  const BottomSheetLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: AppSizes.screenWidth(context) / 2,
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(.3),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
