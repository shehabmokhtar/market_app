import 'package:flutter/material.dart';
import 'package:market_app/core/functions/get_location.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/basket/presentation/model_view/customer_basket_cubit/basket_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/model_view/banners_cubit/banners_cubit.dart';
import 'package:market_app/modules/layout/customer_layout/presentation/views/customer_layout.dart';
import 'package:market_app/modules/profile/customer_profile/presentation/model_view/cubit/user_cubit.dart';
import 'package:market_app/modules/splash_screen/widgets/splash_screen_widget.dart';
import '../../core/services/service_locator.dart';

class CustomerSplashScreen extends StatelessWidget {
  const CustomerSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        // The future functions
        userLocation(context),
        sl<AddressesCubit>().getCustomerAddresses(),
        sl<BannersCubit>().getBanners(),
        sl<UserCubit>().getUserData(),
        sl<BasketCubit>().getbasketProducts(),
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
