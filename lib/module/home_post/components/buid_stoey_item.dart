import 'package:diva/shared/components/constants.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

Widget buidStoeyItem({
  required void Function()? onPress,
  required String? name,
  required String? photo,
}) =>
    SizedBox(
      width: getProportionateScreenWidth(72),
      child: Column(
        children: [
          GestureDetector(
            onTap: onPress,
            child: Container(
              width: getProportionateScreenWidth(75),
              height: getProportionateScreenHeight(75),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(30),
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
              // clipBehavior: Clip.hardEdge,
              child: photo != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        '$HOST/$USERIMAGE/$photo',
                      ),
                      radius: 5,
                    )
                  : const CircleAvatar(
                      backgroundImage: AssetImage(
                        USERIMAGENULL,
                      ),
                      radius: 5,
                    ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
          Text(
            name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xff787c81),
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
