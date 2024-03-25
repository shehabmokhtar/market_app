import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/categories/category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        vertical: 20,
        horizontal: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Categories title
          Text(
            'Categories',
            style: AppSizes.regularTextStyle(context).copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 23,
              color: AppColors.primaryColor,
            ),
          ),
          const SizedBox(height: 17),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 105,
            ),
            itemBuilder: (context, index) => const CategoryItem(),
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}
