import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/custom_app_bar.dart';

class PaymentMethodsScreen extends StatelessWidget {
  static const String routeName = 'payment_methods_screen';
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: 'Payment Methods'),
      body: ListView(
        children: const [],
      ),
    );
  }
}
