import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/home/customer_home/data/repository/banners_repo/banners_impl.dart';

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
