// ignore_for_file: must_be_immutable

import 'package:diva/layout/app_layout/app_layout.dart';
import 'package:diva/layout/app_layout/cubit/app_layout_cubit.dart';
import 'package:diva/layout/my_profile_layout/cubit/my_profile_layout_cubit.dart';
import 'package:diva/models/register/list_model.dart';
import 'package:diva/models/user_data_model.dart';
import 'package:diva/module/edit_profile/components.dart';
import 'package:diva/module/edit_profile/edit_photo_screen.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/constants.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:diva/shared/styes/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EditProfileScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String? genderChoose;
  String? dayChoose;
  String? monthChoose;
  String? yearChoose;

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            AppLayoutCubit.get(context).changeBottomNav(3);
            navigateTo(context, const AppLayout());
          },
          color: Colors.black,
        ),
        title: const Text(
          'Edit profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: BlocConsumer<MyProfileLayoutCubit, MyProfileLayoutStates>(
            listener: (context, state) {},
            builder: (context, state) {
              MyProfileLayoutCubit cubit = MyProfileLayoutCubit.get(context);
              if (cubit.myProfileData == null) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                UserDataModel user = cubit.myProfileData!.myInfo!.personal!;
                nameController.text = user.name!;
                bioController.text = user.bio!;
                genderChoose = user.gender == 1 ? 'Female' : 'Male';
                dayChoose = user.birthday!.day.toString().length == 1
                    ? "0${user.birthday!.day.toString()}"
                    : user.birthday!.day.toString();
                monthChoose = user.birthday!.month.toString().length == 1
                    ? "0${user.birthday!.month.toString()}"
                    : user.birthday!.month.toString();
                yearChoose = user.birthday!.year.toString();

                return state is MyProfileEditprofileLoadingStates ||
                        state is MyProfileEditprofileLoadingStates
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  user.photo == null
                                      ? const CircleAvatar(
                                          radius: 90,
                                          backgroundImage: AssetImage(
                                            USERIMAGENULL,
                                          ),
                                        )
                                      : CircleAvatar(
                                          radius: 90,
                                          backgroundImage: NetworkImage(
                                            "$HOST/$USERIMAGE/${user.photo}",
                                          ),
                                        ),
                                  IconButton(
                                    onPressed: () {
                                      navigateTo(context, EditPhotoScreen());
                                    },
                                    icon: const CircleAvatar(
                                      // radius: 600.0,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        IconBroken.Camera,
                                        size: 29.0,
                                        color: defaultColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(30)),
                            const Text(
                              'Name',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                            defaultFormFeild(
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'pless enter your name';
                                }
                                return null;
                              },
                              controller: nameController,
                              label: 'UserName',
                              prefix: Icons.account_circle,
                            ),
                            SizedBox(height: getProportionateScreenHeight(30)),
                            const Text(
                              'Bio',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                            defaultFormFeild(
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'pless enter your Bio ';
                                }
                                return null;
                              },
                              controller: bioController,
                              label: 'Bio',
                              prefix: Icons.edit,
                              isMax: true,
                            ),
                            SizedBox(height: getProportionateScreenHeight(30)),
                            const Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                            defultProgileDropdownButton(
                              hint: 'Select Gender',
                              valueChoose: genderChoose,
                              isExpanded: true,
                              onChanged: (newvalue) {
                                genderChoose = newvalue.toString();
                              },
                              list: genderList,
                              validate: (value) {
                                if (value == null) {
                                  return 'pless enter your gender';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: getProportionateScreenHeight(30)),
                            const Text(
                              'Select Your Birthday',
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: defultProgileDropdownButton(
                                    hint: 'Day',
                                    valueChoose: dayChoose,
                                    onChanged: (newvalue) {
                                      dayChoose = newvalue.toString();
                                    },
                                    list: dayList,
                                    validate: (value) {
                                      if (value == null) {
                                        return 'pless enter your Day';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: defultProgileDropdownButton(
                                    hint: 'Month',
                                    valueChoose: monthChoose,
                                    onChanged: (newvalue) {
                                      monthChoose = newvalue.toString();
                                    },
                                    list: monthList,
                                    validate: (value) {
                                      if (value == null) {
                                        return 'pless enter your Month';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                const Spacer(),
                                Expanded(
                                  flex: 2,
                                  child: defultProgileDropdownButton(
                                    hint: 'Year',
                                    valueChoose: yearChoose,
                                    onChanged: (newvalue) {
                                      yearChoose = newvalue.toString();
                                    },
                                    list: yearList,
                                    validate: (value) {
                                      if (value == null) {
                                        return 'pless enter your Year';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: getProportionateScreenHeight(55)),
                            Center(
                              child: defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.editprofile(
                                      name: nameController.text,
                                      birthDay:
                                          "$yearChoose/$monthChoose/$dayChoose",
                                      gender: genderChoose == 'Male' ? 2 : 1,
                                      bio: bioController.text,
                                    );
                                  }
                                },
                                text: 'Save',
                                width: getProportionateScreenWidth(120),
                              ),
                            ),
                          ],
                        ),
                      );
              }
            },
          ),
        ),
      ),
    );
  }
}
