// ignore_for_file: avoid_print, use_build_context_synchronously, must_be_immutable

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:diva/layout/my_profile_layout/cubit/my_profile_layout_cubit.dart';
import 'package:diva/module/camera/asset_thumbnail.dart';
import 'package:diva/module/camera/camera_screen.dart';
import 'package:diva/module/camera/components/components.dart';
import 'package:diva/module/camera/cubit/image_cubit.dart';
import 'package:diva/module/edit_profile/edit_profile_screen.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/constants.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class EditPhotoScreen extends StatelessWidget {
  File? image;
  EditPhotoScreen({super.key, this.image});
  GlobalKey keyForBack = GlobalKey();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => ImageCubit()..getAlbums(image: image),
      child: BlocConsumer<ImageCubit, ImageStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ImageCubit cubitImage = ImageCubit().get(context);
          return SafeArea(
            child: Scaffold(
              body: NestedScrollView(
                floatHeaderSlivers: true,
                physics: const NeverScrollableScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    BlocConsumer<MyProfileLayoutCubit, MyProfileLayoutStates>(
                      listener: (context, state) {
                        if (state is MyProfileEditPhotoprofileErrorStates) {
                          showToast(
                            text: state.error,
                            state: ToastState.ERROR,
                          );
                        } else if (state
                            is MyProfileEditPhotoprofileSucssesStates) {
                          navigateTo(context, EditProfileScreen());
                        }
                      },
                      builder: (context, state) {
                        MyProfileLayoutCubit cubit =
                            MyProfileLayoutCubit.get(context);
                        return defaultSliverAppBarTopToGallery(
                          next: 'Update',
                          cubit: cubitImage,
                          context: context,
                          title: 'Edit Profile Picture',
                          onPressedTextButton: () {
                            cubit.editPhotoProfile(
                              image: cubitImage.currentImage!,
                            );
                          },
                        );
                      },
                    ),
                    defaultSliverAppBarCenterToGallery(
                      keyForBack: keyForBack,
                      child: state is! ImageGetCurrentImageSucssesState
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : cubitImage.currentImage != null
                              ? CircleAvatar(
                                  radius: getProportionateScreenHeight(190),
                                  backgroundImage: FileImage(
                                    cubitImage.currentImage!,
                                  ),
                                )
                              : CircleAvatar(
                                  radius: getProportionateScreenHeight(190),
                                  backgroundImage: const AssetImage(
                                    USERIMAGENULL,
                                  ),
                                ),
                    ),
                    defaultSliverAppBarEndToGallery(
                      onPressedIconButton: () {
                        availableCameras().then((value) {
                          navigateTo(
                            context,
                            CameraScreen(
                              cameras: value,
                              tikePictureNavigator: 'updatephoto',
                            ),
                          );
                        }).catchError((e) {
                          print(e.toString());
                        });
                      },
                      cubit: cubitImage,
                      onChangedDropdownButton: (String? value) {
                        if (state is ImageGetCurrentImageSucssesState) {
                          cubitImage.getdropdownValue(value);
                        }
                      },
                    ),
                  ];
                },
                body: Center(
                  child: state is! ImageGetCurrentImageSucssesState
                      ? const CircularProgressIndicator()
                      : cubitImage.imageFromAlbum!.isEmpty
                          ? const Center(
                              child: Text(
                                'Oops There are no pictures in this Album',
                              ),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                              ),
                              itemCount: cubitImage.imageFromAlbum!.length,
                              itemBuilder: (context, index) {
                                return AssetThumbnail(
                                  asset: cubitImage.imageFromAlbum![index],
                                  keyForBack: keyForBack,
                                  cubit: cubitImage,
                                );
                              },
                            ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
