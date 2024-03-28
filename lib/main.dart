import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:market_app/core/services/applocal.dart';
import 'package:market_app/core/services/bloc_observer.dart';
import 'package:market_app/core/services/chache_helper.dart';
import 'package:market_app/core/services/newwork/dio_helper.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/themes.dart';
import 'package:market_app/modules/address/customer_address/presentation/model_view/addresses_cubit/addresses_cubit.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/sign_in_screen.dart';
import 'package:market_app/modules/branch/presentation/model_view/branch_cubit/branch_cubit.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/all_categories_and_sub_categories_and_products_screen.dart';
import 'package:market_app/modules/categories_and_products/presentation/views/customer_product_screen.dart';
import 'package:market_app/modules/favorites/customer_favorites/presentation/model_view/favorites_cubit/favorites_cubit.dart';
import 'package:market_app/modules/home/customer_home/presentation/model_view/banners_cubit/banners_cubit.dart';
import 'package:market_app/modules/categories_and_products/presentation/model_view/categories_cubit/categories_cubit.dart';
import 'package:market_app/modules/profile/customer_profile/presentation/model_view/cubit/user_cubit.dart';
import 'package:market_app/modules/profile/customer_profile/presentation/views/customer_profile_screen.dart';
import 'package:market_app/modules/splash_screen/customer_splash_screen.dart';
import 'modules/address/customer_address/presentation/model_view/add_address_cubit/add_address_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.intial();
  await DioHelper.intial();
  ServiceLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AuthanticationCubit>()),
        BlocProvider(create: (context) => sl<BannersCubit>()),
        BlocProvider(create: (context) => sl<AddAddressCubit>()),
        BlocProvider(create: (context) => sl<AddressesCubit>()),
        BlocProvider(create: (context) => sl<UserCubit>()),
        BlocProvider(create: (context) => sl<CategoriesCubit>()),
        BlocProvider(create: (context) => sl<FavoritesCubit>()),
        BlocProvider(create: (context) => sl<BranchCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        // Check is the platform is web the authantication page will be visable for the Manager/Admin, Otherwise the customer
        // layout will be visable.
        home: kIsWeb ? SingInScreen() : const CustomerSplashScreen(),
        // home: const CustomerProductScreen(),
        //The language of the app
        locale: const Locale("en", ""),
        localizationsDelegates: const [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        //The supported languages
        supportedLocales: const [
          Locale("en", ""),
          Locale("ar", ""),
        ],
        localeResolutionCallback: (currentLang, supportLang) {
          if (currentLang != null) {
            for (Locale locale in supportLang) {
              if (locale.countryCode == currentLang.countryCode) {
                return currentLang;
              }
            }
          }
          return supportLang.first;
        },
      ),
    );
  }
}
