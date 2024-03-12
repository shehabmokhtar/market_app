import 'package:get_it/get_it.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';
import 'package:market_app/modules/home/customer_home/data/repository/banners_repo/banners_impl.dart';
import 'package:market_app/modules/home/customer_home/presentation/model_view/cubit/banners_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerSingleton<AuthanticationCubit>(AuthanticationCubit());
    sl.registerSingleton<BannersRepo>(BannersRepo());
    sl.registerSingleton<BannersCubit>(BannersCubit());
  }
}
