import 'package:diva/layout/app_layout/cubit/app_layout_cubit.dart';
import 'package:diva/layout/my_profile_layout/my_profile_layout.dart';
import 'package:diva/layout/profile/profile_screen.dart';
import 'package:diva/models/follow_model.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/local/cache_helper.dart';
import 'package:diva/shared/network/local/end_point.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';

Widget buildFollowPepole({
  required FollowAndBlockModel? person,
  required BuildContext context,
}) {
  var myUserId = CacheHelper.getData(key: USERID);

  return Row(
    children: [
      Flexible(
        child: ListTile(
          onTap: () {
            AppLayoutCubit.get(context);
            if (person!.userId == myUserId) {
              // cubit.changeBottomNav(3);
              navigateTo(
                context,
                // AppLayout(),
                const MyProfileLayout(),
              );
            } else {
              navigateTo(
                context,
                ProfileScreen(
                  userId: person.userId,
                ),
              );
            }
          },
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment(0.5, 0),
                end: Alignment(0.5, 1),
                colors: [defaultColor, defaultColor],
              ),
              border: Border.all(
                color: Colors.transparent,
                width: 3,
              ),
            ),
            child: person!.photo != null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(
                      '$HOST/$USERIMAGE/${person.photo}',
                    ),
                    radius: 28,
                  )
                : const CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/images/profile.png',
                    ),
                    radius: 28,
                  ),
          ),
          title: Text(
            person.name!,
            style: const TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ),
      Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
        child: IconButton(
          onPressed: () {},
          icon: const Iconify(
            Ph.chat_circle_dots,
            size: 25,
            color: defaultColor,
          ),
        ),
      ),
    ],
  );
}
