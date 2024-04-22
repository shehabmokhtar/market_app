import 'package:flutter/material.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/basket_cubit.dart';
import 'package:market_app/modules/orders/presentation/views/customer_order_screen.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () {
          AppUtilities.navigateToNewPage(
            context: context,
            newPage: CustomerOrderScreen(
              basketScreenContext: context,
            ),
          );
        },
        child: Container(
          height: 65,
          color: Colors.white,
          child: Container(
            margin: const EdgeInsetsDirectional.symmetric(
              vertical: 8,
              horizontal: 15,
            ),
            padding: const EdgeInsetsDirectional.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(
                AppSizes.borderRadius,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Center(
                  child: Text(
                    'Checkout',
                    style: AppSizes.regularTextStyle(context).copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
                Text(
                  '${sl<BasketCubit>().basketModel!.totalPrice} TL',
                  style: AppSizes.regularTextStyle(context).copyWith(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
