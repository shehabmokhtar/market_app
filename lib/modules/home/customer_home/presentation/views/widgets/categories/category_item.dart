import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/categories_and_products/data/models/category_model.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/all_categories_and_sub_categories_and_products_screen.dart';
import 'package:page_transition/page_transition.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryItem(
    this.categoryModel, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppUtilities.navigateToNewPage(
          context: context,
          newPage: const AllCategoriesAndSubCategoriesAndProductScreen(),
          pageTransitionType: PageTransitionType.fade,
        );
      },
      child: Column(
        children: [
          // The category image
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(categoryModel.category!.imageUrl!),
                    fit: BoxFit.contain,
                  )),
            ),
          ),
          // The category title
          Text(
            // Todo >>>> Change the language later
            categoryModel.category!.enName!,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
