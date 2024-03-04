import 'package:flutter/material.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/customer_home_app_bar.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: const [
            CustomerHomeAppBar(),
          ],
        ),
      ),
    );
  }
}
