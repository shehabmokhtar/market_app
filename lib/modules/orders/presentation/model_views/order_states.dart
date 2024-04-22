import 'package:equatable/equatable.dart';
import 'package:market_app/modules/orders/data/models/order_model.dart';

abstract class OrderStates extends Equatable {
  const OrderStates();
  @override
  List<Object> get props => [];
}

class OrderInitialState extends OrderStates {}

class OrderLoadingState extends OrderStates {}

class OrderSuccessState extends OrderStates {
  final List<OrderModel> orders;

  const OrderSuccessState(this.orders);

  @override
  List<Object> get props => [orders];
}

class OrderFailureState extends OrderStates {
  final String errorMessage;

  const OrderFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

final class PostOrderLoadingState extends OrderStates {}

final class PostOrderSuccessState extends OrderStates {}

final class PostOrderErrorState extends OrderStates {
  final String errorMessage;
  const PostOrderErrorState(this.errorMessage);
}
