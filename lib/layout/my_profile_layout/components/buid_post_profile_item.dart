import 'package:diva/models/post_model.dart';
import 'package:diva/module/show_post/cubit/show_post_cubit.dart';
import 'package:diva/module/show_post/show_post_screen.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:flutter/material.dart';

Widget buidPostProfileItem({
  required PostModel post,
  required BuildContext context,
}) =>
    InkWell(
      onTap: () {
        ShowPostCubit.get(context).getShowPost(postId: post.postId);
        navigateTo(
          context,
          ShowPostScreen(
            postId: post.postId,
          ),
        );
      },
      child: Container(
        width: getProportionateScreenWidth(165),
        height: getProportionateScreenHeight(165),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          // image: DecorationImage(
          //   image: NetworkImage("$HOST/$POSTIMAGE/${post.photo}"),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image.network(
              "$HOST/$POSTIMAGE/${post.photo}",
              fit: BoxFit.cover,
              width: getProportionateScreenWidth(165),
              height: getProportionateScreenHeight(165),
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     SizedBox(
            //       width: getProportionateScreenWidth(8),
            //     ),
            //     Iconify(
            //       Ph.arrow_fat_lines_up_thin,
            //       color: Colors.deepOrangeAccent,
            //     ),
            //     SizedBox(
            //       width: getProportionateScreenWidth(5),
            //     ),
            //     Text(
            //       post.upVotesNumber.toString(),
            //       style: TextStyle(
            //         color: textColor,
            //       ),
            //     ),
            //     SizedBox(
            //       width: getProportionateScreenWidth(10),
            //     ),
            //     Iconify(
            //       Ph.arrow_fat_lines_down_thin,
            //       color: textColor,
            //     ),
            //     SizedBox(
            //       width: getProportionateScreenWidth(5),
            //     ),
            //     Text(
            //       post.downVotesNumber.toString(),
            //       style: TextStyle(
            //         color: textColor,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
