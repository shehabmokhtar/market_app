import 'package:dartz/dartz.dart';
import 'package:market_app/core/error/http_failure.dart';
import 'package:market_app/core/services/http_service_interface.dart';
import 'package:market_app/core/services/newwork/endpoints.dart';

import 'package:market_app/modules/orders/data/models/order_model.dart';

import 'current_active_orders_repo.dart';

class CurrentActiveOrdersRepoImpl implements CurrentActiveOrdersRepo {
  final HttpServiceInterface _httpServiceInterface;

  CurrentActiveOrdersRepoImpl(this._httpServiceInterface);

  @override
  Future<Either<HttpFailure, List<OrderModel>?>>
      getCurrentActiveOrders() async {
    return await _httpServiceInterface.get(
        url: '${Endpoints.orderEndpoint}/active-orders',
        fromJson: (decodedJson) => List<OrderModel>.from(
            decodedJson.map((e) => OrderModel.fromJson(e))));
  }
}
