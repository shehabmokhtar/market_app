import 'package:bloc/bloc.dart';
import 'package:market_app/core/functions/get_list_from_json.dart';
import 'package:market_app/modules/favorites/customer_favorites/data/models/favorite_product_model.dart';
import 'package:market_app/modules/favorites/customer_favorites/data/repository/favorites_repo/favorites_repo_impl.dart';
import 'package:meta/meta.dart';
part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesStates> {
  FavoritesCubit() : super(FavoritesInitial());

  FavoritesRepo favoritesRepo = FavoritesRepo();

// Customer favorites list
  List<FavoriteProductModel> favoriteProducts = [];

  // Get favorite products
  Future<void> getFavoriteProducts() async {
    emit(GetFavoritesLoadingState());
    // Clear the all old favorite products before filling it again
    favoriteProducts.clear();
    var result = await favoritesRepo.getFavoriteProducts();

    result.fold((left) {
      // Todo <<<<<<<<<<<:>>>>>>>>>>>>>>
      favoriteProducts = getListFromJson(
          data: left.data, fromJson: (e) => FavoriteProductModel.fromJson(e));
      emit(GetFavoritesSuccessState());
    }, (right) {
      emit(GetFavoritesErrorState(right.errorMessage));
    });
  }

  // Add a product to customer favorites list
  Future<void> addNewProductToFavorites({
    required String productId,
  }) async {
    emit(AddProductToFavoritesLoadingState());

    var result = await favoritesRepo.addProductToFavorites(productId);

    result.fold((left) async {
      await getFavoriteProducts();
      emit(AddProductToFavoritesSuccessState());
    }, (right) {
      emit(AddProductToFavoritesErrorState(right.errorMessage));
    });
  }

// Delete a product from customer favorites list
  Future<void> deleteProductFromFavorites({
    required String favoriteProductId,
  }) async {
    emit(DeleteFavoriteProductLoadingState());

    var result =
        await favoritesRepo.deleteProductFromFavorites(favoriteProductId);

    result.fold((left) async {
      await getFavoriteProducts();
      emit(DeleteProductFromFavoritesSuccessState());
    }, (right) {
      emit(DeleteProductFromFavoritesErrorState(right.errorMessage));
    });
  }
}
