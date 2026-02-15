// ignore_for_file: avoid_print, use_build_context_synchronously, must_be_immutable

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:diva/module/camera/asset_thumbnail.dart';
import 'package:diva/module/camera/camera_screen.dart';
import 'package:diva/module/camera/components/components.dart';
import 'package:diva/module/camera/cubit/image_cubit.dart';
import 'package:diva/module/intersts/interests_screen.dart';
import 'package:diva/module/register/cubit/register_cubit.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AddPhotoRegisterScreen extends StatelessWidget {
  static String routeName = "/addPhotoRegisterScreen";
  File? image;
  AddPhotoRegisterScreen({super.key, this.image});
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
                    BlocProvider(
                      create: (context) => RegisterCubit(),
                      child: BlocConsumer<RegisterCubit, RegisterStates>(
                        listener: (context, state) {
                          if (state is RegisterAddPhotoErrorState) {
                            showToast(
                              text: state.error,
                              state: ToastState.ERROR,
                            );
                          } else if (state is RegisterAddPhotoSuccessState) {
                            navigateTo(context, const InterestsScreen());
                          }
                        },
                        builder: (context, state) {
                          RegisterCubit registercubit =
                              RegisterCubit.get(context);
                          return defaultSliverAppBarTopToGallery(
                            cubit: cubitImage,
                            context: context,
                            title: 'Add Profile Picture',
                            onPressedTextButton: () {
                              registercubit.userRegisterAddPhoto(
                                image: cubitImage.currentImage!,
                              );
                            },
                          );
                        },
                      ),
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
                                    'assets/images/profile.png',
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
                                tikePictureNavigator: 'addphoto',
                              ));
                        }).catchError((e) {
                          print(e.toString());
                        });
                      },
                      cubit: cubitImage,
                      widgit: BlocProvider(
                        create: (context) => RegisterCubit(),
                        child: BlocConsumer<RegisterCubit, RegisterStates>(
                          listener: (context, state) {
                            if (state is RegisterAddPhotoErrorState) {
                              showToast(
                                text: state.error,
                                state: ToastState.ERROR,
                              );
                            } else if (state is RegisterAddPhotoSuccessState) {
                              navigateTo(context, const InterestsScreen());
                            }
                          },
                          builder: (context, state) {
                            RegisterCubit.get(context);
                            return TextButton(
                              child: const Text('Skip'),
                              onPressed: () async {
                                navigateTo(context, const InterestsScreen());
                              },
                            );
                          },
                        ),
                      ),
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
                      // &&
                      // state is! ImageGetCurrentImageSucssesState
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
