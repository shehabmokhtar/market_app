import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/modules/home/customer_home/presentation/model_view/active_order/current_active_orders_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/model_view/active_order/current_active_orders_states.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/active_order/active_order_list_item_widget.dart';

import '../../../../../../../core/styles/colors.dart';
import '../../../../../../../core/styles/sizes.dart';

class ActiveOrderListWidget extends StatelessWidget {
  const ActiveOrderListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentActiveOrderCubit, CurrentActiveOrdersStates>(
      builder: (ctx, state) {
        if (state is CurrentActiveOrderSuccessState &&
            state.orders.isNotEmpty) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 20),
              Text(
                'Active Orders',
                style: AppSizes.regularTextStyle(context).copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 17),
              ...List.generate(
                state.orders.length,
                (index) =>
                    ActiveOrderListItemWidget(orderModel: state.orders[index]),
              ),
            ]),
          );
        }
        return const SizedBox();
      },
    );
  }
}
