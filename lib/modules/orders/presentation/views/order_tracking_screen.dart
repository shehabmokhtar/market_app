import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/constants/image_constants.dart';
import 'package:market_app/modules/orders/presentation/views/widgets/cancel_order_button.dart';
import 'package:market_app/modules/orders/presentation/views/widgets/order_movements_widget.dart';
import '../../../../core/Widgets/loading_circle.dart';
import '../../../../core/styles/colors.dart';
import '../model_views/order_details_cubit.dart/order_details_cubit.dart';
import '../model_views/order_details_cubit.dart/order_details_states.dart';
import 'widgets/order_container_widget.dart';

import 'widgets/payment_summary_widget.dart';

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});
  static const String routeName = '/order-tracking-screen';

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final orderId = ModalRoute.of(context)?.settings.arguments as String;
    context.read<OrderDetailsCubit>().getOrderDetails(orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Tracking'),
      ),
      body: BlocBuilder<OrderDetailsCubit, OrderDetailsStates>(
        builder: (context, state) {
          if (state is OrderDetailsLoadingState) {
            return LoadingCircle();
          } else if (state is OrderDetailsSuccessState) {
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const CancelOrderButton(),
                const SizedBox(height: 20),
                // lottie file
                // TODO will be changed with the tracking part
                OrderContainerWidget(
                  widget: Image.asset(
                    ImageConstants.preparing,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(height: 20),
                // Address Part
                OrderContainerWidget(
                  title: 'Address',
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColors.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Text('${state.order.addressModel?.fullAddress}'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Payment Summary
                OrderContainerWidget(
                  title: 'Payment Summary',
                  widget: PaymentSummaryWidget(order: state.order),
                ),
                const SizedBox(height: 20),
                OrderContainerWidget(
                  title: 'Order Movements',
                  widget: OrderMovementsWidget(
                    orderEvents: state.order.orderEvents,
                  ),
                ),
              ],
            );
          } else {
            String errorMessage = state is OrderDetailsFailureState
                ? state.errorMessage
                : 'error';
            return Center(
              child: Text(errorMessage),
            );
          }
        },
      ),
    );
  }

  bool showCancelButton(String status) {
    final statusText = status.toLowerCase();

    if (statusText == 'sent' || statusText == 'accepted') {
      return true;
    }

    return false;
  }
}
