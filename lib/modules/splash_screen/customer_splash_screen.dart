import 'package:flutter/material.dart';
import 'package:market_app/core/Widgets/loading_progress_indicator.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/styles/colors.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/model_view/banners_cubit/banners_cubit.dart';
import 'package:market_app/modules/layout/customer_layout/presentation/views/customer_layout.dart';
import 'package:market_app/modules/profile/customer_profile/presentation/model_view/cubit/user_cubit.dart';
import '../../core/services/service_locator.dart';

class CustomerSplashScreen extends StatelessWidget {
  const CustomerSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        // The future functions
        sl<AddressesCubit>().getCustomerAddresses(),
        sl<BannersCubit>().getBanners(),
        sl<UserCubit>().getUserData(),
      ]),
      builder: (context, snapshot) {
        // if it's waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SplashScreenWidget();
        }
        return const CustomerLayout();
      },
    );
  }
}

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: const LoadingProgressIndicator(),
      ),
    );
  }
}
