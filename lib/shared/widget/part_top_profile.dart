
// ignore_for_file: must_be_immutable

import 'package:diva/layout/my_profile_layout/components/custemImageProfile.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:diva/tes/followers.dart';
import 'package:diva/tes/followings.dart';
import 'package:diva/tes/ne/show_photo.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class PartTopProfile extends StatelessWidget {
  ScrollController? scrollController;

  PartTopProfile({super.key, 
    this.scrollController,
  });

  GlobalKey keyForpost = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      key: keyForpost,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x29000000),
            offset: Offset(0, 5),
            blurRadius: 30,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsetsDirectional.only(
                    top: getProportionateScreenHeight(30)),
                child: ClipPath(
                  clipper: CustomClipperImageProfile(),
                  child: Stack(
                    children: [
                      InkWell(
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
                                      Navigator.of(context).pop();
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) {
                                        return ShowPhoto(
                                          image:
                                              'assets/images/interests/graphic_design.jpg',
                                        );
                                      }));
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
                        child: SizedBox(
                          height: getProportionateScreenHeight(300),
                          width: getProportionateScreenWidth(145),
                          child: Stack(
                            children: [
                              Image.asset(
                                'assets/images/interests/graphic_design.jpg',
                                fit: BoxFit.cover,
                                // width: size.width * 0.345,
                                height: getProportionateScreenHeight(300),
                              ),
                              CustomPaint(
                                size: Size(
                                  SizeConfig.screenWidth,
                                  getProportionateScreenHeight(356),
                                ),
                                willChange: true,
                                painter: CustomPainterImageProfile(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // ),
                ),
              ),
            ],
          ),
          SizedBox(width: getProportionateScreenWidth(10)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Mina farhat",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  const Text(
                    "welcom to my profile and you have the  right amount of time to ",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black87,
                      fontStyle: FontStyle.italic,
                      // fontSize: 14,
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          final keyContext = keyForpost.currentContext;
                          final box =
                              keyContext!.findRenderObject() as RenderBox;
                          // final pos = box.localToGlobal(Offset.zero);
                          if (scrollController!.hasClients) {
                            scrollController!.animateTo(
                              box.size.height,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeOut,
                            );
                          }
                        },
                        child: const Column(
                          children: [
                            Text(
                              "846",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Post",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Followers(),
                              ));
                        },
                        child: const Column(
                          children: [
                            Text(
                              "846",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Followings(),
                              ));
                        },
                        child: const Column(
                          children: [
                            Text(
                              "568",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(40)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      defaultButton(
                        function: () {},
                        text: 'Edit ',
                        radius: 20,
                        width: getProportionateScreenWidth(150),
                        isBorderColor: false,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        boxShadow: [
                          const BoxShadow(
                            color: defaultSecondColor,
                            offset: Offset(0, 4),
                            blurRadius: 3.0,
                          )
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.0, 1],
                          colors: [
                            defaultColor,
                            defaultSecondColor,
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          // width: getProportionateScreenWidth(50),
                          height: 48,
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: defaultSecondColor,
                                offset: Offset(0, 4),
                                blurRadius: 3.0,
                              )
                            ],
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [0.0, 1.0],
                              colors: [
                                defaultColor,
                                defaultSecondColor,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 15,
                              ),
                              child: Icon(
                                FluentIcons.chat_48_filled,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(height: getProportionateScreenHeight(50)),
                  // Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
