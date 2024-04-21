import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:market_app/core/services/failures.dart';

abstract class FavoritesAbstractRepo {
  // Get the all customer favorites products
  Future<Either<Response, ServerFailure>> getFavoriteProducts();
  // Add a product to customer favorites list
  Future<Either<Response, ServerFailure>> addProductToFavorites(
    String productId,
  );
  // Delete a product from customer favorites list
  Future<Either<Response, ServerFailure>> deleteProductFromFavorites(
      String productId);
}
