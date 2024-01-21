import 'package:flutter/material.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Center(child: Text('Driver Home Screen')),
          ElevatedButton(
              onPressed: () {
                sl<AuthanticationCubit>().logout(context);
              },
              child: const Text('Logout')),
        ],
      ),
    );
  }
}
