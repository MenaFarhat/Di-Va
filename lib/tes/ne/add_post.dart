
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class Addpost extends StatelessWidget {
  const Addpost({Key? key}) : super(key: key);
  Widget interest(String name) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
          ],
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [hintFieldColor, Colors.white],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 15,
              ),
              child: Text(
                "#$name",
                style: const TextStyle(
                  color: defaultColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "New Post",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
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
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              FluentIcons.camera_28_filled,
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
              child: Container(
                height: 230,
                width: 180,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      defaultColor,
                      Color(0xff5564ff),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  'assets/images/interests/graphic_design.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: defaultColor,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  decoration: const InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    // labelText: "Discreption",
                    // labelStyle: TextStyle(

                    //     color: Colors.black,
                    //     fontWeight: FontWeight.w400,
                    //     fontSize: 20),
                    hintText: "Enter your Description",
                    hintStyle: TextStyle(
                      color: hintFieldColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
            ]),
            const SizedBox(
              height: 30,
            ),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "#Interests",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: defaultColor,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {},
                      label: const Text(
                        "Edit",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: defaultColor,
                        ),
                      ),
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  interest("camera man"),
                  interest("camera man"),
                  interest("camera man"),
                ],
              )
            ]),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5.0)
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      defaultColor,
                      Color(0xff5564ff),
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
                    child: Text(
                      "Promot",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 70,
                width: 350,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0, 4),
                        blurRadius: 5.0)
                  ],
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [
                      defaultColor,
                      Color(0xff5564ff),
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
                    child: Text(
                      "publish",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
