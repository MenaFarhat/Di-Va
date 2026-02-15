// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'dart:typed_data';

import 'package:diva/module/add_story/preview/image_screen_add_story.dart';
import 'package:diva/module/add_story/preview/video_screen_add_story.dart';
import 'package:diva/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class AssetThumbnailAddStory extends StatelessWidget {
  final AssetEntity? asset;
  const AssetThumbnailAddStory({super.key, 
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List?>(
      future: asset!.thumbnailData,
      builder: (_, snapshot) {
        final bytes = snapshot.data;
        if (bytes == null) return const Center(child: CircularProgressIndicator());
        return InkWell(
          onTap: () {
            asset!.file.then((value) {
              navigateTo(
                context,
                asset!.type == AssetType.image
                    ?
                    // If this is an image, navigate to ImageScreen
                    ImageScreenAddStory(imageFile: File(value!.path))
                    // if it's not, navigate to VideoScreen
                    : VideoScreenAddStory(videoFile: File(value!.path)),
              );
            });
          },
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(
                      bytes,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (asset!.type == AssetType.video)
                Center(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
