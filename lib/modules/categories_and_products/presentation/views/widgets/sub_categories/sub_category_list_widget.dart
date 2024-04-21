import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class SubCategoriesListWidget extends StatelessWidget {
  const SubCategoriesListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      // color: Colors.grey[100],
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: const [
          SubCategoryWidget(),
          SubCategoryWidget(),
          SubCategoryWidget(),
          SubCategoryWidget(),
          SubCategoryWidget(),
          SubCategoryWidget(),
          SubCategoryWidget(),
          SubCategoryWidget(),
          SubCategoryWidget(),
        ],
      ),
    );
  }
}

class SubCategoryWidget extends StatelessWidget {
  const SubCategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.all(5),
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 10,
        vertical: 3,
      ),
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(AppSizes.borderRadius)),
      child: const Center(
        child: Text(
          'sfdfsdf',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
