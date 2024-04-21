import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/Widgets/outline_button_widget.dart';
import '../../../../../core/styles/colors.dart';
import '../../model_views/cancel_order/cancel_order_cubit.dart';

class CancelModalSheetWidget extends StatelessWidget {
  const CancelModalSheetWidget({
    super.key,
    required this.orderId,
  });

  final String orderId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Are you sure you want to cancel the order?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlineButtonWidget(
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                  context.read<CancelOrderCubit>().cancelOrder(orderId);
                },
                title: 'Cancel',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlineButtonWidget(
                color: AppColors.primaryColor,
                onPressed: () {
                  Navigator.pop(context);
                },
                title: 'Keep',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
