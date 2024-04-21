import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app/core/Widgets/custom_text_form_filed.dart';
import 'package:market_app/core/Widgets/loading_progress_indicator.dart';
import 'package:market_app/core/Widgets/my_main_button.dart';
import 'package:market_app/core/services/global_variables.dart';
import 'package:market_app/core/services/service_locator.dart';
import 'package:market_app/core/styles/responsive.dart';
import 'package:market_app/core/services/utils.dart';
import 'package:market_app/modules/authantication/presentation/model_view/authantication_cubit/authantication_cubit.dart';
import 'package:market_app/modules/authantication/presentation/views/sign_in/widgets/forget_password_button.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/authantication_image.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/authantication_text.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/or_shape.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/authantication_text_2.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/ssign_in_with_google.dart';
import 'package:market_app/modules/authantication/presentation/views/sing_up/sign_up_screen.dart';
import 'package:market_app/modules/authantication/presentation/views/widgets/text_and_button.dart';

class SingInScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthanticationCubit, AuthanticationStates>(
          listener: (context, state) {
            if (state is SignInSuccessState) {
              sl<AuthanticationCubit>().saveTokenAndNavigateTo(
                context: context,
                userToken: state.signInModel.token,
                role: state.signInModel.role,
              );
              // Show toast message
              AppUtilities.toastMessage(
                context: context,
                msg: 'Welcome to the app',
                messageType: MessageType.success,
              );
              sl<AuthanticationCubit>().configFCM();
            } else if (state is SignInErrorState) {
              AppUtilities.toastMessage(
                context: context,
                msg: '${state.serverFailure.errorMessage}',
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
                              AuthanticationImage(
                                  imagePath: 'assets/images/sign_in.png'),
                              AuthanticationText(text: 'Login'),
                              AuthanticationText2(
                                  text: 'Please sig in to continue'),
                            ],
                          ),
                          // A responsive design for tablet
                          tablet: const Row(
                            children: [
                              Expanded(
                                child: AuthanticationImage(
                                    imagePath: 'assets/images/sign_in.png'),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    AuthanticationText(text: 'Login'),
                                    AuthanticationText2(
                                        text: 'Please sig in to continue'),
                                  ],
                                ),
                              )
                            ],
                          ),
                          // A responsive design for desktop
                          desktop: Row(children: [
                            const Expanded(
                              child: AuthanticationImage(
                                  imagePath: 'assets/images/sign_in.png'),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const AuthanticationText(text: 'Login'),
                                const AuthanticationText2(
                                    text: 'Please sig in to continue'),
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
                if (state is SignUpLoadingState)
                  const LoadingProgressIndicator(),
              ],
            );
          },
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
            isPassword: true,
            validationMessage: 'Password Must Not Be Empty',
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
                // Sign in
                sl<AuthanticationCubit>().signIn(
                  email: emailController.text,
                  password: passwordController.text,
                );
              }
            },
            title: 'Sign in',
          ),
          // Forget password buttton
          const ForgetPasswordButton(),
          // The or shape
          const OrShape(),
          // Sign in with google button
          const SignInWithGoogle(),
          // Don't have an account sign in button
          TextAndButton(
            text: 'Don\'t have an account?',
            onPressed: () {
              AppUtilities.navigateToNewPage(
                context: context,
                newPage: SignUpScreen(),
              );
            },
            buttonText: 'Sign up',
          )
        ],
      ),
    );
  }
}
