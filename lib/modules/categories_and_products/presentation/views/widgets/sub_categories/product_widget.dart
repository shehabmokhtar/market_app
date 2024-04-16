import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/loading_shape.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/customer_basket_cubit.dart';
import 'package:market_app/modules/categories_and_products/data/models/sub_category_model.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/customer_product_screen.dart';
import 'package:page_transition/page_transition.dart';

class ProductWidget extends StatelessWidget {
  final BranchProducts model;

  ProductWidget({super.key, required this.model});

  final int _animationDuration = 200;
  bool _isLoading = false;
  int? _quantity;

  @override
  Widget build(BuildContext context) {
    final double buttonSize = AppSizes.screenWidth(context) * .06;
    return BlocConsumer<CustomerBasketCubit, CustomerBasketStates>(
      listener: (context, state) {
        if (state is AddProductToBasketLoadingState ||
            state is DecreaseProductsLoadingState ||
            state is IncreaseProductsLoadingState) {
          _isLoading = true;
        }
        if (state is AddProductToBasketSuccessState ||
            state is DecreaseProductsSuccessState ||
            state is IncreaseProductsSuccessState) {
          _isLoading = false;
        }
      },
      builder: (context, state) {
        //! Todo: The quantity doesn't listen
        _quantity = getProductQuantity(model.product!.id!);
        return LoadingShapeFullScreen(
          condition: _isLoading,
          child: InkWell(
            onTap: () {
              AppUtilities.navigateToNewPage(
                context: context,
                newPage: CustomerProductScreen(
                  model: model,
                ),
                pageTransitionType: PageTransitionType.fade,
              );
            },
            child: AnimatedContainer(
              padding: const EdgeInsetsDirectional.all(2),
              duration: Duration(
                milliseconds: _animationDuration,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(
                    color: AppColors.primaryColor.withOpacity(.7),
                    width: _quantity != 0 ? 2 : .3),
                borderRadius: BorderRadius.circular(
                  AppSizes.borderRadius,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // The product image and the quantity
                  Expanded(
                    child: Hero(
                      tag: 'i',
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(model.product!.images![0]),
                          fit: BoxFit.contain,
                        )),
                      ),
                    ),
                  ),
                  // Add to cart button
                  Center(
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: _animationDuration),
                      height: buttonSize,
                      width: _quantity != 0 ? buttonSize * 3 : buttonSize,
                      decoration: BoxDecoration(
                        color: _quantity != 0
                            ? AppColors.primaryColor
                            : AppColors.white,
                        border: Border.all(),
                        borderRadius:
                            BorderRadius.circular(AppSizes.borderRadius),
                      ),
                      child: Row(
                        children: [
                          //    Decrease quantity button
                          if (_quantity != 0)
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  sl<CustomerBasketCubit>().decreaseProduct(
                                      itemId: getBasketProductId(
                                          model.product!.id!));
                                },
                                child: AnimatedContainer(
                                  duration: Duration(
                                      milliseconds: _animationDuration),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppSizes.borderRadius)),
                                  child: Center(
                                      child: Text(
                                    '-',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: buttonSize * .7,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          // Product Quantity
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                AppUtilities.vibration();
                                if (_quantity == 0) {
                                  sl<CustomerBasketCubit>()
                                      .addProductToBasket(itemId: model.id!);
                                }
                              },
                              child: AnimatedContainer(
                                duration:
                                    Duration(milliseconds: _animationDuration),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(
                                      _quantity != 0
                                          ? 0
                                          : AppSizes.borderRadius),
                                ),
                                child: _quantity != 0
                                    ? Center(
                                        child: Text(
                                        _quantity.toString(),
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: buttonSize * .7,
                                        ),
                                      ))
                                    : Icon(
                                        Icons.add,
                                        size: buttonSize * .8,
                                      ),
                              ),
                            ),
                          ),
                          // Increase quantity button
                          if (_quantity != 0)
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  sl<CustomerBasketCubit>()
                                      .increaseProduct(itemId: model.id!);
                                },
                                child: AnimatedContainer(
                                  duration: Duration(
                                      milliseconds: _animationDuration),
                                  child: Icon(
                                    Icons.add,
                                    size: buttonSize * .7,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product name
                        Text(
                          model.product!.enName!.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppSizes.smallTextStyle(context).copyWith(
                            fontSize: 15,
                          ),
                        ),
                        // Product disc
                        Text(
                          model.product!.enDescription!.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppSizes.smallTextStyle(context).copyWith(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        // Product price
                        Text(
                          '${model.price.toString()} TL',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppSizes.smallTextStyle(context).copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

int getProductQuantity(String productId) {
  int q = 0;

  sl<CustomerBasketCubit>().productsIds.asMap().forEach((index, String id) {
    if (productId == id) {
      q = sl<CustomerBasketCubit>().basketProducts[index].quantity!;
    }
  });
  return q;
}

int getBasketProductId(String productId) {
  for (var e in sl<CustomerBasketCubit>().basketProducts) {
    if (productId == e.branchProduct!.product!.id) {
      print('>>>>>>> ${e.id}');
      return e.id!;
    }
  }
  return -1;
}
