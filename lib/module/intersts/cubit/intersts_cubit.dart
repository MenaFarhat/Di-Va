// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:diva/models/error_model%20.dart';
import 'package:diva/shared/network/local/cache_helper.dart';
import 'package:diva/shared/network/local/end_point.dart';
import 'package:diva/shared/network/remote/dio_helper.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'intersts_state.dart';

class InterstsCubit extends Cubit<InterstsStates> {
  InterstsCubit() : super(InterstsInitialState());

  static InterstsCubit get(context) => BlocProvider.of(context);
  List<int> selected = [];
  List<int> selectedForAPI = [];

  void getintest({required List<int> interest}) {
    selected = [];
    selectedForAPI = [];
    for (var element in interest) {
      selected.add(element - 1);
      selectedForAPI.add(element);
    }
  }

  void UpdateInterst({
    required List<int> intersts,
  }) async {
    emit(UpdateInsterstsLoadingState());

    FormData formData = FormData.fromMap({
      "interest_id": intersts
          .toString()
          .replaceFirst("[", '')
          .replaceAll(']', '')
          .replaceAll(' ', '')
          .toString(),
    });

    final token = CacheHelper.getData(key: TOKEN);
    DioHelper.postData(
      url: UPDATEINTERST,
      token: token,
      data: formData,
    ).then((response) {
      if (response.statusCode == 200) {
        emit(UpdateInsterstsSucssesState());
      } else if (response.statusCode! >= 500) {
        print(response.data);
        emit(UpdateInsterstsErrorState("Error on server"));
      } else {
        emit(UpdateInsterstsErrorState(
            ErrorModel.fromJson(response.data).message!));
      }
    }).catchError((error) {
      print(error);
    });
  }

  void changeInterstsSelected(int interestsid) {
    if (selected.contains(interestsid)) {
      selected.remove(interestsid);
      selectedForAPI.remove(interestsid + 1);
    } else {
      selected.add(interestsid);
      selectedForAPI.add(interestsid + 1);
    }

    emit(ChangeInterstsSelectedState());
  }

  void userRegisterAddIntersts({
    required List<int> intersts,
  }) async {
    emit(RegisterAddInsterstsLoadingState());

    FormData formData = FormData.fromMap({
      "interest_id": intersts
          .toString()
          .replaceFirst("[", '')
          .replaceAll(']', '')
          .replaceAll(' ', '')
          .toString(),
    });

    final token = CacheHelper.getData(key: TOKEN);
    DioHelper.postData(
      url: MAKEfOLLOWPAGE,
      token: token,
      data: formData,
    ).then((response) {
      if (response.statusCode == 200) {
        emit(RegisterAddInsterstsSucssesState());
      } else if (response.statusCode! >= 500) {
        print(response.data);
        emit(RegisterAddInsterstsErrorState("Error on server"));
      } else {
        emit(RegisterAddInsterstsErrorState(
            ErrorModel.fromJson(response.data).message!));
      }
    }).catchError((error) {
      print(error);
    });
  }
}
