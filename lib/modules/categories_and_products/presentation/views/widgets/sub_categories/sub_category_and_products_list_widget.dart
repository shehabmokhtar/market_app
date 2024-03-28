import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/sub_categories/product_widget.dart';

class SubCategoryAndProductsListWidget extends StatelessWidget {
  const SubCategoryAndProductsListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The sub category title
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 15),
            child: Text(
              'Veg & Fruits',
              style: AppSizes.regularTextStyle(context).copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // The sub category products
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSizes.borderRadius),
              color: Colors.grey[100],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  mainAxisExtent: 190,
                  //! CHECK THIS !//
                  // childAspectRatio: 1,
                ),
                itemBuilder: (context, index) => ProductWidget(),
                itemCount: 6,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
