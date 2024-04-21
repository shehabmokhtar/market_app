import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';
import 'package:market_app/core/Widgets/loading_shape.dart';
import 'package:market_app/core/functions/custom_awesome_dialog.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/model_view/favorites_cubit/favorites_cubit.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/views/widgets/favorite_product_item_widget.dart';

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
        listener: (context, state) {
          if (state is GetFavoritesErrorState) {
            customAwesomeDialog(
              dialogType: DialogType.error,
              context: context,
              titleMessage: 'Error',
              descMessage: state.errorMessage,
              btnOkonPress: () {},
            ).show();
          }
        },
        builder: (context, state) {
          return LoadingShapeFullScreen(
            condition: state is GetFavoritesLoadingState,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
              child: ListView(
                children: [
                  // A space in the top
                  const SizedBox(height: 15),
                  // In the case of no favorties products
                  if (sl<FavoritesCubit>().favoriteProducts.isEmpty &&
                      state is! GetFavoritesLoadingState)
                    const Center(
                        child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 200),
                      child: Text('There are no favorites'),
                    )),
                  // The favorites products list
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => FavoriteProductItemWidget(
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
