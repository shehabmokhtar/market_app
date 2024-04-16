import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/basket_button.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/Widgets/loading_circle.dart';
import 'package:market_app/core/functions/custom_awesome_dialog.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/categories_and_products/data/models/category_model.dart';
import 'package:market_app/modules/categories_and_products/presentation/model_view/categories_cubit/categories_cubit.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/sub_categories/sub_category_and_products_list_widget.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/sub_categories/sub_category_list_widget.dart';

// ignore: must_be_immutable
class AllCategoriesAndSubCategoriesAndProductScreen extends StatelessWidget {
  AllCategoriesAndSubCategoriesAndProductScreen({
    super.key,
    required this.categoryModel,
    required this.branchCateogryId,
    required this.itemIndex,
  });

  final CategoryModel categoryModel;
  int branchCateogryId;
  final int itemIndex;
  bool isOnTaped = false;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (!isOnTaped) {
        sl<CategoriesCubit>()
            .getSubCategoriesAndProducts(branchCategoryId: branchCateogryId);
      }
      return BlocConsumer<CategoriesCubit, CategoriesStates>(
        listener: (context, state) {
          if (state is GetSubCategoriesAndProductsErrorState) {
            customAwesomeDialog(
                    dialogType: DialogType.error,
                    context: context,
                    titleMessage: 'Error',
                    descMessage: state.errorMessage,
                    btnOkonPress: () {})
                .show();
          }
        },
        builder: (context, state) {
          return DefaultTabController(
            // The count of categories
            length: sl<CategoriesCubit>().customerCategories.length,
            // The intial tab index
            initialIndex: itemIndex,
            child: Scaffold(
              // The screen app bar
              appBar: customAppBar(
                actions: [
                  const BasketButton(color: Colors.white),
                ],
                context: context,
                title: 'Products',
                // The tab bar of categories
                bottom: TabBar(
                    onTap: (value) {
                      if (!isOnTaped) {
                        isOnTaped = true;
                      }
                      // Get sub categories and products
                      branchCateogryId =
                          sl<CategoriesCubit>().customerCategories[value].id!;
                      sl<CategoriesCubit>().getSubCategoriesAndProducts(
                          branchCategoryId: branchCateogryId);
                    },
                    indicatorWeight: 4,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsetsDirectional.only(bottom: 10),
                    indicatorColor: Colors.amber,
                    isScrollable: true,
                    tabs: List.generate(
                        sl<CategoriesCubit>().customerCategories.length,
                        (index) => Padding(
                              padding:
                                  const EdgeInsetsDirectional.only(bottom: 2),
                              child: Text(
                                sl<CategoriesCubit>()
                                    .customerCategories[index]
                                    .category!
                                    .enName
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ))),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sub categories titles
                  if (sl<CategoriesCubit>()
                      .customerSubCategoriesAndProducts
                      .isNotEmpty)
                    SubCategoriesListWidget(
                      subCategoriesNames: List.generate(
                          sl<CategoriesCubit>()
                              .customerSubCategoriesAndProducts
                              .length,
                          (index) => sl<CategoriesCubit>()
                              .customerSubCategoriesAndProducts[index]
                              .subCategory!
                              .enName!),
                    ),
                  // Sub categories and products
                  if (sl<CategoriesCubit>()
                      .customerSubCategoriesAndProducts
                      .isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) =>
                            SubCategoryAndProductsListWidget(
                                model: sl<CategoriesCubit>()
                                    .customerSubCategoriesAndProducts[index]),
                        itemCount: sl<CategoriesCubit>()
                            .customerSubCategoriesAndProducts
                            .length,
                      ),
                    ),
                  // Is loading
                  if (state is GetSubCategoriesAndProductsLoadingState)
                    const LoadingCircle(),
                  //   Is Error
                  if (state is GetSubCategoriesAndProductsErrorState)
                    Container(),
                  if (state is GetSubCategoriesAndProductsSuccessState &&
                      sl<CategoriesCubit>()
                          .customerSubCategoriesAndProducts
                          .isEmpty)
                    Center(
                      child: Text(
                        'There are no sub categories and products in this category',
                        style: AppSizes.smallTextStyle(context),
                      ),
                    )
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
