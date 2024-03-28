part of 'categories_cubit.dart';

@immutable
sealed class CategoriesStates {}

final class CategoriesInitial extends CategoriesStates {}

//?    Get Categories      //
// Get categories loading state
final class GetCategoriesLoadingState extends CategoriesStates {}

// Get categories success state
final class GetCategoriesSuccessState extends CategoriesStates {}

// Get categories error state
final class GetCategoriesErrorState extends CategoriesStates {
  final String errorMessage;
  GetCategoriesErrorState(this.errorMessage);
}

//?    Get Sub Categories And Products      //
// Get categories loading state
final class GetSubCategoriesAndProductsLoadingState extends CategoriesStates {}

// Get categories success state
final class GetSubCategoriesAndProductsSuccessState extends CategoriesStates {}

// Get categories error state
final class GetSubCategoriesAndProductsErrorState extends CategoriesStates {
  final String errorMessage;
  GetSubCategoriesAndProductsErrorState(this.errorMessage);
}
