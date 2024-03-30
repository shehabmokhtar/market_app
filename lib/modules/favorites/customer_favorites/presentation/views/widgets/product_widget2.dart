import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/divider_continer.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/basket/data/models/basket_model.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/customer_basket_cubit.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/customer_product_screen.dart';
import 'package:page_transition/page_transition.dart';

class ProductItem2 extends StatefulWidget {
  const ProductItem2(this.model, {super.key});

  final BasketProducts model;

  @override
  State<ProductItem2> createState() => _ProductItem2State();
}

class _ProductItem2State extends State<ProductItem2> {
  final double _continerHeight = 120;
  final int _animationDuration = 250;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    int count = widget.model.quantity!;
    return InkWell(
      onTap: () {
        AppUtilities.navigateToNewPage(
          context: context,
          newPage: CustomerProductScreen(
            model: widget.model.branchProduct!,
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
                                  sl<CustomerBasketCubit>().increaseProduct(
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
                              child: InkWell(
                            onTap: () {
                              setState(() {
                                // Increase product
                                sl<CustomerBasketCubit>()
                                    .increaseProduct(itemId: widget.model.id!);
                              });
                            },
                            child: AnimatedContainer(
                              duration:
                                  Duration(milliseconds: _animationDuration),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: count == 0
                                    ? AppColors.white
                                    : AppColors.primaryColor,
                                borderRadius:
                                    BorderRadius.circular(count == 0 ? 6 : 0),
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
                                  sl<CustomerBasketCubit>().decreaseProduct(
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
