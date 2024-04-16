import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:market_app/core/services/failures.dart';

abstract class CustomerBasketAbstractRepo {
  // Get customer basket products
  Future<Either<Response, ServerFailure>> getCustomerBasketProducts();

  // Add product to basket
  Future<Either<Response, ServerFailure>> customerAddProductToBasket(
      int branchProductId);

  // Increase product quantity
  Future<Either<Response, ServerFailure>> increaseProductQuantity(int itemId);

  // Decrease product quantity
  Future<Either<Response, ServerFailure>> decreaseProductQuantity(int itemId);
}
