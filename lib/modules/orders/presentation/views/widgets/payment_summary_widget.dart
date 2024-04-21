import 'package:flutter/material.dart';
import 'package:market_app/modules/orders/presentation/views/widgets/Payment_summary_item_widget.dart';

import '../../../data/models/order_model.dart';

class PaymentSummaryWidget extends StatelessWidget {
  const PaymentSummaryWidget({
    super.key,
    required this.order,
  });

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PaymentSummaryItemWidget(
          title: 'Sub Total',
          value: order.totalPrice.toString(),
        ),
        const SizedBox(height: 10),
        PaymentSummaryItemWidget(
          title: 'Delivery Fees',
          value: order.deliveryFees.toString(),
        ),
        const SizedBox(height: 10),
        const Divider(),
        const SizedBox(height: 10),
        PaymentSummaryItemWidget(
          title: 'Total',
          value: "${order.totalPrice + order.deliveryFees}",
        ),
      ],
    );
  }
}
