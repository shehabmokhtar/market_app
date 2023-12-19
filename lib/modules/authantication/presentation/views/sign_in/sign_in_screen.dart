import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/my_main_button.dart';
import 'package:market_app/core/styles/responsive.dart';
import 'package:market_app/core/utils.dart';
import 'package:market_app/core/widgets/my_text_form_filed.dart';
import 'package:market_app/modules/authantication/data/repository/authantication.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/widgets/forget_password.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/widgets/login_image.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/widgets/login_text.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/widgets/or_shape.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/widgets/please_sign_in_text.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/widgets/ssign_in_with_google.dart';
import 'package:market_app/modules/authantication/presentation/views/sing_up/sign_up_screen.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/text_and_button.dart';
import 'package:market_app/modules/home/presentation/views/customer_home_screen.dart';
import 'package:market_app/modules/home/presentation/views/driver_home_screen.dart';

// ignore: must_be_immutable
class SingInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => AuthanticationCubit(),
          child: BlocConsumer<AuthanticationCubit, AuthanticationState>(
            listener: (context, state) {
              if (state is AuthanticationSignInSuccessState) {
                Widget homeScreen;

                switch (state.signInModel.role) {
                  case 'Customer':
                    homeScreen = const CustomerHomeScreen();
                    break;
                  case 'Driver':
                    homeScreen = const DriverHomeScreen();
                    break;
                  default:
                    homeScreen = const CustomerHomeScreen();
                }

                AppUtilities.navigateToNewPage(
                  context: context,
                  newPage: homeScreen,
                );
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 20,
                      ),
                      child: ListView(
                        children: [
                          Responsive(
                            // A responsive design for mobile
                            mobile: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                loginImage(context),
                                loginText(context),
                                pleaseSignInText(context),
                              ],
                            ),
                            // A responsive design for tablet
                            tablet: Row(
                              children: [
                                Expanded(child: loginImage(context)),
                                Expanded(
                                  child: Column(
                                    children: [
                                      loginText(context),
                                      pleaseSignInText(context),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            // A responsive design for desktop
                            desktop: Row(children: [
                              Expanded(child: loginImage(context)),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  loginText(context),
                                  pleaseSignInText(context),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  loginelements(context),
                                ],
                              )),
                            ]),
                          ),
                          if (!Responsive.isDesktop(context))
                            const SizedBox(
                              height: 20,
                            ),
                          if (!Responsive.isDesktop(context))
                            loginelements(context)
                        ],
                      )),
                  if (state is AuthanticationSignInLoadingState)
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(
                          seconds: 1,
                        ),
                        color: Colors.black.withOpacity(.3),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Column loginelements(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyTextFormFiled(
          controller: emailController,
          textInputType: TextInputType.emailAddress,
          prefixIcon: Icons.email_outlined,
          hintText: 'Email Address',
        ),
        MyTextFormFiled(
          controller: passwordController,
          prefixIcon: Icons.lock_outline,
          hintText: 'Password',
          isPassword: true,
        ),
        const SizedBox(
          height: 20,
        ),
        MyMainButton(
          context: context,
          onTap: () async {
            AppUtilities.vibration();
            AuthanticationCubit authanticationCubit = AuthanticationCubit();
            // authanticationCubit.signIn(
            //     email: emailController.text,
            //     password: passwordController.text);
            authanticationCubit.signIn(
                email: 'shehabmokhtar1401@gmail.com', password: 'a1234567890');
          },
          title: 'Sign in',
        ),
        forgetPasswordButton(context),
        orShape(context),
        signInWithGoogle(context),
        textAndButton(
          context: context,
          text: 'Don\'t have an account?',
          buttonText: 'Sign up',
          onPressed: () {
            AppUtilities.navigateToNewPage(
              context: context,
              newPage: const SignUpScreen(),
            );
          },
        )
      ],
    );
  }
}
