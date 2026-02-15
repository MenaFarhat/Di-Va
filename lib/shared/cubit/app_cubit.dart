// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:diva/models/Language.dart';
import 'package:diva/shared/network/local/cache_helper.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../localization/language_constants.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  bool? isDark;
  IconData iconTheme = Icons.light_mode_outlined;
  void changeAppMode({bool? isMode}) {
    if (isMode != null) {
      isDark = isMode;
      CacheHelper.saveData(key: ISDARK, value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    } else {
      isDark = !isDark!;
      CacheHelper.saveData(key: ISDARK, value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
    if (isDark!) {
      iconTheme = Icons.dark_mode_outlined;
    } else {
      iconTheme = Icons.light_mode_outlined;
    }
  }

  static AppCubit get(context) => BlocProvider.of(context);

  Locale? localLang = locale(CacheHelper.getData(key: LAGUAGE_CODE));

  void changeLanguage(Language language) async {
    CacheHelper.saveData(key: LAGUAGE_CODE, value: language.languageCode)
        .then((value) {
      Locale? _locale = locale(language.languageCode);
      localLang = _locale;
      emit(AppChangeLocalState());
    }).catchError((onError) {});
  }
}
