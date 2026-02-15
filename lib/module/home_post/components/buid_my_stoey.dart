// ignore_for_file: avoid_print, use_build_context_synchronously, camel_case_types

import 'package:camera/camera.dart';
import 'package:diva/layout/my_profile_layout/cubit/my_profile_layout_cubit.dart';
import 'package:diva/module/add_story/gallery/gallery_add_story_screen.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/constants.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

class buidMyStoey extends StatelessWidget {
  const buidMyStoey({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(72),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              PhotoManager.requestPermissionExtend().then((permitted) {
                if (!permitted.isAuth) return;

                availableCameras().then((value) {
                  navigateTo(
                    context,
                    GalleryAddStoryScreen(cameras: value),
                  );
                }).catchError((e) {
                  print(e.toString());
                });
              }).catchError((e) {});
            },
            child: Stack(
              fit: StackFit.loose,
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: getProportionateScreenWidth(60),
                  height: getProportionateScreenWidth(60),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      begin: Alignment(0.5, 0),
                      end: Alignment(0.5, 1),
                      colors: [
                        defaultColor,
                        defaultSecondColor,
                      ],
                    ),
                    border: Border.all(
                      color: Colors.transparent,
                      width: 3,
                    ),
                  ),
                  child:
                      BlocBuilder<MyProfileLayoutCubit, MyProfileLayoutStates>(
                    builder: (context, state) {
                      MyProfileLayoutCubit cubit =
                          MyProfileLayoutCubit.get(context);
                      return cubit.myProfileData == null
                          ? const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: CircularProgressIndicator(),
                            )
                          : cubit.myProfileData!.myInfo!.personal!.photo != null
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "$HOST/$USERIMAGE/${cubit.myProfileData!.myInfo!.personal!.photo}",
                                  ),
                                  radius: 5,
                                )
                              : const CircleAvatar(
                                  backgroundImage: AssetImage(
                                    USERIMAGENULL,
                                  ),
                                  radius: 5,
                                );
                    },
                  ),
                ),
                Positioned(
                  bottom: getProportionateScreenHeight(-7),
                  child: Container(
                    width: getProportionateScreenWidth(22),
                    height: getProportionateScreenHeight(22),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment(0.5, 0),
                        end: Alignment(0.5, 1),
                        colors: [
                          defaultColor,
                          defaultSecondColor,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: getProportionateScreenHeight(15),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          const Text(
            'add Story',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xff787c81),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget buidMyStoey() => SizedBox(
//       width: 72,
//       child: Column(
//         children: [
//           InkWell(
//             onTap: () {},
//             child: Stack(
//               clipBehavior: Clip.none,
//               alignment: Alignment.bottomCenter,
//               children: [
//                 Container(
//                   width: 75,
//                   height: 75,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                       begin: Alignment(0.5, 0),
//                       end: Alignment(0.5, 1),
//                       colors: [
//                         const Color(0xff21115c),
//                         const Color(0xff8564ff),
//                       ],
//                     ),
//                     border: Border.all(
//                       color: Colors.transparent,
//                       width: 3,
//                     ),
//                   ),
//                   child: CircleAvatar(
//                     backgroundImage: AssetImage(
//                       'assets/images/interests/animal.jpg',
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: -4,
//                   child: Container(
//                     width: 23,
//                     height: 23,
//                     alignment: Alignment.topCenter,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: Colors.white,
//                         width: 2,
//                       ),
//                       gradient: LinearGradient(
//                         begin: Alignment(0.5, 0),
//                         end: Alignment(0.5, 1),
//                         colors: [
//                           const Color(0xff21115c),
//                           const Color(0xff8564ff),
//                         ],
//                       ),
//                     ),
//                     child: Icon(
//                       Icons.add,
//                       size: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 5.0,
//           ),
//           Text(
//             'Your Story',
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(
//               color: Color(0xff787c81),
//               fontSize: 13,
//             ),
//           ),
//         ],
//       ),
//     );
