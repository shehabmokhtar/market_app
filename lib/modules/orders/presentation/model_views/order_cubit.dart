import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/modules/orders/data/models/order_model.dart';
import 'package:market_app/modules/orders/data/repos/order_repo.dart';
import 'package:market_app/modules/orders/presentation/model_views/order_states.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit(this._orderRepo) : super(OrderInitialState());
  final OrderRepo _orderRepo;

  bool isLoading = false;
  bool hasMore = true;
  int currentPage = 1;
  List<OrderModel> orders = [];

  Future<void> getOrders([bool shouldRerun = true]) async {
    if (isLoading || !hasMore) {
      return;
    }

    isLoading = true;
    if (shouldRerun) {
      emit(OrderLoadingState());
    }

    final result = await _orderRepo.getOrdersList('page=$currentPage');
    isLoading = false;

    result.fold(
      (l) => emit(OrderFailureState(l.message)),
      (r) {
        if (r!.isNotEmpty) {
          orders = List<OrderModel>.from(orders)..addAll(r);
          currentPage++;

          if (r.length < 10) {
            hasMore = false;
          }

          emit(OrderSuccessState(orders));
        } else {
          hasMore = false;
          emit(const OrderSuccessState([]));
        }
      },
    );
  }
}
