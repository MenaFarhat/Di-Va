// ignore_for_file: deprecated_member_use, constant_identifier_names

import 'package:flutter/material.dart';

const String ISDARK = 'ISDARK';

extension ColorToMaterialColor on Color {
  static List<int> palettes = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
  MaterialColor toMaterialByOpacity() {
    Map<int, Color> colors = palettes.asMap().map((index, palette) =>
        MapEntry(palette, withOpacity((index + 1) / 10)));
    return MaterialColor(value, colors);
  }
}

const defaultColor =
//  Color(0xFF243B67);

    Color.fromRGBO(26, 35, 126, 1); //Color(0xFF5464FF);;
const Color textColor = Color(0xff7c7d7e);
const Color customNavigationBarColor = Colors.white;
const Color welcomColor = Colors.black;
const Color mycolor3 = Color(0xFF5464FF);
const Color formFieldColor = Color(0xfff2f2f2);
const Color hintFieldColor = Color(0xffb6b7b7);
const Color defaultSecondColor = Color.fromRGBO(33, 45, 164, 3);
