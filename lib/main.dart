import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:market_app/core/applocal.dart';
import 'package:market_app/core/services/bloc_observer.dart';
import 'package:market_app/core/services/chache_helper.dart';
import 'package:market_app/core/services/newwork/dio_helper.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/themes.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/sign_in_screen.dart';

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
        BlocProvider(
          create: (context) => sl<AuthanticationCubit>(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        home: SingInScreen(),
        // home: CreateNewPasswordScreen(
        //   userId: '',
        //   otp: 'd',
        // ),
        // home: OtpVerificationScreen(
        //     isVerifyOtpWhileRegisteration: true,
        //     userId: 'df',
        //     newPassword: 'df'),
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
