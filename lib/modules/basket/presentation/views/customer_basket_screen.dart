import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/Widgets/loading_circle.dart';
import 'package:market_app/core/Widgets/loading_shape.dart';
import 'package:market_app/core/functions/custom_awesome_dialog.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/customer_basket_cubit.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/poduct/recommended_for_you_widget.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/views/widgets/product_widget2.dart';

class CustomerBasketScreen extends StatelessWidget {
  const CustomerBasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    if (sl<CustomerBasketCubit>().basketProducts.isEmpty) {
      sl<CustomerBasketCubit>().getbasketProducts();
    }
    return BlocConsumer<CustomerBasketCubit, CustomerBasketStates>(
      listener: (context, state) {
        if (state is IncreaseProductsLoadingState ||
            state is DecreaseProductsLoadingState) {
          isLoading = true;
        }
        if (state is IncreaseProductsSuccessState ||
            state is DecreaseProductsSuccessState) {
          isLoading = false;
        }
        if (state is GetBasketProductsErrorState ||
            state is IncreaseProductsErrorState ||
            state is DecreaseProductsErrorState) {
          isLoading = false;
          customAwesomeDialog(
                  dialogType: DialogType.error,
                  context: context,
                  titleMessage: 'Error',
                  // Todo >>>>>>>>>>>>>>>> Get the error message
                  descMessage: 'Error',
                  btnOkonPress: () {})
              .show();
        }
      },
      builder: (context, state) {
        return LoadingShape(
          condition: isLoading,
          child: Scaffold(
              appBar: customAppBar(
                context: context,
                title: 'Basket',
              ),
              body: ListView(
                children: [
                  const SizedBox(height: 20),
                  // Customer products list
                  if (sl<CustomerBasketCubit>().basketProducts.isNotEmpty ||
                      !isLoading)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 15),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ProductItem2(
                            sl<CustomerBasketCubit>().basketProducts[index]),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemCount:
                            sl<CustomerBasketCubit>().basketProducts.length,
                      ),
                    ),
                  // If theere is no products in the basket
                  if (sl<CustomerBasketCubit>().basketProducts.isEmpty)
                    const Center(
                        child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        vertical: 40,
                      ),
                      child: Text('There are no products in the basket'),
                    )),
                  // In the case of loading
                  if (state is GetBasketProductsLoadingState)
                    const Center(
                        child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        vertical: 40,
                      ),
                      child: LoadingCircle(),
                    )),
                  const SizedBox(height: 10),
                  // Recommended for you
                  const RecommendedForYouWidget(),
                  const SizedBox(height: 40),
                ],
              ),
              // Cart button and favorite button
              bottomNavigationBar: SafeArea(
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
                          '${sl<CustomerBasketCubit>().basketModel!.totalPrice} TL',
                          style: AppSizes.regularTextStyle(context).copyWith(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
