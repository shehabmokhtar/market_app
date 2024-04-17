import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/divider_continer.dart';
import 'package:market_app/core/Widgets/loading_circle.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/categories_and_products/data/models/sub_category_model.dart';
import 'package:market_app/modules/categories_and_products/presentation/model_view/categories_cubit/categories_cubit.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/customer_product_screen.dart';
import 'package:market_app/modules/favorites/customer_favorites/data/models/favorite_product_model.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/model_view/favorites_cubit/favorites_cubit.dart';
import 'package:page_transition/page_transition.dart';

class FavoriteProductItemWidget extends StatefulWidget {
  const FavoriteProductItemWidget(this.model, {super.key});

  final FavoriteProductModel model;

  @override
  State<FavoriteProductItemWidget> createState() =>
      _FavoriteProductItemWidgetState();
}

class _FavoriteProductItemWidgetState extends State<FavoriteProductItemWidget> {
  final double _continerHeight = 120;
  final int _animationDuration = 250;
  final bool _isFavorite = true;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            AppUtilities.navigateToNewPage(
              context: context,
              newPage: CustomerProductScreen(
                model: getBranchProductModel(widget.model.product!.id!),
              ),
              pageTransitionType: PageTransitionType.fade,
            );
          },
          child: Container(
            height: _continerHeight,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightGray),
              borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Hero(
                    tag: 'i',
                    child: Container(
                      height: _continerHeight,
                      decoration: BoxDecoration(
                          //Todo: Uncomment the color
                          // color: AppColors.lightPrimaryColor
                          image: DecorationImage(
                        image: NetworkImage(
                          widget.model.product!.images![0],
                        ),
                        fit: BoxFit.contain,
                      )),
                    ),
                  ),
                ),
                // Divider
                DividerContiner(isVertical: true, color: AppColors.lightGray),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      // Poduct content
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product name
                              Text(
                                '${widget.model.product!.enName}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppSizes.regularTextStyle(context),
                              ),
                              // Product disc
                              Text(
                                '${widget.model.product!.enDescription}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppSizes.smallTextStyle(context)
                                    .copyWith(color: Colors.grey),
                              ),
                              const Spacer(),
                              // favorite button
                              InkWell(
                                onTap: () {
                                  AppUtilities.vibration();
                                  setState(() {
                                    sl<FavoritesCubit>()
                                        .deleteProductFromFavorites(
                                            favoriteProductId:
                                                widget.model.id!);
                                  });
                                },
                                child:
                                    state is DeleteFavoriteProductLoadingState
                                        ? LoadingCircle(
                                            height: 20,
                                            width: 20,
                                            strokeWidth: 3)
                                        : Icon(
                                            _isFavorite
                                                ? Icons.favorite
                                                : Icons.favorite_outline,
                                            size: 20,
                                          ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Add to Cart button
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: _animationDuration),
                          height: count == 0 ? 26 : 65,
                          width: 27,
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.primaryColor),
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(7)),
                          child: Column(
                            children: [
                              // Increase products quantity
                              if (count != 0)
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    AppUtilities.vibration();
                                    setState(() {
                                      // Increase product
                                      // sl<BasketCubit>().increaseProduct(
                                      //     itemId: widget.model.id!);
                                    });
                                  },
                                  child: const Center(
                                    child: Text(
                                      '+',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                )),
                              // The product quantity

                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  setState(() {
                                    // Increase product
                                    // sl<BasketCubit>()
                                    //     .increaseProduct(itemId: widget.model.id!);
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: Duration(
                                      milliseconds: _animationDuration),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: count == 0
                                        ? AppColors.white
                                        : AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(
                                        count == 0 ? 6 : 0),
                                  ),
                                  child: Center(
                                    child: count == 0
                                        ? const Icon(Icons.add, size: 18)
                                        : Text(
                                            // Todo >>>>>>>>>>
                                            '$count',
                                            style: TextStyle(
                                              color: count == 0
                                                  ? AppColors.primaryColor
                                                  : AppColors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                  ),
                                ),
                              )),
                              // Decrease products quantity
                              if (count != 0)
                                Expanded(
                                    child: InkWell(
                                  onTap: () {
                                    AppUtilities.vibration();
                                    setState(() {
                                      // Decrease product
                                      // sl<BasketCubit>().decreaseProduct(
                                      //     itemId: widget.model.id!);
                                    });
                                  },
                                  child: const Center(
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.primaryColor),
                                    ),
                                  ),
                                )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BranchProduct getBranchProductModel(String productId) {
    for (var e in sl<CategoriesCubit>().customerSubCategoriesAndProducts!) {
      for (int i = 0; i < e.branchProducts!.length; i++) {
        if (productId == e.branchProducts![i].product!.id) {
          return e.branchProducts![i];
        }
      }
    }
    return null!;
  }
}
