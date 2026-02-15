// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:diva/layout/app_layout/app_layout.dart';
import 'package:diva/module/forgot_password/reset_password_screen.dart';
import 'package:diva/module/login/cubit/login_cubit.dart';
import 'package:diva/module/register/register_screen.dart.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/local/cache_helper.dart';
import 'package:diva/shared/network/local/end_point.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/login";
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  FocusNode? pinPasswordFocusNode = FocusNode();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(
              state: ToastState.ERROR,
              text: state.error,
            );
          }
          if (state is LoginSuccessState) {
            CacheHelper.saveData(key: TOKEN, value: state.user.token)
                .then((value) {
              CacheHelper.saveData(key: USERID, value: state.user.user!.id)
                  .then((value) {
                navigateAndFinish(context, const AppLayout());
              }).catchError((error) {
                showToast(
                  state: ToastState.WORNING,
                  text: error.message,
                );
              });
            }).catchError((error) {
              showToast(
                state: ToastState.WORNING,
                text: error.message,
              );
            });
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(55),
                    ),
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(40),
                          ),
                          const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          const Text(
                            "Add your details to login",
                            style: TextStyle(
                              fontSize: 16,
                              color: textColor,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(35),
                          ),
                          defaultFormField(
                            controller: emailController,
                            onSubmit: (value) {
                              nextField(pinPasswordFocusNode);
                            },
                            type: TextInputType.emailAddress,
                            label: 'Email Address',
                            hintText: "Enter your Email",
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'pless enter your Email address';
                              }
                              if (!value.contains('@')) {
                                return 'It must contain the @';
                              }
                              if (!value.contains('.')) {
                                return 'It must contain the .';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(28),
                          ),
                          defaultFormField(
                            focusnode: pinPasswordFocusNode,
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            label: 'Password',
                            hintText: "Enter your Password",
                            suffix: cubit.suffix,
                            isbasswors: cubit.isPassword,
                            suffixPressed: () {
                              cubit.changePasswordVisibility();
                            },
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'pless enter your password';
                              }
                              if (value.length < 8) {
                                return 'It mustIt must contain at least 8 characters';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(28),
                          ),
                          defaultButton(
                            text: "Login",
                            function: () {
                              // if (formkey.currentState!.validate()) {
                              cubit.userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                                fcm: CacheHelper.getData(key: FCM),
                              );
                              // }
                            },
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(23),
                          ),
                          if (state is LoginLoadingState)
                            const CircularProgressIndicator(),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                ResetPasswordScreen.routeName,
                              );
                            },
                            child: const Text(
                              "Forgot your Password?",
                              style: TextStyle(
                                fontSize: 16,
                                color: textColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(22),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Don't have an Account?",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: textColor,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, RegisterScreen.routeName);
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: defaultColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(106)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(375),
                    height: getProportionateScreenHeight(230),
                    child: const Image(
                      image: AssetImage("assets/images/login.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
