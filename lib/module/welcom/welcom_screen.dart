import 'package:diva/module/login/login_screen.dart';
import 'package:diva/module/register/register_screen.dart.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import '../../shared/components/components.dart';

class WelcomScreen extends StatelessWidget {
  static String routeName = "/welcom";

  const WelcomScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/images/home.png',
                height: getProportionateScreenHeight(409),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: getProportionateScreenHeight(4),
              ),
              Text(
                'Di-Va',
                style: TextStyle(
                  letterSpacing: 1.7,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.screentext * 50,
                  color: defaultColor,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(16),
              ),
              const Text(
                'social media application',
                style: TextStyle(
                  color: textColor,
                  fontSize: 10,
                  letterSpacing: 2.36,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(28),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: getProportionateScreenWidth(52),
                  left: getProportionateScreenWidth(52),
                  bottom: getProportionateScreenHeight(19),
                ),
                child: const Text(
                  'Allows the user to post and interact with other people within the application',
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 1.5,
                    color: textColor,
                    fontSize: 13,
                    letterSpacing: 0.9,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(35.0)),
                child: defaultButton(
                  text: 'Login',
                  fontWeight: FontWeight.w600,
                  function: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: getProportionateScreenWidth(34),
                  end: getProportionateScreenWidth(34),
                  bottom: getProportionateScreenHeight(43),
                ),
                child: defaultButton(
                  text: 'Create an Account',
                  backgroundcolor: Colors.white,
                  textcolor: defaultColor,
                  function: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
