import 'package:diva/layout/my_profile_layout/components/custemImageProfile.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

Widget imageProfile({
  required BuildContext context,
  required String? image,
  required bool? isNull,
}) {
  return CustomPaint(
    // painter: CustomPainterImageProfile(),
    foregroundPainter: CustomPainterImageProfile(),
    child: ClipPath(
      clipper: CustomClipperImageProfile(),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: const Icon(
                      FluentIcons.image_48_filled,
                      color: defaultColor,
                      size: 30,
                    ),
                    title: const Text(
                      'Show Profile photo',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.camera_outlined,
                      color: defaultColor,
                      size: 30,
                    ),
                    title: const Text(
                      'Show story',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: isNull!
            ? Image.asset(
                image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: getProportionateScreenHeight(360),
              )
            : Image.network(
                image!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: getProportionateScreenHeight(360),
                // loadingBuilder: (context, child, ImageChunkEvent? loadingProgress) {
                //   if (loadingProgress == null) {
                //     return child;
                //   } else {
                //     return Center(
                //       child: CircularProgressIndicator(
                //         value: loadingProgress.expectedTotalBytes != null
                //             ? loadingProgress.cumulativeBytesLoaded /
                //                 loadingProgress.expectedTotalBytes!
                //             : null,
                //       ),
                //     );
                //   }
                // },
              ),
      ),
    ),
  );
}
