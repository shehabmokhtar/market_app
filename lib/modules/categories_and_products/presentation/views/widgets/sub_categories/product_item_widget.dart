import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/loading_circle.dart';
import 'package:market_app/core/functions/custom_awesome_dialog.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/basket_cubit.dart';
import 'package:market_app/modules/categories_and_products/data/models/sub_category_model.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/customer_product_screen.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/product_module_functions.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/model_view/favorites_cubit/favorites_cubit.dart';
import 'package:market_app/modules/profile/customer_profile/data/models/user_model.dart';
import 'package:page_transition/page_transition.dart';

class ProductItemWidget extends StatefulWidget {
  final BranchProduct model;

  const ProductItemWidget({super.key, required this.model});

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  final int _animationDuration = 200;

  bool _isLoading = false;

  late bool _isFavrite;

  int? _quantity;

  @override
  Widget build(BuildContext context) {
    final String herroTag = 'product-image-${widget.model.product!.id}';

    final double buttonSize = AppSizes.screenWidth(context) * .06;
    //! Todo: The quantity doesn't listen
    _quantity = getProductQuantity(widget.model.product!.id!);
    print(">>>>>>>>>>>> $_quantity");
    return Builder(builder: (context) {
      return BlocConsumer<BasketCubit, BasketStates>(
        listener: (context, state) {
          // if (state is AddProductToBasketLoadingState ||
          //     state is DecreaseProductsLoadingState ||
          //     state is IncreaseProductsLoadingState) {
          //   _isLoading = true;
          // }
          // if (state is AddProductToBasketSuccessState ||
          //     state is DecreaseProductsSuccessState ||
          //     state is IncreaseProductsSuccessState) {
          //   _isLoading = false;
          // }
        },
        builder: (context, state) {
          // Check is the product in the favorites or not and assign it to _isFavorite varaible
          _isFavrite = isProductInFavorite(widget.model.product!.id!);

          return InkWell(
            onTap: () {
              if (widget.model.stock != 0) {
                AppUtilities.navigateToNewPage(
                  context: context,
                  newPage: CustomerProductScreen(
                    model: widget.model,
                    herroTag: herroTag,
                  ),
                  pageTransitionType: PageTransitionType.fade,
                );
              }
            },
            child: Stack(
              children: [
                AnimatedContainer(
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
                          tag: herroTag,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: NetworkImage(
                                  widget.model.product!.images![0]),
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
                                    onTap: () async {
                                      await sl<BasketCubit>().decreaseProduct(
                                          itemId: widget.model.id!);
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
                                  onTap: () async {
                                    if (_quantity == 0) {
                                      setState(() async {
                                        _isLoading = true;
                                        AppUtilities.vibration();
                                        await sl<BasketCubit>()
                                            .addProductToBasket(
                                                itemId: widget.model.id!)
                                            .then((value) {
                                          _isLoading = false;
                                        });
                                      });
                                    }
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(
                                        milliseconds: _animationDuration),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                          _quantity != 0
                                              ? 0
                                              : AppSizes.borderRadius),
                                    ),
                                    child: _isLoading
                                        ? LoadingCircle()
                                        : _quantity != 0
                                            ? _isLoading
                                                ? LoadingCircle(
                                                    height: 13,
                                                    width: 13,
                                                    strokeWidth: 3)
                                                : Center(
                                                    child: Text(
                                                    _quantity.toString(),
                                                    style: TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
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
                                    onTap: () async {
                                      await sl<BasketCubit>().increaseProduct(
                                          itemId: widget.model.id!);
                                      print('>>>>>> ${widget.model.id!}');
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Product name
                                  Text(
                                    widget.model.product!.enName!.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppSizes.smallTextStyle(context)
                                        .copyWith(
                                      fontSize: 15,
                                    ),
                                  ),
                                  // Product disc
                                  Text(
                                    widget.model.product!.enDescription!
                                        .toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppSizes.smallTextStyle(context)
                                        .copyWith(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                  // Product price
                                  Text(
                                    '${widget.model.price.toString()} TL',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppSizes.smallTextStyle(context)
                                        .copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // favorite button
                            // productFavoriteButton(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // If there is no stock
                if (widget.model.stock == 0)
                  Expanded(
                      child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.2),
                      borderRadius:
                          BorderRadius.circular(AppSizes.borderRadius),
                    ),
                    child: const Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text('There is\n no stock'),
                        )),
                  )),
              ],
            ),
          );
        },
      );
    });
  }
}
