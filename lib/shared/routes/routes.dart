
import 'package:diva/layout/home_layout/home_layout.dart';
import 'package:diva/layout/my_profile_layout/my_profile_layout.dart';
import 'package:diva/module/add_photo/add_photo_register_screen.dart';
import 'package:diva/module/add_post/add_post_screen.dart';
import 'package:diva/module/add_post/gallery_add_post_screen.dart';
import 'package:diva/module/forgot_password/reset_password_screen.dart';
import 'package:diva/module/home_post/home_post_screen.dart';
import 'package:diva/module/intersts/interests_screen.dart';
import 'package:diva/module/login/login_screen.dart';
import 'package:diva/module/register/register_screen.dart.dart';
import 'package:diva/module/welcom/welcom_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  WelcomScreen.routeName: (context) => const WelcomScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  AddPhotoRegisterScreen.routeName: (context) => AddPhotoRegisterScreen(),
  InterestsScreen.routeName: (context) => const InterestsScreen(),

  MyProfileLayout.routeName: (context) => const MyProfileLayout(),
  GalleryAddPostScreen.routeName: (context) => GalleryAddPostScreen(),
  AddPostScreen.routeName: (context) => AddPostScreen(),
  // ShowPostScreen.routeName: (context) => ShowPostScreen(),
  // FollowersScreen.routeName: (context) => FollowersScreen(),

  // !
  HomePostScreen.routeName: (context) => const HomePostScreen(),
  ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),

  HomeLayout.routeName: (context) => const HomeLayout(),
};
