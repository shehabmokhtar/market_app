import 'package:flutter/material.dart';
import 'package:market_app/core/styles/sizes.dart';

class BasketButton extends StatelessWidget {
  const BasketButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {},
      icon: Icon(
        Icons.shopping_basket_outlined,
        size: AppSizes.iconSize(context),
      ),
    );
  }
}
