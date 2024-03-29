part of 'customer_basket_cubit.dart';

@immutable
sealed class CustomerBasketStates {}

final class CustomerBasketInitial extends CustomerBasketStates {}

// Get basket products loading state
final class GetBasketProductsLoadingState extends CustomerBasketStates {}

// Get basket products success state
final class GetBasketProductsSuccessState extends CustomerBasketStates {}

// Get basket products error state
final class GetBasketProductsErrorState extends CustomerBasketStates {
  final String errorMessage;
  GetBasketProductsErrorState(this.errorMessage);
}

// Add product to basket loading state
final class AddProductToBasketLoadingState extends CustomerBasketStates {}

// Add product to basket success state
final class AddProductToBasketSuccessState extends CustomerBasketStates {}

// Add product to basket error state
final class AddProductToBasketErrorState extends CustomerBasketStates {
  final String errorMessage;
  AddProductToBasketErrorState(this.errorMessage);
}

// Increase product loading state
final class IncreaseProductsLoadingState extends CustomerBasketStates {}

// Increase product success state
final class IncreaseProductsSuccessState extends CustomerBasketStates {}

// Increase product error state
final class IncreaseProductsErrorState extends CustomerBasketStates {
  final String errorMessage;
  IncreaseProductsErrorState(this.errorMessage);
}

// Decrease product loading state
final class DecreaseProductsLoadingState extends CustomerBasketStates {}

// Decrease product success state
final class DecreaseProductsSuccessState extends CustomerBasketStates {}

// Decrease product error state
final class DecreaseProductsErrorState extends CustomerBasketStates {
  final String errorMessage;
  DecreaseProductsErrorState(this.errorMessage);
}
