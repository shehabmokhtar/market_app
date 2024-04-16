import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/services/chache_helper.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/categories/categories_list.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/customer_home_app_bar.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/banners/banners_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    getCachedData();
    return BlocConsumer<AddressesCubit, AddressesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: ListView(
            children: const [
              // The top home screen app bar
              CustomerHomeAppBar(),
              // The slider list
              BannersList(),
              // Categories
              CategoriesList()
            ],
          ),
        );
      },
    );
  }

// get the all data in cache
  Future<void> getCachedData() async {
    if (sl<AddressesCubit>().customerAddresses.isNotEmpty) {
      sl<AddressesCubit>().currentAddressId =
          await CacheHelper.getData(key: 'currentAddressId');
      sl<AddressesCubit>().currentSubDistrictId =
          await CacheHelper.getData(key: 'currentSubDistrictId');
      sl<AddressesCubit>().currentLatutude =
          await CacheHelper.getData(key: 'lat');
      sl<AddressesCubit>().currentLongtude =
          await CacheHelper.getData(key: 'lng');
      print('>>>>>>> ${sl<AddressesCubit>().currentAddressId}');
      print('>>>>>>> ${sl<AddressesCubit>().currentSubDistrictId}');
      print('>>>>>>> ${sl<AddressesCubit>().currentLatutude}');
      print('>>>>>>> ${sl<AddressesCubit>().currentLongtude}');
      print('DONE (Current address info from cache)');
    } else if (userCurrentLocation != null) {
      sl<AddressesCubit>().currentLatutude = userCurrentLocation!.latitude;
      sl<AddressesCubit>().currentLongtude = userCurrentLocation!.longitude;
      print('DONE (Current address info from userCurrentLocation variable)');
    } else {
      sl<AddressesCubit>().currentLatutude = 0;
      sl<AddressesCubit>().currentLongtude = 0;
      print('Error (Current address info)');
    }
  }
}
