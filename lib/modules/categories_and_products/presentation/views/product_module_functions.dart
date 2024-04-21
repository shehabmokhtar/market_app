// This function used to get favorite id from product id
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/basket_cubit.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/model_view/favorites_cubit/favorites_cubit.dart';

String getFavoriteIdFromProductId(String productId) {
  for (var e in sl<FavoritesCubit>().favoriteProducts) {
    if (e.product!.id == productId) {
      return e.id!;
    }
  }
  return '';
}

bool isProductInFavorite(String productId) {
  for (var e in sl<FavoritesCubit>().favoriteProducts) {
    if (e.product!.id == productId) {
      return true;
    }
  }
  return false;
}

int getProductQuantity(String productId) {
  int q = 0;

  sl<BasketCubit>().productsIds.asMap().forEach((index, String id) {
    if (productId == id) {
      q = sl<BasketCubit>().basketProducts[index].quantity!;
    }
  });
  return q;
}

int getBasketProductId(String productId) {
  for (var e in sl<BasketCubit>().basketProducts) {
    if (productId == e.branchProduct!.product!.id) {
      print('>>>>>>> ${e.id}');
      return e.id!;
    }
  }
  return -1;
}
