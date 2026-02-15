import 'package:diva/layout/home_layout/home_layout.dart';
import 'package:diva/layout/my_profile_layout/my_profile_layout.dart';
import 'package:diva/module/chat/chats_screen.dart';
import 'package:diva/module/notifications/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutStates> {
  AppLayoutCubit() : super(AppLayoutInitialState());

  static AppLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeLayout(),
    const NotificationsScreen(),
    const ChatsScreen(),
    const MyProfileLayout(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavStates());
  }
}
