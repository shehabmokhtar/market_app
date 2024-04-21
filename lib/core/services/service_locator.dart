import 'package:get_it/get_it.dart';
import 'package:market_app/core/services/http_service.dart';
import 'package:market_app/core/services/http_service_interface.dart';
import 'package:market_app/modules/address/customer_address/data/repository/add_address_repo/add_address_repo_imp.dart';
import 'package:market_app/modules/address/customer_address/data/repository/addresses_repo/address_repo_imp.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/add_address_cubit/add_address_cubit.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';
import 'package:market_app/modules/branch/presentation/model_view/branch_cubit/branch_cubit.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/model_view/favorites_cubit/favorites_cubit.dart';
import 'package:market_app/modules/home/customer_home/data/repository/banners_repo/banners_impl.dart';
import 'package:market_app/modules/home/customer_home/presentation/model_view/banners_cubit/banners_cubit.dart';
import 'package:market_app/modules/categories_and_products/presentation/model_view/categories_cubit/categories_cubit.dart';
import 'package:market_app/modules/orders/data/repos/order_repo.dart';
import 'package:market_app/modules/orders/data/repos/order_repo_impl.dart';
import 'package:market_app/modules/profile/customer_profile/data/repository/user_repo/user_repo_impl.dart';
import 'package:market_app/modules/profile/customer_profile/presentation/model_view/cubit/user_cubit.dart';
import '../../modules/basket/presentation/model_view/customer_basket_cubit/basket_cubit.dart';

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
    sl.registerSingleton<UserRepo>(UserRepo());
    sl.registerSingleton<UserCubit>(UserCubit());
    sl.registerSingleton<CategoriesCubit>(CategoriesCubit());
    sl.registerSingleton<FavoritesCubit>(FavoritesCubit());
    sl.registerSingleton<BranchCubit>(BranchCubit());
    //sl.registerSingleton<CustomerBasketCubit>(CustomerBasketCubit());

    sl.registerLazySingleton<HttpServiceInterface>(() => HttpService());
    sl.registerLazySingleton<OrderRepo>(() => OrderRepoImpl(sl()));
    sl.registerSingleton<BasketCubit>(BasketCubit());
  }
}
