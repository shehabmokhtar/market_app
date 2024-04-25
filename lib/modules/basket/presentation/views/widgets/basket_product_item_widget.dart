import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/divider_continer.dart';
import 'package:market_app/core/Widgets/loading_circle.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/basket/data/models/basket_model.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/basket_cubit.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/customer_product_screen.dart';
import 'package:page_transition/page_transition.dart';

class BasketProdcutItemWidget extends StatefulWidget {
  const BasketProdcutItemWidget(this.model, {super.key});

  final BasketProductModel model;

  @override
  State<BasketProdcutItemWidget> createState() =>
      _BasketProdcutItemWidgetState();
}

class _BasketProdcutItemWidgetState extends State<BasketProdcutItemWidget> {
  final double _continerHeight = 120;
  final int _animationDuration = 250;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final String herroTag =
        'product-image-${widget.model.branchProduct!.product!.id}';

    int count = widget.model.quantity!;
    return InkWell(
      onTap: () {
        AppUtilities.navigateToNewPage(
          context: context,
          newPage: CustomerProductScreen(
            model: widget.model.branchProduct!,
            herroTag: herroTag,
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
                tag: herroTag,
                child: Container(
                  height: _continerHeight,
                  decoration: BoxDecoration(
                      //Todo: Uncomment the color
                      // color: AppColors.lightPrimaryColor
                      image: DecorationImage(
                    image: NetworkImage(
                      widget.model.branchProduct!.product!.images![0],
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
                            '${widget.model.branchProduct!.product!.enName}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppSizes.regularTextStyle(context),
                          ),
                          // Product disc
                          Text(
                            '${widget.model.branchProduct!.product!.enDescription}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppSizes.smallTextStyle(context)
                                .copyWith(color: Colors.grey),
                          ),
                          // Product price
                          Text(
                            '${widget.model.branchProduct!.price} TL',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AppSizes.smallTextStyle(context).copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          // favorite button
                          InkWell(
                            onTap: () {
                              AppUtilities.vibration();
                              setState(() {
                                _isFavorite = !_isFavorite;
                              });
                            },
                            child: Icon(
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
                                  sl<BasketCubit>().increaseProduct(
                                      itemId: widget.model.id!);
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
                              child: BlocConsumer<BasketCubit, BasketStates>(
                            listener: (context, state) {
                              if (state is IncreaseProductsSuccessState ||
                                  state is DecreaseProductsSuccessState) {
                                isLoading = false;
                              }
                            },
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    isLoading = true;
                                    // Increase product
                                    sl<BasketCubit>().increaseProduct(
                                        itemId: widget.model.id!);
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  color: AppColors.primaryColor,
                                  child: Center(
                                    child: isLoading
                                        ? LoadingCircle(
                                            height: 12,
                                            width: 12,
                                            strokeWidth: 2,
                                            color: AppColors.white,
                                          )
                                        : Text(
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
                              );
                            },
                          )),
                          // Decrease products quantity
                          if (count != 0)
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                AppUtilities.vibration();
                                setState(() {
                                  // Decrease product
                                  sl<BasketCubit>().decreaseProduct(
                                      itemId: widget.model.id!);
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
  }
}
