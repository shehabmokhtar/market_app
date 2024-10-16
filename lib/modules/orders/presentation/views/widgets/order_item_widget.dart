import 'package:flutter/material.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/core/utils/format_date.dart';
import 'package:market_app/modules/orders/data/models/order_model.dart';
import 'package:market_app/modules/orders/presentation/views/widgets/order_name_value_widget.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key, required this.order});
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.lightGray),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderNameValueWidget(
              text: 'Order Id', value: order.orderId.toString()),
          if (order.basketModel != null) const SizedBox(height: 10),
          if (order.basketModel != null)
            OrderNameValueWidget(
              text: 'Total Price',
              value: '${order.totalPrice}',
            ),
          const SizedBox(height: 10),
          OrderNameValueWidget(
            text: 'Order Statues',
            value: order.orderStatusModel!.enName!,
            textColor: getTextColor(order.orderStatusModel!.enName!),
          ),
          const SizedBox(height: 10),
          OrderNameValueWidget(
              text: 'Payment Method', value: order.paymentMethodModel!.enName!),
          const SizedBox(height: 10),
          OrderNameValueWidget(
              text: 'Created At', value: formatDateTime(order.createdAt)),
        ],
      ),
    );
  }

  Color getTextColor(String status) {
    final statusName = status.toLowerCase();

    if (statusName.startsWith('canceled')) {
      return Colors.red;
    } else if (statusName == "delivered") {
      return Colors.green;
    } else {
      return Colors.amber;
    }
  }
}
