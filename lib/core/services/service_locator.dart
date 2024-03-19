import 'package:get_it/get_it.dart';
import 'package:market_app/modules/address/customer_address/data/repository/add_address_repo/add_address_repo_imp.dart';
import 'package:market_app/modules/address/customer_address/data/repository/addresses_repo/address_repo_imp.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/add_address_cubit/add_address_cubit.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';
import 'package:market_app/modules/home/customer_home/data/repository/banners_repo/banners_impl.dart';
import 'package:market_app/modules/home/customer_home/presentation/model_view/cubit/banners_cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerSingleton<AuthanticationCubit>(AuthanticationCubit());
    sl.registerSingleton<BannersRepo>(BannersRepo());
    sl.registerSingleton<BannersCubit>(BannersCubit());
    sl.registerSingleton<AddAddressCubit>(AddAddressCubit());
    sl.registerSingleton<AddAddressRepo>(AddAddressRepo());
    sl.registerSingleton<AddressesRepo>(AddressesRepo());
    sl.registerSingleton<AddressesCubit>(AddressesCubit());
  }
}
