import 'package:diva/module/add_post/cubit/add_post_cubit.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
Widget choosePostImageButtomSheet({
  required AddPostCubit? cubit,
  required BuildContext context,
}) {
  SizeConfig().init(context);
  return Container(
    height: getProportionateScreenHeight(110),
    width: SizeConfig.screenWidth,
    margin: const EdgeInsets.symmetric(vertical: 20),
    child: Column(
      children: [
        const Text(
          "Choose Photo",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
                // cubit.getAddImage(source: ImageSource.camera);
              },
              icon: const Icon(
                Icons.camera,
                color: defaultColor,
                size: 30,
              ),
              label: const Text(
                "Camera",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pop(context);
                // cubit.getAddImage(source: ImageSource.gallery);
              },
              icon: const Icon(
                Icons.image,
                color: defaultColor,
                size: 30,
              ),
              label: const Text(
                "Gallery",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
