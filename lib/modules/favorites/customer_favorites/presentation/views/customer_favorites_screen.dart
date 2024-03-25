import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/views/widgets/favorite_product_item.dart';

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
          children: [
            const SizedBox(height: 15),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => const FavoriteProductItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
              itemCount: 7,
            ),
          ],
        ),
      ),
    );
  }
}
