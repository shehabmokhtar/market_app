import 'package:equatable/equatable.dart';
import '../../../address/customer_address/data/models/address_model.dart';
import '../../../basket/data/models/basket_model.dart';
import 'order_events.dart';
import 'order_status_model.dart';
import 'payment_method_model.dart';

class OrderModel extends Equatable {
  final String id;
  final int orderId;
  final double totalPrice;
  final double deliveryFees;
  final String createdAt;
  final PaymentMethodModel? paymentMethodModel;
  final OrderStatusModel? orderStatusModel;
  final BasketModel? basketModel;
  final AddressModel? addressModel;
  final List<OrderEvent> orderEvents;
  final bool? loadCurrentActiveOrders;

  const OrderModel({
    required this.id,
    required this.orderId,
    required this.totalPrice,
    required this.deliveryFees,
    required this.createdAt,
    required this.orderStatusModel,
    required this.paymentMethodModel,
    required this.basketModel,
    required this.addressModel,
    required this.orderEvents,
    this.loadCurrentActiveOrders,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      orderId: json['orderId'],
      totalPrice: double.tryParse(json['totalPrice'].toString()) ?? 0.0,
      deliveryFees: double.tryParse(json['deliveryFees'].toString()) ?? 0.0,
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
      orderEvents: json['orderEvents'] != null
          ? List<OrderEvent>.from(
              json['orderEvents'].map(
                (e) => OrderEvent.fromJson(e),
              ),
            )
          : [],
      loadCurrentActiveOrders: json['loadCurrentActiveOrders'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        orderId,
        totalPrice,
        deliveryFees,
        createdAt,
        paymentMethodModel,
        orderStatusModel,
        basketModel,
        addressModel,
        loadCurrentActiveOrders,
      ];
}
