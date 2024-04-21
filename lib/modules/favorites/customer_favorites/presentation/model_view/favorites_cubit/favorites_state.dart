part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesStates {}

final class FavoritesInitial extends FavoritesStates {}

// Get favorites products loading state
final class GetFavoritesLoadingState extends FavoritesStates {}

// Get favorites products success state
final class GetFavoritesSuccessState extends FavoritesStates {}

// Get favorites products error state
final class GetFavoritesErrorState extends FavoritesStates {
  final String errorMessage;
  GetFavoritesErrorState(this.errorMessage);
}

// Add product to favorites list loading state
final class AddProductToFavoritesLoadingState extends FavoritesStates {}

// Add product to favorites list success state
final class AddProductToFavoritesSuccessState extends FavoritesStates {}

// Add product to favorites list error state
final class AddProductToFavoritesErrorState extends FavoritesStates {
  final String errorMessage;
  AddProductToFavoritesErrorState(this.errorMessage);
}

// delete product from favorites list loading state
final class DeleteProductFromFavoritesLoadingState extends FavoritesStates {}

// delete product from favorites list success state
final class DeleteProductFromFavoritesSuccessState extends FavoritesStates {}

// delete product from favorites list error state
final class DeleteProductFromFavoritesErrorState extends FavoritesStates {
  final String errorMessage;
  DeleteProductFromFavoritesErrorState(this.errorMessage);
}
