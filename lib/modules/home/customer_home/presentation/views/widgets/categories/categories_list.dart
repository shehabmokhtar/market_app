import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/loading_circle.dart';
import 'package:market_app/core/functions/custom_awesome_dialog.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/categories_and_products/presentation/model_view/categories_cubit/categories_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/categories/category_item.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isLoading =
        sl<CategoriesCubit>().customerCategories.isNotEmpty ? false : true;
    return FutureBuilder(
        future: Future.wait([
          if (sl<CategoriesCubit>().customerCategories.isEmpty)
            sl<CategoriesCubit>().getCustomerCategories(),
        ]),
        builder: (context, snapshot) {
          return BlocConsumer<CategoriesCubit, CategoriesStates>(
            listener: (context, state) {
              if (state is GetCategoriesErrorState) {
                customAwesomeDialog(
                        dialogType: DialogType.error,
                        context: context,
                        titleMessage: 'Error',
                        descMessage: state.errorMessage,
                        btnOkonPress: () {})
                    .show();
                print(state);
              }
              if (state is GetCategoriesSuccessState) {
                isLoading = false;
              }
            },
            builder: (context, state) => Padding(
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
                  // Space between category title and the list of categories
                  SizedBox(height: isLoading ? 150 : 17),
                  // Loading circle in case of loading
                  if (isLoading) const LoadingCircle(),
                  if (!isLoading)
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 105,
                      ),
                      itemBuilder: (context, index) => CategoryItem(
                        categoryModel:
                            sl<CategoriesCubit>().customerCategories[index],
                        index: index,
                      ),
                      itemCount:
                          sl<CategoriesCubit>().customerCategories.length,
                    ),
                ],
              ),
            ),
          );
        });
  }
}
