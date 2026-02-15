// ignore_for_file: avoid_print, use_build_context_synchronously, must_be_immutable

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:diva/module/add_post/add_post_screen.dart';
import 'package:diva/module/camera/asset_thumbnail.dart';
import 'package:diva/module/camera/camera_screen.dart';
import 'package:diva/module/camera/components/components.dart';
import 'package:diva/module/camera/cubit/image_cubit.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class GalleryAddPostScreen extends StatelessWidget {
  static String routeName = "/GalleryAddPostScreen";
  File? image;
  GalleryAddPostScreen({super.key, this.image});
  GlobalKey keyForBack = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageCubit()..getAlbums(image: image),
      child: BlocConsumer<ImageCubit, ImageStates>(
        listener: (context, state) {
          ImageCubit().get(context);
          // if (state is ImageGetCurrentImageSucssesState) {
          //   cubit.changeIsPhoto(true);
          //   print(ImageCubit().get(context).isphoto);
          // }
          // if (state is ImageGetCurrentImageInitialState) {
          //   cubit.changeIsPhoto(false);
          //   print(ImageCubit().get(context).isphoto);
          // }
        },
        builder: (context, state) {
          ImageCubit cubit = ImageCubit().get(context);
          return SafeArea(
            child: Scaffold(
              body: NestedScrollView(
                floatHeaderSlivers: true,
                physics: const NeverScrollableScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    defaultSliverAppBarTopToGallery(
                      cubit: cubit,
                      context: context,
                      title: 'Add Post',
                      onPressedTextButton: () {
                        navigateTo(
                          context,
                          AddPostScreen(
                            image: cubit.currentImage,
                          ),
                        );
                      },
                    ),
                    defaultSliverAppBarCenterToGallery(
                      keyForBack: keyForBack,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: state is! ImageGetCurrentImageSucssesState
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : cubit.currentImage != null
                                ? Image.file(
                                    cubit.currentImage!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: getProportionateScreenHeight(295),
                                  )
                                : SizedBox(
                                    width: double.infinity,
                                    height: getProportionateScreenHeight(295),
                                    child: const Center(
                                      child: Text(
                                          'Oops There are no pictures in this Album'),
                                    ),
                                  ),
                      ),
                    ),
                    defaultSliverAppBarEndToGallery(
                      cubit: cubit,
                      onPressedIconButton: () {
                        availableCameras().then((value) {
                          navigateTo(
                            context,
                            CameraScreen(
                              cameras: value,
                              tikePictureNavigator: 'addpost',
                            ),
                          );
                        }).catchError((e) {
                          print(e.toString());
                        });
                      },
                      onChangedDropdownButton: (String? value) {
                        if (state is ImageGetCurrentImageSucssesState) {
                          cubit.getdropdownValue(value);
                        }
                      },
                    ),
                  ];
                },
                body: Center(
                  child: state is! ImageGetCurrentImageSucssesState
                      ? const CircularProgressIndicator()
                      : cubit.imageFromAlbum!.isEmpty
                          ? const SizedBox(
                              width: 329,
                              height: 295,
                              child: Center(
                                child: Text(
                                  'Oops There are no pictures in this Album',
                                ),
                              ),
                            )
                          : GridView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 1,
                                mainAxisSpacing: 1,
                              ),
                              itemCount: cubit.imageFromAlbum!.length,
                              itemBuilder: (context, index) {
                                print(cubit.imageFromAlbum!.length);
                                return AssetThumbnail(
                                  asset: cubit.imageFromAlbum![index],
                                  keyForBack: keyForBack,
                                  cubit: cubit,
                                );
                              },
                            ),
                ),
              ),

              // body:
            ),
          );
        },
      ),
    );
  }
}
