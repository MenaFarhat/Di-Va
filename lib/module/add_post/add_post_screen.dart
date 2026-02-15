// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:diva/layout/my_profile_layout/cubit/my_profile_layout_cubit.dart';
import 'package:diva/models/interstes/interests_model.dart';
import 'package:diva/module/add_post/cubit/add_post_cubit.dart';
import 'package:diva/module/intersts/components/item_Interest.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/constants.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddPostScreen extends StatelessWidget {
  static String routeName = "/AddPostScreen";
  File? image;
  AddPostScreen({super.key, 
    this.image,
  });
  var postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPostCubit(),
      child: BlocConsumer<AddPostCubit, AddPostStates>(
        listener: (context, state) {
          if (state is AddPostCreatPostSuccessStates) {
            Navigator.pop(context);
            Navigator.pop(context);
          }
          if (state is AddPostCreatPostErrorStates) {
            showToast(text: state.error, state: ToastState.ERROR);
          }
        },
        builder: (context, state) {
          AddPostCubit cubit = AddPostCubit.get(context);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 1,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
                title: const Text(
                  'Add Post',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (cubit.selectedForAPI.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          validatorSnackBarInterests(
                            state: ToastState.ERROR,
                            text: 'At least one interest must be selected',
                          ),
                        );
                      } else {
                        cubit.creatPost(
                          image: image,
                          content: postController.text,
                          interestid: cubit.selectedForAPI,
                        );
                      }
                    },
                    child: const Text(
                      "NEXT",
                      style: TextStyle(
                        color: defaultColor,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            MyProfileLayoutCubit.get(context)
                                        .myProfileData!
                                        .myInfo!
                                        .personal!
                                        .photo !=
                                    null
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      "$HOST/$USERIMAGE/${MyProfileLayoutCubit.get(context).myProfileData!.myInfo!.personal!.photo}",
                                    ),
                                  )
                                : const CircleAvatar(
                                    backgroundImage: AssetImage(
                                      USERIMAGENULL,
                                    ),
                                  ),
                            SizedBox(width: getProportionateScreenWidth(10)),
                            Text(
                              MyProfileLayoutCubit.get(context)
                                  .myProfileData!
                                  .myInfo!
                                  .personal!
                                  .name!,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(15)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(18)),
                          child: TextFormField(
                            controller: postController,
                            decoration: const InputDecoration.collapsed(
                              hintText: "Enter your Description",
                            ),
                            maxLines: null,
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(5)),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            image!,
                            width: double.infinity,
                            height: getProportionateScreenHeight(295),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // SizedBox(height: getProportionateScreenHeight(5)),
                        Padding(
                          padding: EdgeInsetsDirectional.only(
                              start: getProportionateScreenWidth(18)),
                          child: Row(
                            children: [
                              Wrap(
                                children: cubit.selected.isNotEmpty
                                    ? List.generate(
                                        cubit.selected.length,
                                        (index) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                right:
                                                    getProportionateScreenWidth(
                                                        10)),
                                            child: Text(
                                              "#${interestsName[cubit.selected[index]]}",
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: defaultColor,
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : [
                                        const Text(
                                          "#Interest",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: defaultColor,
                                          ),
                                        ),
                                      ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {
                                  cubit.changeShowInterste();
                                },
                                icon: Icon(
                                  cubit.iconshowInterste,
                                  size: 35,
                                  color: defaultColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(5),
                        ),
                        cubit.showInterste
                            ? SizedBox(
                                height: getProportionateScreenHeight(165),
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(width: 5),
                                  itemCount: interestsName.length,
                                  itemBuilder: (context, index) {
                                    // if (index == 0) return SizedBox();
                                    return buildInterestItem(
                                      index: index,
                                      interestsName: interestsName[index],
                                      interestsImage: interestsImage[index],
                                      selected: cubit.selected,
                                      ontap: () {
                                        if (cubit.selected.length < 4) {
                                          cubit.changeInterstsSelected(index);
                                        } else if (cubit.selected.length >= 4 &&
                                            cubit.selected.contains(index)) {
                                          cubit.changeInterstsSelected(index);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            validatorSnackBarInterests(
                                              state: ToastState.ERROR,
                                              text:
                                                  'You cannot choose more than two interests',
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
