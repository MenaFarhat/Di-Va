import 'package:diva/shared/components/size_config.dart';
import 'package:flutter/material.dart';

Widget buidPostProfileItem({
  required void Function()? onPress,
}) =>
    InkWell(
      onTap: onPress,
      child: Container(
        width: getProportionateScreenWidth(165),
        height: getProportionateScreenWidth(165),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          // image: DecorationImage(
          //   image:
          // borderRadius: BorderRadius.all(
          //   const Radius.circular(19),
          // ),
        ),
        child: Stack(
          children: [
            Image.asset(
              "assets/images/interests/art.jpg",
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
