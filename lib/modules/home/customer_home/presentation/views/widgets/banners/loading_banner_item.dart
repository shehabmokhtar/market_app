import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class LoadingBannerItem extends StatelessWidget {
  const LoadingBannerItem({
    super.key,
    required this.isLoading,
  });
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
        ),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator()
              : const Icon(Icons.shopping_basket_outlined, size: 40),
        ));
  }
}
