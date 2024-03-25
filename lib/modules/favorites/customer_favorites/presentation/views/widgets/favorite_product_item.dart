import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/divider_continer.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class FavoriteProductItem extends StatefulWidget {
  const FavoriteProductItem({super.key});

  @override
  State<FavoriteProductItem> createState() => _FavoriteProductItemState();
}

class _FavoriteProductItemState extends State<FavoriteProductItem> {
  final double _continerHeight = 125;
  bool _isFavorite = false;
  int _count = 0;
  final int _animationDuration = 300;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Container(
              height: _continerHeight,
              decoration: const BoxDecoration(
                  //Todo: Uncomment the color
                  // color: AppColors.lightPrimaryColor
                  image: DecorationImage(
                // Todo >>>>>>>>>>>>>>
                image: NetworkImage(
                  'https://pbblogassets.s3.amazonaws.com/uploads/2015/11/Shampoo-White-Background.jpg',
                ),
                fit: BoxFit.contain,
              )),
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
                        // Todo >>>>>>>>>
                        Text(
                          'Product Name',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppSizes.regularTextStyle(context),
                        ),
                        // Product disc
                        // Todo >>>>>>>>>
                        Text(
                          'Product Name Product Name Product Name Product Name',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppSizes.smallTextStyle(context)
                              .copyWith(color: Colors.grey),
                        ),
                        // Product price
                        // Todo >>>>>>>>>
                        Text(
                          '20 TL',
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
                    height: _count == 0 ? 26 : 65,
                    width: 27,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(7)),
                    child: Column(
                      children: [
                        // Increase products quantity
                        if (_count != 0)
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              AppUtilities.vibration();
                              setState(() {
                                if (0 < _count) {
                                  _count++;
                                }
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
                              if (_count == 0) {
                                _count++;
                              }
                            });
                          },
                          child: AnimatedContainer(
                            duration:
                                Duration(milliseconds: _animationDuration),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: _count == 0
                                  ? AppColors.white
                                  : AppColors.primaryColor,
                              borderRadius:
                                  BorderRadius.circular(_count == 0 ? 6 : 0),
                            ),
                            child: Center(
                              child: _count == 0
                                  ? const Icon(Icons.add, size: 18)
                                  : Text(
                                      // Todo >>>>>>>>>>
                                      '$_count',
                                      style: TextStyle(
                                        color: _count == 0
                                            ? AppColors.primaryColor
                                            : AppColors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ),
                        )),
                        // Decrease products quantity
                        if (_count != 0)
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              AppUtilities.vibration();
                              setState(() {
                                if (0 < _count) {
                                  _count--;
                                }
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
    );
  }
}
