import 'package:dartz/dartz.dart';
import 'package:market_app/core/error/http_failure.dart';
import 'package:market_app/core/services/http_service_interface.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';
import 'package:market_app/modules/orders/data/models/order_model.dart';
import 'package:market_app/modules/orders/data/models/order_status_model.dart';
import 'package:market_app/modules/orders/data/repos/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final HttpServiceInterface _httpServiceInterface;
  const OrderRepoImpl(this._httpServiceInterface);

  @override
  Future<Either<HttpFailure, List<OrderModel>?>> getOrdersList(
      String query) async {
    return await _httpServiceInterface.get(
      url: Endpoints.orderEndpoint,
      query: query,
      fromJson: (decodedJson) => List<OrderModel>.from(
        decodedJson.map((e) => OrderModel.fromJson(e)),
      ),
    );
  }

  @override
  Future<Either<HttpFailure, OrderModel?>> getOrderDetails(
      String orderId) async {
    return await _httpServiceInterface.get(
      url: '${Endpoints.orderEndpoint}/$orderId',
      fromJson: (decodedJson) => OrderModel.fromJson(decodedJson),
    );
  }

  @override
  Future<Either<HttpFailure, OrderStatusModel?>> cancelOrder(
      String orderId) async {
    return await _httpServiceInterface.patch(
      url: '${Endpoints.orderEndpoint}/cancel-order/$orderId',
      fromJson: (decodedJson) => OrderStatusModel.fromJson(decodedJson),
    );
  }
}
