// ignore_for_file: avoid_print

import 'package:diva/models/error_model%20.dart';
import 'package:diva/models/home_post/home_post_model.dart';
import 'package:diva/models/user_model.dart';
import 'package:diva/shared/network/local/cache_helper.dart';
import 'package:diva/shared/network/local/end_point.dart';
import 'package:diva/shared/network/remote/dio_helper.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  var token = CacheHelper.getData(key: TOKEN);

  List<HomeModel>? interestSearch = [];
  void getSearchIntest({
    required int interstId,
  }) {
    emit(SearshinterestLoading());
    DioHelper.getData(
      url: "$SERSHINTEST/$interstId",
      token: token,
    ).then((response) {
      if (response.statusCode == 200) {
        interestSearch = [];
        if (response.data!.isNotEmpty) {
          response.data.forEach((element) {
            interestSearch!.add(HomeModel.fromJson(element['original']));
          });
        }

        emit(SearshinterestSucsses());
      } else if (response.statusCode! >= 500) {
        print(response.data);
        emit(SearshinterestError("Error on server"));
      } else {
        print(response.data);
        emit(SearshinterestError(ErrorModel.fromJson(response.data).message!));
      }
    }).catchError((e) {
      emit(SearshinterestError(e.toString()));

      print(e);
    });
  }

  List<UserModel> userSearch = [];
  void getSearchUser({
    required String user,
  }) {
    emit(SearshUserLoading());
    DioHelper.getData(
      url: "$SERSHUSER/$user",
      token: token,
    ).then((response) {
      if (response.statusCode == 200) {
        userSearch = [];
        if (response.data!.isNotEmpty) {
          response.data.forEach((element) {
            userSearch.add(UserModel.fromJson(element));
          });
        }
        emit(SearshUserSucsses());
      } else if (response.statusCode! >= 500) {
        print(response.data);
        emit(SearshUserError("Error on server"));
      } else {
        print(response.data);
        emit(SearshUserError(ErrorModel.fromJson(response.data).message!));
      }
    }).catchError((e) {
      emit(SearshUserError(e.toString()));

      print(e);
    });
  }
}
