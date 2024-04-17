import 'package:equatable/equatable.dart';
import 'package:market_app/modules/address/customer_address/data/models/address_model.dart';
import 'package:market_app/modules/basket/data/models/basket_model.dart';
import 'order_status_model.dart';
import 'payment_method_model.dart';

class OrderModel extends Equatable {
  final String id;
  final String createdAt;
  final PaymentMethodModel? paymentMethodModel;
  final OrderStatusModel? orderStatusModel;
  final BasketModel? basketModel;
  final AddressModel? addressModel;

  const OrderModel({
    required this.id,
    required this.createdAt,
    required this.orderStatusModel,
    required this.paymentMethodModel,
    required this.basketModel,
    required this.addressModel,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      createdAt: json['createdAt'],
      orderStatusModel: json['orderStatus'] != null
          ? OrderStatusModel.fromJson(json['orderStatus'])
          : null,
      paymentMethodModel: json['paymentMethod'] != null
          ? PaymentMethodModel.fromJson(json['paymentMethod'])
          : null,
      basketModel:
          json['basket'] != null ? BasketModel.fromJson(json['basket']) : null,
      addressModel: json['address'] != null
          ? AddressModel.fromJson(json['address'])
          : null,
    );
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        paymentMethodModel,
        orderStatusModel,
        basketModel,
        addressModel
      ];
}
