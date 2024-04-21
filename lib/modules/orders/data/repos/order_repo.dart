import 'package:dartz/dartz.dart';
import 'package:market_app/core/error/http_failure.dart';
import 'package:market_app/modules/orders/data/models/order_model.dart';

abstract class OrderRepo {
  Future<Either<HttpFailure, List<OrderModel>?>> getOrdersList(String query);
  Future<Either<HttpFailure, OrderModel?>> getOrderDetails(String orderId);
}
