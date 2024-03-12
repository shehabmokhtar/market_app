import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/modules/home/customer_home/presentation/model_view/cubit/banners_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/banners/banners_list_items.dart';
import 'package:market_app/modules/home/customer_home/presentation/views/widgets/banners/loading_banners.dart';

class BannersList extends StatelessWidget {
  const BannersList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannersCubit, BannersState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetBannersSuccessState) {
          if (state.banners.isEmpty) {
            return const CustomBannersList(isLoading: false);
          }
          return BannersListItems(banners: state.banners);
        }
        if (state is GetBannersLoadingState) {
          return const CustomBannersList();
        }
        return const CustomBannersList(isLoading: false);
      },
    );
  }
}
