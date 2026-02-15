// ignore_for_file: deprecated_member_use, must_be_immutable

import 'dart:io';
import 'package:diva/module/camera/cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class AssetThumbnail extends StatelessWidget {
  final AssetEntity? asset;
  GlobalKey? keyForBack;
  ImageCubit? cubit;
  AssetThumbnail({super.key, required this.asset, required this.keyForBack, this.cubit});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File?>(
      future: asset!.file,
      builder: (context, snapshot) {
        if (snapshot.hasData) {}
        File? fileImage = snapshot.data;

        if (fileImage == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return InkWell(
          onTap: () {
            cubit!.getCurrentImage(newImage: fileImage);
            Scrollable.ensureVisible(
              keyForBack!.currentContext!,
              duration: const Duration(milliseconds: 300),
            );
          },
          child: cubit!.currentImage!.path == fileImage.path
              ? Image.file(
                  fileImage,
                  fit: BoxFit.cover,
                  color: Colors.white.withOpacity(0.5),
                  colorBlendMode: BlendMode.xor,
                )
              : Image.file(
                  fileImage,
                  fit: BoxFit.cover,
                ),
        );
      },
      //   );
      // },
    );
  }
}
