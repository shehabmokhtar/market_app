import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/Widgets/loading_shape.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/model_view/favorites_cubit/favorites_cubit.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/views/widgets/product_item_widget_2.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Screen app bar
      appBar: customAppBar(
        context: context,
        title: 'Favorites',
        disableBackArrow: true,
      ),
      // The favorites list
      body: BlocConsumer<FavoritesCubit, FavoritesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return LoadingShapeFullScreen(
            condition: state is GetFavoritesLoadingState,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  if (sl<FavoritesCubit>().favoriteProducts.isEmpty &&
                      state is! GetFavoritesLoadingState)
                    const Center(
                        child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 200),
                      child: Text('There are no favorites'),
                    )),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => ProductItemWidget2(
                      sl<FavoritesCubit>().favoriteProducts[index],
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 15),
                    itemCount: sl<FavoritesCubit>().favoriteProducts.length,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
