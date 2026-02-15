import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

Widget interestsNameItem(String name) {
  return Padding(
    padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
    child: Row(
      children: [
        const Text(
          "#",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: defaultColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          name,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: defaultColor,
          ),
        ),
      ],
    ),
  );
}
