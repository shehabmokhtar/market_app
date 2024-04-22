import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/services/navigator_observer.dart';
import 'package:market_app/core/utils/dialog_manager_overlay.dart';
import 'package:market_app/modules/orders/presentation/model_views/order_cubit.dart';
import 'package:market_app/modules/orders/presentation/views/orders_history_screen.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../home/customer_home/presentation/model_view/active_order/current_active_orders_cubit.dart';
import '../../model_views/cancel_order/cancel_order_cubit.dart';
import '../../model_views/cancel_order/cancel_order_states.dart';
import 'cancel_modal_sheet_widget.dart';

class CancelOrderButton extends StatelessWidget {
  const CancelOrderButton({super.key, required this.orderId});

  final String orderId;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocListener<CancelOrderCubit, CancelOrderStates>(
          listener: (ctx, state) async {
            if (state is CancelOrderLoadingState) {
              DialogManagerOverlay.showDialogWithMessage(context);
            } else if (state is CancelOrderFailureState) {
              showToast(state.errorMessage);
              DialogManagerOverlay.closeDialog();
            } else if (state is CancelOrderSuccessState) {
              // if we orders screen exist in the stack update it also
              if (MyRouteObserver.containsPage(OrdersScreen.routeName)) {
                context
                    .read<OrderCubit>()
                    .updateStatus(orderId, state.orderStatus);
              }
              // call active orders again
              await context.read<CurrentActiveOrderCubit>().getActiveOrders();
              DialogManagerOverlay.closeDialog();
              if (context.mounted) {
                Navigator.pop(context);
              }
            }
          },
          child: TextButton(
            onPressed: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                context: context,
                builder: (ctx) => Container(
                  padding: const EdgeInsets.all(10),
                  child: BlocProvider.value(
                      value: context.read<CancelOrderCubit>(),
                      child: CancelModalSheetWidget(orderId: orderId)),
                ),
              );
            },
            child: const Text(
              'Cancel Order',
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
