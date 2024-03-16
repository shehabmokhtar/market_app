import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:market_app/core/functions/get_list_from_json.dart';
import 'package:market_app/core/services/failures.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/modules/home/customer_home/data/models/banner_model.dart';
import 'package:market_app/modules/home/customer_home/data/repository/banners_repo/banners_impl.dart';
part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit() : super(BannersInitial());

  // get banners
  void getBanners() async {
    emit(GetBannersLoadingState());
    // get banners from banners repo
    final result = await serviceLocator<BannersRepo>().getBanners();
    result.fold(
        // in the state of success
        (left) => emit(GetBannersSuccessState(
            banners: getListFromJson(
                data: left.data, fromJson: (e) => BannerModel.fromJson(e)))),
        // in the state of failure
        (right) => emit(GetBannersErrorState(serverFailure: right)));
  }
}
