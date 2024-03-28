import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/basket_button.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/functions/custom_awesome_dialog.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/categories_and_products/data/models/category_model.dart';
import 'package:market_app/modules/categories_and_products/presentation/model_view/categories_cubit/categories_cubit.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/sub_categories/sub_category_and_products_list_widget.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/sub_categories/sub_category_list_widget.dart';

// ignore: must_be_immutable
class AllCategoriesAndSubCategoriesAndProductScreen extends StatelessWidget {
  AllCategoriesAndSubCategoriesAndProductScreen({
    super.key,
    required this.categoryModel,
    required this.currentCategoryIndex,
  });

  final CategoryModel categoryModel;
  int currentCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      sl<CategoriesCubit>().getSubCategoriesAndProducts(
        branchCategoryId: categoryModel.id!,
      );
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
            initialIndex: currentCategoryIndex,
            child: Scaffold(
              // The screen app bar
              appBar: customAppBar(
                actions: [
                  BasketButton(color: Colors.white),
                ],
                context: context,
                title: 'All Categories',
                // The tab bar of categories
                bottom: TabBar(
                    onTap: (value) {},
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
                children: [
                  // Sub categories titles
                  const SubCategoriesListWidget(),
                  // Sub categories and products
                  // if (state is GetSubCategoriesAndProductsSuccessState)
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          const SubCategoryAndProductsListWidget(),
                      itemCount: 3,
                    ),
                  ),
                  // Is loading
                  // if (state is GetSubCategoriesAndProductsLoadingState)
                  // const LoadingCircle(),
                  // Is Error
                  // if (state is GetSubCategoriesAndProductsErrorState)
                  // Container()
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
