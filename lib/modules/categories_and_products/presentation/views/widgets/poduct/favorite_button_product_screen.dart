import 'package:flutter/material.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';

class ProductScreenFavoriteButton extends StatelessWidget {
  const ProductScreenFavoriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          AppUtilities.vibration();
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.primaryColor, width: 2),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.favorite_outline,
            size: 27,
          ),
        ),
      ),
    );
  }
}
