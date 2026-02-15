// ignore_for_file: file_names

import 'package:diva/models/explore_model.dart';
import 'package:diva/module/explore/buildPostExploreItem.dart';
import 'package:flutter/cupertino.dart';
Widget buildListExplore({
  required BuildContext context,
  required BoxConstraints constraints,
  required List<ExploreModel> list,
  required bool isRight,
}) =>
    Flexible(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 5, bottom: 60),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return index % 2 == 0
              ? buildPostExploreItem(
                  context: context,
                  constraints: constraints,
                  cubit: list[index],
                  isSmall: isRight ? true : false,
                )
              : buildPostExploreItem(
                  context: context,
                  constraints: constraints,
                  cubit: list[index],
                  isSmall: isRight ? false : true,
                );
        },
      ),
    );
