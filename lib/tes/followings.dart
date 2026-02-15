import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';

class Followings extends StatelessWidget {
  const Followings({Key? key}) : super(key: key);
  Widget followepepole(String m, String name, BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            //width: 75,
            //height: 75,
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

            child: InkWell(
              onTap: (){
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
                            'Show Profile Photo',
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
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  m,
                ),
                radius: 30,
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        Text(
          name,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(width: 12),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              FluentIcons.chat_48_regular,
              size: 25,
              color: defaultColor,
            )),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 25,
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(85, 0, 0, 0),
                  child: Text(
                    "Followings",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  followepepole(
                      'assets/images/interests/animal.jpg', "Mina farhat", context),
                  followepepole('assets/images/interests/anime.jpg',
                      "jjgkfjgkfgk jkfgksk", context),
                  followepepole(
                      'assets/images/interests/art.jpg', "nVJA KJKFHKA NBANSJ", context),
                  followepepole(
                      'assets/images/interests/beauty.jpg', "jhkjhkhJk kjkn", context),
                  followepepole(
                      'assets/images/interests/books.jpg', "kjvkjsdhk basfg", context),
                  followepepole('assets/images/interests/drawings.jpg',
                      "hjhkajhkf nahgf", context),
                  followepepole(
                      'assets/images/interests/fashion.jpg', "fkjak hahf", context),
                  followepepole(
                      'assets/images/interests/fitness.jpg', "hgjafv kgajfj", context),
                  followepepole(
                      'assets/images/interests/flower.jpg', "bafgg gjah", context),
                  followepepole('assets/images/interests/graphic_design.jpg',
                      "kaj hgajf abf", context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
