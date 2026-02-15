// ignore_for_file: avoid_print

import 'package:diva/models/error_model%20.dart';
import 'package:diva/models/profile_model.dart';
import 'package:diva/shared/network/local/cache_helper.dart';
import 'package:diva/shared/network/local/end_point.dart';
import 'package:diva/shared/network/remote/dio_helper.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  var token = CacheHelper.getData(key: TOKEN);

  int currentTabIndex = 0;
  void changeTabIndex(int index) {
    currentTabIndex = index;
    emit(ProfileChangeTabIndexStates());
  }

  ProfileModel? profileData;

  void getDataProfile({
    required int? userId,
  }) {
    emit(ProfileGetDataLoadingStates());
    DioHelper.getData(
      url: "$MYPROFILE/$userId",
      token: token,
    ).then((response) {
      if (response.statusCode == 200) {
        profileData = ProfileModel.fromJson(response.data);

        emit(ProfileGetDataSucssesStates());
      } else if (response.statusCode! >= 500) {
        emit(ProfileGetDataErrorStates("Error on server"));
      } else {
        emit(ProfileGetDataErrorStates(
            ErrorModel.fromJson(response.data).message!));
      }
    }).catchError((error) {
      print(error);
    });
  }

// !!!BLOCK
  void blockUser({
    required int? userId,
  }) {
    emit(ProfileBlockUserLoadingStates());
    DioHelper.postData(
      url: "$BLOCK/$userId",
      token: token,
    ).then((response) {
      print(response.data);
      if (response.statusCode == 200) {
        emit(ProfileBlockUserSucssesStates());
      } else if (response.statusCode! >= 500) {
        emit(ProfileBlockUserErrorStates("Error on server"));
      } else {
        emit(ProfileBlockUserErrorStates(
            ErrorModel.fromJson(response.data).message!));
      }
    }).catchError((e) {});
  }

// !!!Follow
  void followUser({
    required int? userId,
  }) {
    emit(ProfileFollowkUserLoadingStates());
    DioHelper.postData(
      url: "$FOLLOW/$userId",
      token: token,
    ).then((response) {
      if (response.statusCode == 200) {
        if (response.data.toString().contains('You unfollowed')) {
          profileData!.myInfo!.state = "UnFollow";
          emit(ProfileFollowkUserSucssesStates());
        } else {
          profileData!.myInfo!.state = "Follow";
          emit(ProfileFollowkUserSucssesStates());
        }
      } else if (response.statusCode! >= 500) {
        emit(ProfileFollowkUserErrorStates("Error on server"));
      } else {
        emit(ProfileFollowkUserErrorStates(
            ErrorModel.fromJson(response.data).message!));
      }
    }).catchError((e) {});
  }
}
