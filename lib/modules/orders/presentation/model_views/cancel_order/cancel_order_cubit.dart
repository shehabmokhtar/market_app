import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/modules/orders/data/repos/order_repo.dart';
import 'package:market_app/modules/orders/presentation/model_views/cancel_order/cancel_order_states.dart';

class CancelOrderCubit extends Cubit<CancelOrderStates> {
  CancelOrderCubit(this._orderRepo) : super(CancelOrderInitialState());
  final OrderRepo _orderRepo;
  Future cancelOrder(String orderId) async {
    emit(CancelOrderLoadingState());

    final result = await _orderRepo.cancelOrder(orderId);

    result.fold(
      (l) => emit(CancelOrderFailureState(l.message)),
      (r) => emit(CancelOrderSuccessState(r!)),
    );
  }
}
