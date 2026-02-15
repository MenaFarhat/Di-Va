// ignore_for_file: unnecessary_null_comparison, deprecated_member_use

import 'package:diva/models/interstes/interests_model.dart';
import 'package:diva/module/edit_post/components/choose_post_image_buttom_sheet.dart';
import 'package:diva/module/edit_post/cubit/edit_post_cubit.dart';
import 'package:diva/module/intersts/components/item_Interest.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/interests_name_item.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';


class AddPost11 extends StatefulWidget {
  const AddPost11({ Key? key }) : super(key: key);

  @override
  State<AddPost11> createState() => _AddPost11State();
}

class _AddPost11State extends State<AddPost11> {
  @override
  Widget build(BuildContext context) {
      EditPostCubit cubit = EditPostCubit.get(context);
    return SafeArea(
            child: Scaffold(
              body: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const Text(
                        "Edit Post",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: WidgetStateProperty.all(
                            defaultColor.withOpacity(0.1),
                          ),
                        ),
                        onPressed: () {
                          if (cubit.showInterste == null) {
                            showToast(
                              text: 'It must contain an image',
                              state: ToastState.ERROR,
                             // gravity: ToastGravity.CENTER,
                            );
                          }
                        },
                        child: const Text(
                          "SAVE",
                          style: TextStyle(
                            color: defaultColor,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    color: hintFieldColor,
                    thickness: 1,
                  ),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    backgroundImage: AssetImage(
                                      'assets/images/interests/art.jpg',
                                    ),
                                  ),
                                  SizedBox(
                                      width: getProportionateScreenWidth(8)),
                                  const Text(
                                    "Mauricio Lopez",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: getProportionateScreenHeight(25)),
                              TextFormField(
                               // controller: postController,
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: defaultColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: defaultColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: defaultColor),
                                  ),
                                  hintText: "Enter your Description",
                                ),
                                maxLines: null,
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(15),
                              ),
                              cubit.selected == null
                                  ? InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          context: context,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20)),
                                          ),
                                          builder: (builder) =>
                                              choosePostImageButtomSheet(
                                            context: context, cubit: null,
                                            // cubit: cubit.showInterste,
                                          ),
                                        );
                                      },
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.asset(
                                          'assets/images/image.png',
                                          width:
                                              getProportionateScreenWidth(329),
                                          height:
                                              getProportionateScreenHeight(295),
                                          // width: 329,
                                          // height: 295,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    )
                                  : Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.file(
                                            cubit.postEditImage!,
                                            width: getProportionateScreenWidth(
                                                329),
                                            height:
                                                getProportionateScreenHeight(
                                                    295),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              cubit.deletePostEditImage();
                                            },
                                            icon: const Icon(
                                              Icons.cancel,
                                              size: 30,
                                              color: Colors.black54,
                                            )),
                                      ],
                                    ),
                              SizedBox(height: getProportionateScreenHeight(5)),
                              Row(
                                children: [
                                  Wrap(
                                    children: cubit.selected.isNotEmpty
                                        ? List.generate(
                                            cubit.selected.length,
                                            (index) {
                                              return interestsNameItem(
                                                interestsName[index],
                                              );
                                            },
                                          )
                                        : [
                                            interestsNameItem(
                                              "Interest",
                                            ),
                                          ],

                                    // interests("Graphic Design"),
                                    // ],
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      cubit.changeShowInterste();
                                    },
                                    icon: Icon(
                                      cubit.iconshowInterste,
                                      size: 35,
                                      color: defaultColor,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(5),
                              ),
                              cubit.showInterste
                                  ? SizedBox(
                                      height: getProportionateScreenHeight(165),
                                      child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(width: 5),
                                        itemCount: interestsName.length,
                                        itemBuilder: (context, index) =>
                                            buildInterestItem(
                                          index: index,
                                          interestsName: interestsName[index],
                                          interestsImage: interestsImage[index],
                                          selected: cubit.selected,
                                          ontap: () {
                                            if (cubit.selected.length < 2) {
                                              cubit.changeInterstsSelected(
                                                  index);
                                            } else if (cubit.selected.length >=
                                                    2 &&
                                                cubit.selected
                                                    .contains(index)) {
                                              cubit.changeInterstsSelected(
                                                  index);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                      validatorSnackBarInterests as SnackBar);
                                            }
                                          },
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}

extension on EditPostCubit {
  get postEditImage => null;
}