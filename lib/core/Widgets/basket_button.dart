import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class BasketButton extends StatelessWidget {
  BasketButton({
    super.key,
    this.color = AppColors.primaryColor,
  });
  Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {},
      icon: Icon(
        Icons.shopping_basket_outlined,
        size: AppSizes.iconSize(context),
        color: color,
      ),
    );
  }
}
