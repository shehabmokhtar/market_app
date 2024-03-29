import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/customer_basket_cubit.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/widgets/poduct/recommended_for_you_widget.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/views/widgets/product_widget2.dart';

class CustomerFavoritesScreen extends StatelessWidget {
  const CustomerFavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Screen app bar
      appBar: customAppBar(
        context: context,
        title: 'Favorites',
        disableBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
        child: ListView(
          children: const [
            SizedBox(height: 15),
            // ListView.separated(
            //   physics: const NeverScrollableScrollPhysics(),
            //   shrinkWrap: true,
            //   itemBuilder: (context, index) =>
            //       ProductItem2(sl<CustomerBasketCubit>().basketProducts[index]),
            //   separatorBuilder: (context, index) => const SizedBox(height: 15),
            //   itemCount: 7,
            // ),
          ],
        ),
      ),
    );
  }
}
