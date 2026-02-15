import 'package:diva/models/comment_model.dart';
import 'package:diva/module/show_post/settingsCommentBottomsheet.dart';
import 'package:diva/shared/components/constants.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/local/cache_helper.dart';
import 'package:diva/shared/network/local/end_point.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

Widget buidCommentsItem({
  required CommentModel? comment,
  required context,
  required postId,
  required int? index,
}) =>
    InkWell(
      onLongPress: comment!.userId == CacheHelper.getData(key: USERID)
          ? () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) {
                  return settingsCommentBottomsheet(
                    context: context,
                    postId: postId,
                    comment: comment,
                    index: index,
                  );
                },
              );
            }
          : () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          comment.user!.photo != null
              ? CircleAvatar(
                  backgroundImage: NetworkImage(
                  "$HOST/$USERIMAGE/${comment.user!.photo!}",
                ))
              : const CircleAvatar(
                  backgroundImage: AssetImage(
                    USERIMAGENULL,
                  ),
                  radius: 22,
                ),
          SizedBox(
            width: getProportionateScreenWidth(8),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.user!.name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(5)),
                Text(
                  comment.content!,
                  style: const TextStyle(
                    color: textColor,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
