import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/categories_and_products/data/models/sub_category_model.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/customer_product_screen.dart';
import 'package:page_transition/page_transition.dart';

class ProductWidget extends StatefulWidget {
  final BranchProducts model;

  const ProductWidget({super.key, required this.model});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  final int _animationDuration = 200;

  bool added = false;
  @override
  Widget build(BuildContext context) {
    final double buttonSize = AppSizes.screenWidth(context) * .06;
    return InkWell(
      onTap: () {
        AppUtilities.navigateToNewPage(
          context: context,
          newPage: CustomerProductScreen(
            model: widget.model,
          ),
          pageTransitionType: PageTransitionType.fade,
        );
      },
      child: AnimatedContainer(
        height: 170,
        width: 170,
        duration: Duration(
          milliseconds: _animationDuration,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: added
              ? Border.all(
                  color: AppColors.primaryColor.withOpacity(.7), width: 2)
              : null,
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
                    image: NetworkImage(widget.model.product!.images![0]),
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
                width: added ? buttonSize * 3 : buttonSize,
                decoration: BoxDecoration(
                  color: added ? AppColors.primaryColor : AppColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius),
                ),
                child: Row(
                  children: [
                    //    Decrease quantity button
                    if (added)
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                            duration:
                                Duration(milliseconds: _animationDuration),
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
                    Expanded(
                      // flex: added ? 0 : 1,
                      child: InkWell(
                        onTap: () {
                          AppUtilities.vibration();
                          setState(() {
                            added = !added;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: _animationDuration),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(
                                added ? 0 : AppSizes.borderRadius),
                          ),
                          child: added
                              ? Center(
                                  child: Text(
                                  '1',
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
                    if (added)
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                            duration:
                                Duration(milliseconds: _animationDuration),
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
            )
          ],
        ),
      ),
    );
  }
}
