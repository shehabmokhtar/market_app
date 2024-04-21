import 'package:flutter/material.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';

class AddToCartButton extends StatefulWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  State<AddToCartButton> createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  int _productQuantity = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          AppUtilities.vibration();
          setState(() {
            _productQuantity++;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(microseconds: 300),
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(AppSizes.borderRadius),
            border: Border.all(
              width: 4,
              color: AppColors.primaryColor,
            ),
          ),
          child: _productQuantity == 0
              ? const Center(
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          AppUtilities.vibration();
                          _productQuantity--;
                        });
                      },
                      child: const SizedBox(
                        height: double.infinity,
                        child: Center(
                            child: Text(
                          'Less -',
                          style:
                              TextStyle(fontSize: 17, color: AppColors.white),
                        )),
                      ),
                    )),
                    Expanded(
                        child: Container(
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        _productQuantity.toString(),
                        style: const TextStyle(
                          fontSize: 17,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        setState(() {
                          AppUtilities.vibration();
                          _productQuantity++;
                        });
                      },
                      child: const SizedBox(
                        height: double.infinity,
                        child: Center(
                            child: Text(
                          'More +',
                          style:
                              TextStyle(fontSize: 17, color: AppColors.white),
                        )),
                      ),
                    )),
                  ],
                ),
        ),
      ),
    ));
  }
}
