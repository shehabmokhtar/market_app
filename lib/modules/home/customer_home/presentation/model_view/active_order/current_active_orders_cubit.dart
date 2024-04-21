import 'package:flutter_bloc/flutter_bloc.dart';
import 'current_active_orders_states.dart';

import '../../../data/repository/current_active_orders/current_active_orders_repo.dart';

class CurrentActiveOrderCubit extends Cubit<CurrentActiveOrdersStates> {
  CurrentActiveOrderCubit(this._currentOrdersRepo)
      : super(CurrentActiveOrderInitialState());

  final CurrentActiveOrdersRepo _currentOrdersRepo;

  Future getActiveOrders() async {
    final result = await _currentOrdersRepo.getCurrentActiveOrders();

    result.fold(
      (l) => emit(CurrentActiveOrderFailureState(l.message)),
      (r) => emit(CurrentActiveOrderSuccessState(r!)),
    );
  }
}
