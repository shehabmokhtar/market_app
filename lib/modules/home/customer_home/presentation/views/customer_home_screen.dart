import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/categories/categories_list.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/customer_home_app_bar.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/banners/banners_list.dart';

class CustomerHomeScreen extends StatelessWidget {
  const CustomerHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
}
