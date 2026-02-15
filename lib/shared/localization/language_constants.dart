// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String ARABIC = 'ar';
const String DEFULT = 'df';
const String? NULL = null;

Locale? locale(String? languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return const Locale(ENGLISH, 'US');
    case ARABIC:
      return const Locale(ARABIC, "SA");
    case DEFULT:
      return null;
    case NULL:
      return const Locale(ENGLISH, 'US');
    default:
      return const Locale(ENGLISH, 'US');
  }
}
