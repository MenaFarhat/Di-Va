// ignore_for_file: deprecated_member_use, non_constant_identifier_names

import 'package:diva/layout/my_profile_layout/components/image_profile.dart';
import 'package:diva/layout/profile/cubit/profile_cubit.dart';
import 'package:diva/models/profile_model.dart';
import 'package:diva/module/edit_profile/edit_profile_screen.dart';
import 'package:diva/module/follow/cubit/follow_cubit.dart';
import 'package:diva/module/follow/followers_screen.dart';
import 'package:diva/module/follow/following_scareen.dart';
import 'package:diva/module/promote/promote_screen.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/constants.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/local/cache_helper.dart';
import 'package:diva/shared/network/local/end_point.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/ion.dart';

Widget PartTopProfile({
  required ScrollController scrollController,
  int? userId,
  required ProfileModel data,
  isMe = true,
  required BuildContext context,
}) {
  GlobalKey keyForpost = GlobalKey();
  var myUserId = CacheHelper.getData(key: USERID);
  return Container(
    key: keyForpost,
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Color(0x29000000),
          offset: Offset(0, 5),
          blurRadius: 30,
          spreadRadius: 0,
        )
      ],
    ),
    padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(25)),
    child: Row(
      children: [
        Flexible(
          child: imageProfile(
            context: context,
            isNull: data.myInfo?.personal?.photo == null,
            image: data.myInfo?.personal?.photo != null
                ? '$HOST/$USERIMAGE/${data.myInfo?.personal?.photo!}'
                : USERIMAGENULL,
          ),
        ),
        Flexible(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(flex: 2),
                Text(
                  data.myInfo!.personal!.name!,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontSize: 28,
                  ),
                ),
                Text(
                  data.myInfo!.personal!.bio ?? 'HI thir',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black87,
                    fontStyle: FontStyle.italic,
                    // fontSize: 14,
                  ),
                ),
                const Spacer(flex: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        final keyContext = keyForpost.currentContext;
                        final box = keyContext!.findRenderObject() as RenderBox;
                        // final pos = box.localToGlobal(Offset.zero);
                        if (scrollController.hasClients) {
                          scrollController.animateTo(
                            box.size.height,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Text(
                            data.posts!.length.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            "Post",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        FollowCubit.get(context).getFollowers(userId: userId);
                        navigateTo(
                          context,
                          FollowersScreen(
                            userId: isMe ? myUserId : userId,
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Text(
                            data.myInfo!.followers.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            "Followers",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        FollowCubit.get(context).getFollowing(userId: userId);

                        navigateTo(
                          context,
                          FollowingScreen(
                            userId: isMe ? myUserId : userId,
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Text(
                            data.myInfo!.following.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            "Following",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(flex: 4),
                isMe
                    ? Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: defaultButton(
                              function: () {
                                navigateTo(context, EditProfileScreen());
                              },
                              text: 'Edit ',
                              isBorderColor: false,
                              radius: 20,
                              backgroundcolor: defaultColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(8)),
                          Flexible(
                            child: defaultButton(
                              function: () {
                                navigateTo(
                                  context,
                                  const PromoteScreen(),
                                );
                              },
                              // widget

                              isIcf: true, icf: Ion.speakerphone,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: defaultButton(
                              function: () {
                                ProfileCubit.get(context)
                                    .followUser(userId: userId);
                              },
                              text: data.myInfo!.state, // 'Folow',
                              isBorderColor: false,
                              radius: 20,
                              backgroundcolor: data.myInfo!.state == "Follow"
                                  ? defaultColor.withOpacity(0.3)
                                  : defaultColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(8)),
                          Builder(builder: (context) {
                            return Flexible(
                              child: defaultButton(
                                function: () {
                                  // navigateTo(
                                  // context,
                                  // ChatDetailsScreen(
                                  //   receiverId: userId!,
                                  //   senderId: myUserId,
                                  //   roomId: roomId,
                                  //   user: user,
                                  // ),
                                  //   receiverId: userId,
                                  //   senderId: myUserId,
                                  //   receiverName: data.myInfo!.personal!.name!,
                                  //   receiverPhoto: data.myInfo!.personal!.photo,
                                  // ),
                                  // );
                                },
                                icon: FluentIcons.chat_48_filled,
                              ),
                            );
                          }),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
