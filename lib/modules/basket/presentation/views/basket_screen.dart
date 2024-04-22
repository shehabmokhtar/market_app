import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/Widgets/loading_shape.dart';
import 'package:market_app/core/functions/custom_awesome_dialog.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/basket_cubit.dart';
import 'package:market_app/modules/basket/presentation/views/widgets/basket_product_item_widget.dart';
import 'package:market_app/modules/basket/presentation/views/widgets/checkout_button.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/poduct/recommended_for_you_widget.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoadingg = false;
    return BlocConsumer<BasketCubit, BasketStates>(
      listener: (context, state) {
        if (state is IncreaseProductsLoadingState ||
            state is DecreaseProductsLoadingState) {
          isLoadingg = true;
        }
        if (state is IncreaseProductsSuccessState ||
            state is DecreaseProductsSuccessState) {
          isLoadingg = false;
        }
        if (state is GetBasketProductsErrorState ||
            state is IncreaseProductsErrorState ||
            state is DecreaseProductsErrorState) {
          isLoadingg = false;
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
        return LoadingShapeFullScreen(
          condition: isLoadingg,
          child: Scaffold(
            appBar: customAppBar(
              context: context,
              title: 'Basket',
            ),
            body: ListView(
              children: [
                const SizedBox(height: 20),
                // Customer products list
                Padding(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 15),
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => BasketProdcutItemWidget(
                        sl<BasketCubit>().basketProducts[index]),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: sl<BasketCubit>().basketProducts.length,
                  ),
                ),
                // If theere is no products in the basket
                if (sl<BasketCubit>().basketProducts.isEmpty &&
                    !isLoadingg &&
                    state is GetBasketProductsSuccessState)
                  const Center(
                      child: Padding(
                    padding: EdgeInsetsDirectional.symmetric(
                      vertical: 40,
                    ),
                    child: Text('There are no products in the basket'),
                  )),
                const SizedBox(height: 10),
                // Recommended for you
                const RecommendedForYouWidget(),
                const SizedBox(height: 40),
              ],
            ),
            // Cart button and favorite button
            bottomNavigationBar: const CheckoutButton(),
          ),
        );
      },
    );
  }
}
