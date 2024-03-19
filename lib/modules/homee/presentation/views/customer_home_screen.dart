import 'package:flutter/material.dart';
import 'package:market_app/core/constants/variables.dart';
import 'package:market_app/core/functions/get_location.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/sizes.dart';
import 'package:market_app/modules/authantication/data/repository/authantication.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Customer Home Screen')),
          SizedBox(
            height: AppSizes.screenWidth(context) / 10,
          ),
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
