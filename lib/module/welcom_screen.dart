import 'package:diva/module/login/login_screen.dart';
import 'package:diva/module/register/register_screen.dart.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import '../shared/components/components.dart';

class WelcomScreen extends StatelessWidget {
  static String routeName = "/welcom";

  const WelcomScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (SizeConfig.orientation == Orientation.landscape) {
      return s();
    } else {
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
                const Text(
                  'Di-Va',
                  style: TextStyle(
                    letterSpacing: 1.7,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
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
                      color: Color(0xFF7c7d7e),
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
}

Widget s() {
  return SafeArea(
    child: Scaffold(
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/1.png',
              height: getProportionateScreenHeight(409),
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: getProportionateScreenHeight(5),
            ),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  const Text(
                    'Di-Va',
                    style: TextStyle(
                      letterSpacing: 1.7,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Color(0xFF21115c),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  const Text(
                    'social media application',
                    style: TextStyle(
                      color: Color(0xFF4a4b4d),
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
                        color: Color(0xFF7c7d7e),
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
                      function: () {},
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
                      function: () {},
                    ),
                  ),
                ],
              ),
            )
            // Column(
            //   children: [
            //     Text(
            //       'Di-Va',
            //       style: TextStyle(
            //         letterSpacing: 1.7,
            //         fontWeight: FontWeight.bold,
            //         fontSize: 50,
            //         color: Color(0xFF21115c),
            //       ),
            //     ),
            //     SizedBox(
            //       height: getProportionateScreenHeight(16),
            //     ),
            //     Text(
            //       'social media application',
            //       style: TextStyle(
            //         color: Color(0xFF4a4b4d),
            //         fontSize: 10,
            //         letterSpacing: 2.36,
            //       ),
            //     ),
            //     SizedBox(
            //       height: getProportionateScreenHeight(28),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.only(
            //         right: getProportionateScreenWidth(52),
            //         left: getProportionateScreenWidth(52),
            //         bottom: getProportionateScreenHeight(19),
            //       ),
            //       child: Text(
            //         'Allows the user to post and interact with other people within the application',
            //         maxLines: 2,
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           height: 1.5,
            //           color: Color(0xFF7c7d7e),
            //           fontSize: 13,
            //           letterSpacing: 0.9,
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       height: getProportionateScreenHeight(10),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.symmetric(
            //           horizontal: getProportionateScreenWidth(35.0)),
            //       child: defaultButton(
            //         text: 'Login',
            //         fontWeight: FontWeight.w600,
            //         function: () {},
            //       ),
            //     ),
            //     SizedBox(
            //       height: getProportionateScreenHeight(20),
            //     ),
            //     Padding(
            //       padding: EdgeInsetsDirectional.only(
            //         start: getProportionateScreenWidth(34),
            //         end: getProportionateScreenWidth(34),
            //         bottom: getProportionateScreenHeight(43),
            //       ),
            //       child: defaultButton(
            //         text: 'Create an Account',
            //         backgroundcolor: Colors.white,
            //         textcolor: mycolor1,
            //         function: () {},
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    ),
  );
}
