import 'package:flutter/material.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/basket/presentation/views/basket_screen.dart';

class BasketButton extends StatelessWidget {
  const BasketButton({
    super.key,
    this.color = AppColors.primaryColor,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        AppUtilities.navigateToNewPage(
          context: context,
          newPage: BasketScreen(),
        );
      },
      icon: Icon(
        Icons.shopping_basket_outlined,
        size: AppSizes.iconSize(context),
        color: color,
      ),
    );
  }
}
