import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model_views/order_cubit.dart';
import '../model_views/order_states.dart';
import 'widgets/order_item_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});
  static const String routeName = '/orders-history';

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final controller = ScrollController();
  @override
  void initState() {
    super.initState();
    // first fetching
    context.read<OrderCubit>().getOrders();

    // fetching when reaching to the end of the screen
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        context.read<OrderCubit>().getOrders(false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
      ),
      body: BlocBuilder<OrderCubit, OrderStates>(
        builder: (ctx, state) {
          if (state is OrderLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is OrderSuccessState) {
            if (state.orders.isEmpty) {
              return const Center(
                child: Text('You Don\'t Have Any Orders'),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemBuilder: (ctx, index) {
                if (index < state.orders.length) {
                  final order = state.orders[index];

                  return OrderItemWidget(
                    order: order,
                  );
                } else {
                  return context.read<OrderCubit>().hasMore
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const SizedBox();
                }
              },
              itemCount: state.orders.length + 1,
            );
          } else {
            final String message;
            if (state is OrderFailureState) {
              message = state.errorMessage;
            } else {
              message = "error";
            }

            return Center(
              child: Text(message),
            );
          }
        },
      ),
    );
  }
}
