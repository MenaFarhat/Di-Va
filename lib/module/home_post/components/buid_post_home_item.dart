// ignore_for_file: deprecated_member_use

import 'package:diva/layout/my_profile_layout/my_profile_layout.dart';
import 'package:diva/layout/profile/profile_screen.dart';
import 'package:diva/models/extensions/date_time_extension.dart';
import 'package:diva/models/home_post/home_post_model.dart';
import 'package:diva/module/comments/comments_screeen.dart';
import 'package:diva/module/comments/components/components.dart';
import 'package:diva/module/home_post/components/settings_home_post_bottom_sheet.dart';
import 'package:diva/module/home_post/cubit/home_post_cubit.dart';
import 'package:diva/module/search/components/build_search_interest.dart';
import 'package:diva/module/show_post/cubit/show_post_cubit.dart';
import 'package:diva/module/show_post/show_post_screen.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/constants.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/local/cache_helper.dart';
import 'package:diva/shared/network/local/end_point.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/uil.dart';
import 'package:readmore/readmore.dart';

Widget buidPostHomeItem({
  required BuildContext context,
  required HomeModel? post,
  required int? index,
}) {
  var myUserId = CacheHelper.getData(key: USERID);

  return Container(
    margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
    padding: EdgeInsets.only(
        left: getProportionateScreenWidth(21),
        right: getProportionateScreenWidth(17),
        top: getProportionateScreenHeight(15),
        bottom: getProportionateScreenHeight(10)),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0x0f000000),
        //     offset: Offset(10, 10),
        //     blurRadius: 5,
        //   )
        // ],
        gradient: LinearGradient(
          colors: [
            Colors.grey.shade100,
            Colors.grey.shade100,
          ],
        ),
        color: Colors.white //defaultColor.withOpacity(0.1),
        ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            post!.post!.user?.photo == null
                ? const CircleAvatar(
                    backgroundImage: AssetImage(
                      USERIMAGENULL,
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(
                      "$HOST/$USERIMAGE/${post.post!.user?.photo!}",
                    ),
                    radius: 22,
                  ),
            SizedBox(width: getProportionateScreenWidth(8)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: myUserId == post.post!.userId
                      ? () {
                          navigateTo(
                            context,
                            const MyProfileLayout(),
                          );
                        }
                      : () {
                          navigateTo(
                            context,
                            ProfileScreen(
                              userId: post.post!.userId,
                            ),
                          );
                        },
                  child: Text(
                    post.post!.user!.name!,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                ),
                Text(
                  post.post!.createdAt!.timeAgo(numericDates: false),
                  style: const TextStyle(
                    color: Color(0xff909090),
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (myUserId == post.post!.userId)
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) {
                      return settingsHomePostBottomsheet(
                        context: context,
                        postId: post.post!.postId!,
                        index: index,
                        post: post.post!,
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.keyboard_command_key_sharp,
                  color: defaultColor,
                ),
              ),
          ],
        ),
        if (post.post!.content != null)
          Padding(
            padding: EdgeInsetsDirectional.only(
              top: getProportionateScreenHeight(10),
              start: getProportionateScreenWidth(12),
            ),
            child: ReadMoreText(
              post.post!.content!,
              style: const TextStyle(
                fontSize: 15,
              ),
              trimMode: TrimMode.Line,
              trimLines: 2,
              trimCollapsedText: 'Show more',
              moreStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: defaultColor,
              ),
              trimExpandedText: 'Show less',
              lessStyle: const TextStyle(
                color: defaultColor,
                fontSize: 13,
              ),
            ),
          ),
        SizedBox(
          height: getProportionateScreenHeight(13),
        ),
        GestureDetector(
          onTap: () {
            ShowPostCubit.get(context).getShowPost(postId: post.post!.postId);
            navigateTo(
              context,
              ShowPostScreen(
                postId: post.post!.postId,
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              '$HOST/$POSTIMAGE/${post.post!.photo}',
              fit: BoxFit.cover,
              width: getProportionateScreenWidth(329),
              height: getProportionateScreenHeight(295),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsetsDirectional.only(top: getProportionateScreenHeight(8)),
          child: Row(
            children: [
              Wrap(
                children: List.generate(
                    post.post!.interestId!.length,
                    (index) => interstPost(
                          indexInterest: post.post!.interestId![index],
                          context: context,
                        )),
              ),
              const Spacer(),
            ],
          ),
        ),
        const Divider(
          color: textColor,
          thickness: 0.5,
        ),
        BlocConsumer<HomePostCubit, HomePostStates>(
          listener: (context, state) {},
          builder: (context, state) {
            HomePostCubit cubit = HomePostCubit.get(context);
            return Row(
              children: [
                reactPost(
                  color:
                      post.post!.react == "Upvoted" ? defaultColor : textColor,
                  onTap: () {
                    cubit.upvot(postId: post.post!.postId, index: index!);
                  },
                  icon: Ph.arrow_fat_lines_up_thin, //Bx.upvote,
                  numberOfREact: post.post!.upVotesNumber!,
                ),
                const Spacer(),
                reactPost(
                  color: post.post!.react == "Downvoted"
                      ? defaultColor
                      : textColor,
                  onTap: () {
                    cubit.downVot(postId: post.post!.postId, index: index!);
                  },
                  icon: Ph.arrow_fat_lines_down_thin, // Bx.downvote,
                  numberOfREact: post.post!.downVotesNumber!,
                ),
                const Spacer(
                  flex: 2,
                ),
                reactPost(
                  color: textColor.withOpacity(0.5),
                  onTap: () {
                    ShowPostCubit.get(context)
                        .getShowPost(postId: post.post!.postId);
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                      builder: (context) {
                        return CommentsScreeen(postId: post.post!.postId);
                      },
                    );
                  },
                  icon: Uil.comment_dots,
                  numberOfREact: post.post!.commentsNumber!,
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            );
          },
        ),
      ],
    ),
  );
}
