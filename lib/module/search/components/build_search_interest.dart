import 'package:diva/models/interstes/interests_model.dart';
import 'package:diva/module/search/interst_screens.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

// interestSearch
Widget buildSearchInterest({
  required String? interestName,
  required BuildContext? context,
}) =>
    TextButton(
      onPressed: () {
        navigateTo(context,
            InterstScreen(interstId: interestsName.indexOf(interestName!)));
      },
      clipBehavior: Clip.antiAlias,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(defaultColor),
      ),
      child: Text(
        '#$interestName',
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );

Widget interstPost({
  required int indexInterest,
  required context,
}) =>
    GestureDetector(
      onTap: () {
        navigateTo(
          context,
          InterstScreen(
            interstId: indexInterest,
          ),
        );
      },
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(4)),
        child: Text(
          '#${interestsName[indexInterest]}',
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            color: defaultColor,
            fontWeight: FontWeight.w600,
            // fontSize: 15,
          ),
        ),
      ),
    );
