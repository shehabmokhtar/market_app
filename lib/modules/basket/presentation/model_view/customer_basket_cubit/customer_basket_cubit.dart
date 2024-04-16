import 'package:bloc/bloc.dart';
import 'package:market_app/modules/basket/data/models/basket_model.dart';
import 'package:market_app/modules/basket/data/repository/customer_basket_repo_impl.dart';
import 'package:meta/meta.dart';

part 'customer_basket_state.dart';

class CustomerBasketCubit extends Cubit<CustomerBasketStates> {
  CustomerBasketCubit() : super(CustomerBasketInitial());

  CustomerBasketRepo customerBasketRepo = CustomerBasketRepo();
  BasketModel? basketModel;
  List<BasketProducts> basketProducts = [];
  List<String> productsIds = [];

// Get basket produts
  Future<void> getbasketProducts() async {
    emit(GetBasketProductsLoadingState());

    // clear list before filling it again
    basketProducts.clear();
    productsIds.clear();
    // The request result
    var result = await customerBasketRepo.getCustomerBasketProducts();

    result.fold((left) {
      basketModel = BasketModel.fromJson(left.data);
      for (var e in basketModel!.basketProducts!) {
        basketProducts.add(e);
        productsIds.add(e.branchProduct!.product!.id!);
      }
      emit(GetBasketProductsSuccessState());
    }, (right) => emit(GetBasketProductsErrorState(right.errorMessage)));
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
