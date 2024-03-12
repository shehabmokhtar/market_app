import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/home/customer_home/data/models/banner_model.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    this.model,
  });
  final BannerModel? model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //Todo
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(AppSizes.borderRadius),
          image: DecorationImage(
            image: NetworkImage(model!.imageUrl ?? ''),
            fit: BoxFit.cover,
          ),
        ),
        child: const Icon(
          Icons.shopping_basket_outlined,
          size: 40,
        ),
      ),
    );
  }
}
