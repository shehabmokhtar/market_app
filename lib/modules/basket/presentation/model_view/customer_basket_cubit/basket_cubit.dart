import 'package:bloc/bloc.dart';
import 'package:market_app/modules/basket/data/models/basket_model.dart';
import 'package:market_app/modules/basket/data/repository/basket_repo_impl.dart';
import 'package:meta/meta.dart';

part 'basket_state.dart';

class BasketCubit extends Cubit<BasketStates> {
  BasketCubit() : super(CustomerBasketInitial());

  BasketRepo customerBasketRepo = BasketRepo();
  BasketModel? basketModel;
  List<BasketProductModel> basketProducts = [];
  List<String> productsIds = [];

// Get basket produts
  Future<void> getbasketProducts() async {
    emit(GetBasketProductsLoadingState());
    // The request result
    var result = await customerBasketRepo.getCustomerBasketProducts();

    result.fold((left) {
      basketModel = BasketModel.fromJson(left.data);

      // clear list before filling it again
      basketProducts.clear();
      productsIds.clear();

      for (var e in basketModel!.basketProducts!) {
        basketProducts.add(e);
        productsIds.add(e.branchProduct!.product!.id!);
        print('>>>> ${e.branchProduct!.product!.id!}');
      }
      emit(GetBasketProductsSuccessState());
    }, (right) {
      emit(GetBasketProductsErrorState(right.errorMessage));
    });
  }

// Add a new product to basket
  Future<void> addProductToBasket({
    required int itemId,
  }) async {
    emit(AddProductToBasketLoadingState());

    var result = await customerBasketRepo.customerAddProductToBasket(itemId);

    result.fold((left) {
      getbasketProducts();
      emit(AddProductToBasketSuccessState());
    }, (right) => emit(AddProductToBasketErrorState(right.errorMessage)));
  }

// Increase product quantity
  Future<void> increaseProduct({
    required int itemId,
  }) async {
    emit(IncreaseProductsLoadingState());
    basketProducts.clear();
    // The requset result
    var result = await customerBasketRepo.increaseProductQuantity(itemId);

    result.fold((left) {
      // Get products to update the quantity
      getbasketProducts();
      emit(IncreaseProductsSuccessState());
    }, (right) => emit(IncreaseProductsErrorState(right.errorMessage)));
  }

// Decrease product quantity
  Future<void> decreaseProduct({
    required int itemId,
  }) async {
    emit(DecreaseProductsLoadingState());
    basketProducts.clear();
    // The requset result
    var result = await customerBasketRepo.decreaseProductQuantity(itemId);

    result.fold((left) {
      // Get products to update the quantity
      getbasketProducts();
      emit(DecreaseProductsSuccessState());
    }, (right) => emit(DecreaseProductsErrorState(right.errorMessage)));
  }
}
