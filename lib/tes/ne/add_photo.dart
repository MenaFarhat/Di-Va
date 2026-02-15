// ignore_for_file: avoid_print

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/local/cache_helper.dart';
import 'package:diva/shared/network/local/end_point.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';


import 'package:fluentui_system_icons/fluentui_system_icons.dart';

Future<Response> sendFile(String url, File? file) async {
  final token = CacheHelper.getData(key: TOKEN);
  print(token);
  await file!.length();

  Dio dio = Dio();
  // dio.options.responseType = ResponseType.plain;
  // dio.options.headers["Content-Length"] = len;
  // Headers.contentLengthHeader: len,

  // dio.options.headers['Accept'] = "application/json";
  // dio.options.headers['Content-Type'] = "multipart/form-data";
  var response = await dio.post(
    url,
    data: {
      "photo": await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
      ),
    },
    options: Options(
      responseType: ResponseType.json,
      // contentType: 'multipart/form-data',
      // headers: {
      //   "Authorization": "Bearer 44|wHLxq24mOigvizlWnFGaiZ244UO7J3p75MYSYUaY",
      //   "Content-Type": "application/json ;multipart/form-data",
      // },
      headers: {
        // Headers.contentLengthHeader: len,
        // multipart/form-data
        "Accept": "Application/javascript",
        "Content-Type": "multipart/form-data",
        "Authorization": "Bearer $token",
        // "Content-Length": '${len.toString()}',
      },
    ),
  );
  return response;
}
//
// Future<XFile?> takePhoto() async {
//   ImagePicker imagepicker = ImagePicker();
//   final pickedImage = await imagepicker.pickImage(
//       source: ImageSource.gallery, imageQuality: 100);
//
//   try {
//     return pickedImage!;
//
//     // Navigator.pop(context);
//
//   } catch (e) {
//     return null;
//   }
//
//   // Get.back();
// }

class Addphoto extends StatefulWidget {
  const Addphoto({Key? key}) : super(key: key);

  @override
  State<Addphoto> createState() => _AddphotoState();
}

class _AddphotoState extends State<Addphoto> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Add Profile Picture",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 70,
          ),
          SingleChildScrollView(
            child: Column(children: [
              const CircleAvatar(
                radius: 190,
                backgroundImage: AssetImage(
                  'assets/images/interests/music.jpg',
                ),
                //radius: 300,
              ),
              const SizedBox(
                height: 15,
              ),
              TextButton.icon(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: const Icon(
                                FluentIcons.image_multiple_48_filled,
                                color: defaultColor,
                                size: 30,
                              ),
                              title: const Text(
                                'Gallary',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onTap: () {
                                // takePhoto().then((value) {
                                //   sendFile(
                                //     "http://192.168.1.103:8000/api/myprofile/photo",
                                //     File(value!.path),
                                //   ).then((value) {
                                //     print(value);
                                //   });
                                //   print(value);
                                // });
                              },
                            ),
                            ListTile(
                              leading: const Icon(
                                Icons.camera,
                                color: defaultColor,
                                size: 30,
                              ),
                              title: const Text(
                                'Camera',
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
                      });
                },
                icon: const Icon(
                  FluentIcons.shape_intersect_24_filled,
                  size: 45,
                  color: defaultColor,
                ),
                label: const Text(
                  "Tab to Add",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: defaultColor,
                  ),
                ),
              )
            ]),
          ),
          // SizedBox(
          //       height: 203,
          //     ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: defaultButton(
                  function: () {
                    // Todo: NAv +send +if(formkey)
                  },
                  text: 'Next',
                  fontSize: 15,
                  radius: 19,
                  width: 140,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
