import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/loading_circle.dart';
import 'package:market_app/core/functions/custom_awesome_dialog.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/basket_cubit.dart';
import 'package:market_app/modules/categories_and_products/data/models/sub_category_model.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/customer_product_screen.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/product_module_functions.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/model_view/favorites_cubit/favorites_cubit.dart';
import 'package:page_transition/page_transition.dart';

class ProductItemWidgett extends StatefulWidget {
  final BranchProduct model;

  const ProductItemWidgett({super.key, required this.model});

  @override
  State<ProductItemWidgett> createState() => _ProductItemWidgettState();
}

class _ProductItemWidgettState extends State<ProductItemWidgett> {
  final int _animationDuration = 200;
  bool _isLoading = false;
  bool _isFavrite = false;
  int _quantity = 0;

  @override
  Widget build(BuildContext context) {
    final String herroTag = 'product-image-${widget.model.product!.id}';
    final double buttonSize = AppSizes.screenWidth(context) * .06;
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
          // The product widgets
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
                        image: NetworkImage(widget.model.product!.images![0]),
                        fit: BoxFit.contain,
                      )),
                    ),
                  ),
                ),
                // Add to cart button
                addToCartAnimatedButton(buttonSize),
                // A space between add to cart button and texts
                const SizedBox(height: 4),
                // The product texts (title, disc, and price)
                productInfoWidget(context)
              ],
            ),
          ),
          // If there is no stock
          if (widget.model.stock == 0)
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.2),
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
              ),
              child: const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text('There is\n no stock'),
                  )),
            ),
        ],
      ),
    );
  }

  Padding productInfoWidget(BuildContext context) {
    return Padding(
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
                  style: AppSizes.smallTextStyle(context).copyWith(
                    fontSize: 15,
                  ),
                ),
                // Product disc
                Text(
                  widget.model.product!.enDescription!.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppSizes.smallTextStyle(context).copyWith(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                // Product price
                Text(
                  '${widget.model.price.toString()} TL',
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
          ),
          // favorite button
          productFavoriteButton(),
        ],
      ),
    );
  }

  addToCartAnimatedButton(double buttonSize) {
    _quantity = getProductQuantity(widget.model.product!.id!);
    print('>>>>>>>>>> $_quantity');
    bool basketIsLoading = false;
    return Builder(builder: (context) {
      return BlocConsumer<BasketCubit, BasketStates>(
        listener: (context, state) {
          if (state is DecreaseProductsErrorState) {
            print('ERROR: ${state.errorMessage}');
          }
        },
        builder: (context, state) {
          return Center(
            child: AnimatedContainer(
              duration: Duration(milliseconds: _animationDuration),
              height: buttonSize,
              width: _quantity != 0 ? buttonSize * 3 : buttonSize,
              decoration: BoxDecoration(
                color:
                    _quantity != 0 ? AppColors.primaryColor : AppColors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(AppSizes.borderRadius),
              ),
              child: Row(
                children: [
                  // Decrease quantity button
                  if (_quantity != 0)
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          AppUtilities.vibration();
                          basketIsLoading = true;
                          await sl<BasketCubit>()
                              .decreaseProduct(itemId: widget.model.id!);
                          basketIsLoading = false;
                          _quantity =
                              getProductQuantity(widget.model.product!.id!);
                          setState(() {});
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: _animationDuration),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppSizes.borderRadius)),
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
                          AppUtilities.vibration();
                          basketIsLoading = true;
                          await sl<BasketCubit>()
                              .addProductToBasket(itemId: widget.model.id!);
                          basketIsLoading = false;
                          _quantity =
                              getProductQuantity(widget.model.product!.id!);
                          setState(() {});
                        }
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: _animationDuration),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(
                              _quantity != 0 ? 0 : AppSizes.borderRadius),
                        ),
                        child: basketIsLoading
                            ? LoadingCircle()
                            : _quantity != 0
                                ? basketIsLoading
                                    ? LoadingCircle(
                                        height: 13, width: 13, strokeWidth: 3)
                                    : Center(
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
                        onTap: () async {
                          AppUtilities.vibration();
                          basketIsLoading = true;
                          await sl<BasketCubit>()
                              .increaseProduct(itemId: widget.model.id!);
                          basketIsLoading = false;
                          _quantity =
                              getProductQuantity(widget.model.product!.id!);
                          setState(() {});
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: _animationDuration),
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
          );
        },
      );
    });
  }

  // The favorite button
  BlocConsumer<FavoritesCubit, FavoritesStates> productFavoriteButton() {
    return BlocConsumer<FavoritesCubit, FavoritesStates>(
      listener: (context, favoriteState) {
        if (favoriteState is AddProductToFavoritesSuccessState) {
          setState(() {
            _isFavrite = true;
            _isLoading = false;
          });
        }
        if (favoriteState is DeleteProductFromFavoritesSuccessState) {
          setState(() {
            _isFavrite = false;
            _isLoading = false;
          });
        }
        if (favoriteState is AddProductToFavoritesErrorState) {
          customAwesomeDialog(
                  dialogType: DialogType.error,
                  context: context,
                  titleMessage: 'Error',
                  descMessage: favoriteState.errorMessage,
                  btnOkonPress: () {})
              .show();
        }
        if (favoriteState is DeleteProductFromFavoritesErrorState) {
          customAwesomeDialog(
                  dialogType: DialogType.error,
                  context: context,
                  titleMessage: 'Error',
                  descMessage: favoriteState.errorMessage,
                  btnOkonPress: () {})
              .show();
        }
      },
      builder: (context, favoriteState) {
        return InkWell(
          onTap: () {
            AppUtilities.vibration();
            if (!_isFavrite) {
              _isLoading = true;
              sl<FavoritesCubit>().addNewProductToFavorites(
                  productId: widget.model.product!.id!);
            } else {
              _isLoading = true;
              sl<FavoritesCubit>().deleteProductFromFavorites(
                  favoriteProductId:
                      getFavoriteIdFromProductId(widget.model.product!.id!));
            }
          },
          child: _isLoading
              ? LoadingCircle(height: 20, width: 20, strokeWidth: 3)
              : Icon(
                  _isFavrite ? Icons.favorite : Icons.favorite_outline,
                  size: 20,
                ),
        );
      },
    );
  }
}

void basketErrorStates(BasketStates errorState, BuildContext screenContext) {
  String errorMessage = '';
  switch (errorState) {
    case GetBasketProductsErrorState():
      errorMessage = errorState.errorMessage;
      break;
    case AddProductToBasketErrorState():
      errorMessage = errorState.errorMessage;
      break;
    case IncreaseProductsErrorState():
      errorMessage = errorState.errorMessage;
      break;
    case DecreaseProductsErrorState():
      errorMessage = errorState.errorMessage;
      break;
    default:
      errorMessage = 'Unkown Error';
  }

  customAwesomeDialog(
          dialogType: DialogType.error,
          context: screenContext,
          titleMessage: 'Error',
          descMessage: errorMessage,
          btnOkonPress: () {})
      .show();
}
