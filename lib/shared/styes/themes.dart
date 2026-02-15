import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: ColorToMaterialColor(defaultColor).toMaterialByOpacity(),
  scaffoldBackgroundColor: const Color(0XFF333739),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      // statusBarColor: HexColor("#333739"),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    // backgroundColor: HexColor("#333739"),
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    // backgroundColor: HexColor("#333739"),
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    selectedItemColor: defaultColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  applyElevationOverlayColor: true,
  primarySwatch: ColorToMaterialColor(defaultColor).toMaterialByOpacity(),
  scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(
    color: defaultColor,
  ),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    surfaceTintColor: Colors.amber,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    selectedItemColor: defaultColor,
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);
