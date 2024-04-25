part of 'basket_cubit.dart';

@immutable
sealed class BasketStates {}

final class CustomerBasketInitial extends BasketStates {}

// Get basket products loading state
final class GetBasketProductsLoadingState extends BasketStates {}

// Get basket products success state
final class GetBasketProductsSuccessState extends BasketStates {}

// Get basket products error state
final class GetBasketProductsErrorState extends BasketStates {
  final String errorMessage;
  GetBasketProductsErrorState(this.errorMessage);
}

// Add product to basket loading state
final class AddProductToBasketLoadingState extends BasketStates {}

// Add product to basket success state
final class AddProductToBasketSuccessState extends BasketStates {}

// Add product to basket error state
final class AddProductToBasketErrorState extends BasketStates {
  final String errorMessage;
  AddProductToBasketErrorState(this.errorMessage);
}

// Increase product loading state
final class IncreaseProductsLoadingState extends BasketStates {}

// Increase product success state
final class IncreaseProductsSuccessState extends BasketStates {}

// Increase product error state
final class IncreaseProductsErrorState extends BasketStates {
  final String errorMessage;
  IncreaseProductsErrorState(this.errorMessage);
}

// Decrease product loading state
final class DecreaseProductsLoadingState extends BasketStates {}

// Decrease product success state
final class DecreaseProductsSuccessState extends BasketStates {}

// Decrease product error state
final class DecreaseProductsErrorState extends BasketStates {
  final String errorMessage;
  DecreaseProductsErrorState(this.errorMessage);
}

List<BasketStates> basketErrorsStates = [
  GetBasketProductsErrorState(''),
  AddProductToBasketErrorState(''),
  IncreaseProductsErrorState(''),
  DecreaseProductsErrorState(''),
];
