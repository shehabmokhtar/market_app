import 'package:bloc/bloc.dart';
import 'package:market_app/modules/favorites/customer_favorites/data/repository/favorites_repo/favorites_repo_impl.dart';
import 'package:meta/meta.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesStates> {
  FavoritesCubit() : super(FavoritesInitial());

  FavoritesRepo favoritesRepo = FavoritesRepo();

// Customer favorites list
  List favoriteProducts = [];

  // Get favorite products
  Future<void> getFavoriteProducts() async {
    emit(GetFavoritesLoadingState());
    // Clear the all old favorite products before filling it again
    favoriteProducts.clear();
    var result = await favoritesRepo.getFavoriteProducts();

    result.fold((left) {
      emit(GetFavoritesSuccessState());
    }, (right) {
      emit(GetFavoritesErrorState(right.errorMessage));
    });
  }

  // Add a product to customer favorites list
  Future<void> addNewProductToFavorites({
    required String productId,
    // Todo >>>>>>>>>>
  }) async {
    emit(AddProductToFavoritesLoadingState());

// Todo >>>>>>>>>>>
    Map<String, dynamic> data = {};
    var result = await favoritesRepo.addProductToFavorites(productId, data);

    result.fold((left) {
      emit(AddProductToFavoritesSuccessState());
    }, (right) {
      emit(AddProductToFavoritesErrorState(right.errorMessage));
    });
  }

// Delete a product from customer favorites list
  Future<void> deleteProductFromFavorites({
    required String productId,
  }) async {
    emit(DeleteProductFromFavoritesLoadingState());

    var result = await favoritesRepo.deleteProductFromFavorites(productId);

    result.fold((left) {
      emit(DeleteProductFromFavoritesSuccessState());
    }, (right) {
      emit(DeleteProductFromFavoritesErrorState(right.errorMessage));
    });
  }
}
