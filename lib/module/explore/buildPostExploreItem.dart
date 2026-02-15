// ignore_for_file: file_names

import 'package:diva/models/explore_model.dart';
import 'package:diva/module/show_post/cubit/show_post_cubit.dart';
import 'package:diva/module/show_post/show_post_screen.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:flutter/material.dart';

Widget buildPostExploreItem({
  required ExploreModel cubit,
  required BoxConstraints constraints,
  required bool isSmall,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      ShowPostCubit.get(context).getShowPost(
        postId: cubit.post!.postId,
      );
      navigateTo(
        context,
        ShowPostScreen(
          postId: cubit.post!.postId,
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.all(5),
      height:
          isSmall ? constraints.maxHeight / 4.5 : constraints.maxHeight / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.black12,
        image: DecorationImage(
          image: NetworkImage(
            '$HOST/$POSTIMAGE/${cubit.post!.photo!}',
          ),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
