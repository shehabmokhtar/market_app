import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/modules/orders/presentation/model_views/order_cubit.dart';
import 'package:market_app/modules/orders/presentation/model_views/order_details_cubit.dart/order_details_cubit.dart';
import 'package:market_app/modules/orders/presentation/views/order_tracking_screen.dart';
import 'package:market_app/modules/orders/presentation/views/orders_history_screen.dart';
import 'package:market_app/modules/payment/presentation/views/payments_methods_screen.dart';
import '../../modules/splash_screen/widgets/splash_screen_widget.dart';
import '../services/service_locator.dart';

Route<dynamic> generateRouter(RouteSettings settings) {
  switch (settings.name) {
    case OrdersScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => BlocProvider(
            create: (ctx) => OrderCubit(sl()), child: const OrdersScreen()),
        settings: settings,
      );
    case PaymentMethodsScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => const PaymentMethodsScreen(),
        settings: settings,
      );
    case OrderTrackingScreen.routeName:
      return MaterialPageRoute(
        builder: (ctx) => BlocProvider(
            create: (ctx) => OrderDetailsCubit(sl()),
            child: const OrderTrackingScreen()),
        settings: settings,
      );
    // TODO change it to not found page
    default:
      return MaterialPageRoute(
        builder: (ctx) => const SplashScreenWidget(),
        settings: settings,
      );
  }
}
