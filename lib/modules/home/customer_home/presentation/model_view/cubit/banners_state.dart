part of 'banners_cubit.dart';

sealed class BannersState {}

final class BannersInitial extends BannersState {}

final class GetBannersLoadingState extends BannersState {}

final class GetBannersSuccessState extends BannersState {
  final List<BannerModel> banners;
  GetBannersSuccessState({required this.banners});
}

final class GetBannersErrorState extends BannersState {
  final ServerFailure serverFailure;
  GetBannersErrorState({
    required this.serverFailure,
  });
}
