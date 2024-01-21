import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/back_arrow_button.dart';
import 'package:market_app/core/Widgets/custom_text_form_filed.dart';
import 'package:market_app/core/Widgets/loading_progress_indicator.dart';
import 'package:market_app/core/Widgets/my_main_button.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/responsive.dart';
import 'package:market_app/core/utils.dart';

import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';
import 'package:market_app/modules/authantication/presentation/views/otp_verification/otp_verification_screen.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/sign_in_screen.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/authantication_image.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/authantication_text.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/or_shape.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/authantication_text_2.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/ssign_in_with_google.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/text_and_button.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => sl<AuthanticationCubit>(),
          child: BlocConsumer<AuthanticationCubit, AuthanticationStates>(
            listener: (context, state) {
              if (state is SignUpSuccessState) {
                // Show toast message for successfull
                AppUtilities.toastMessage(
                  context: context,
                  msg: state.signUpModel.message!,
                  messageType: MessageType.success,
                );
                // Todo: Confirm email
                AppUtilities.navigateToNewPage(
                    context: context,
                    newPage: OtpVerificationScreen(
                      isVerifyOtpWhileRegisteration: true,
                      userId: state.signUpModel.userId!,
                      newPassword: passwordController.text,
                    ));
              } else if (state is SignUpErrorState) {
                // Show toast message for the error
                AppUtilities.toastMessage(
                  context: context,
                  msg: state.serverFailure.errorMessage,
                  messageType: MessageType.error,
                );
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                        horizontal: 15,
                      ),
                      child: Column(
                        children: [
                          Responsive(
                            // A responsive design for mobile
                            mobile: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    AuthanticationImage(
                                        imagePath: 'assets/images/sign_up.png'),
                                    // Back arrow button uses to navigate the previous screen
                                    BackArrowButton(),
                                  ],
                                ),
                                AuthanticationText(text: 'Register'),
                                AuthanticationText2(
                                    text: 'Please register to login'),
                              ],
                            ),
                            // A responsive design for tablet
                            tablet: const Row(
                              children: [
                                Expanded(
                                  child: AuthanticationImage(
                                      imagePath: 'assets/images/sign_up.png'),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      AuthanticationText(text: 'Register'),
                                      AuthanticationText2(
                                          text: 'Please register to login'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            // A responsive design for desktop
                            desktop: Row(children: [
                              const Expanded(
                                child: AuthanticationImage(
                                    imagePath: 'assets/images/sign_up.png'),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const AuthanticationText(text: 'Register'),
                                  const AuthanticationText2(
                                      text: 'Please register to login'),
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
                      ),
                    ),
                  ),
                  // Loading shape uses when the state is loading
                  if (state is SignUpLoadingState)
                    const LoadingProgressIndicator(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  loginelements(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextFormFiled(
            controller: fullNameController,
            textInputType: TextInputType.emailAddress,
            prefixIcon: Icons.person_outline,
            hintText: 'Full Name',
            validationMessage: 'Full Must Not Be Empty',
          ),
          CustomTextFormFiled(
            controller: emailController,
            textInputType: TextInputType.emailAddress,
            prefixIcon: Icons.email_outlined,
            hintText: 'Email Address',
            validationMessage: 'Email Address Must Not Be Empty',
          ),
          CustomTextFormFiled(
            controller: passwordController,
            prefixIcon: Icons.lock_outline,
            hintText: 'Password',
            validationMessage: 'Password Must Not Be Empty',
            isPassword: true,
          ),
          CustomTextFormFiled(
            controller: confirmPasswordController,
            prefixIcon: Icons.lock_outline,
            hintText: 'Confirm Password',
            validationMessage: 'Confirm Your Password',
            isPassword: true,
          ),
          const SizedBox(
            height: 20,
          ),
          MyMainButton(
            context: context,
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                // Vibration
                AppUtilities.vibration();
                // Sign up
                if (passwordController.text == confirmPasswordController.text) {
                  sl<AuthanticationCubit>().signUp(
                    fullName: fullNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                } else {
                  AppUtilities.toastMessage(
                    context: context,
                    msg:
                        'Password and confirm password are not the same, Be sure the both are the same',
                    messageType: MessageType.error,
                  );
                }
              }
            },
            title: 'Sign up',
          ),
          // or shape
          const OrShape(),
          // Sign in with google
          const SignInWithGoogle(),
          // Already have an account button
          TextAndButton(
            text: 'Already have an account?',
            onPressed: () {
              AppUtilities.navigateToNewPage(
                context: context,
                newPage: SingInScreen(),
              );
            },
            buttonText: 'Sign in',
          ),
        ],
      ),
    );
  }
}
