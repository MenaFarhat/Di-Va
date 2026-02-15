// ignore_for_file: avoid_print

import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              "Mina farhat",
              style: TextStyle(fontSize: 19),
            ),
            accountEmail: const Text("Mina.farhat@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: InkWell(
                  child: const ClipOval(
                      // child: Image.network(
                      //   "https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      //   width: 90,
                      //   height: 90,
                      //   fit: BoxFit.cover,
                      // ),
                      ),
                  onTap: () {}),
            ),
            decoration: const BoxDecoration(
              color: defaultColor,
              // image: const DecorationImage(
              //   image: AssetImage("images/2.png"),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.face_outlined,
              size: 35,
              color: defaultColor,
            ),
            title: const Text(
              "Profile",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            onTap: () => print("Done"),
          ),
          ListTile(
            leading: const Icon(
              Icons.chat_bubble_rounded,
              size: 35,
              color: defaultColor,
            ),
            title: const Text(
              "Chat",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.favorite,
              size: 35,
              color: defaultColor,
            ),
            title: const Text(
              "Followers",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_rounded,
              size: 35,
              color: defaultColor,
            ),
            title: const Text(
              "Notifications",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            trailing: ClipOval(
              child: Container(
                color: Colors.red.shade700,
                width: 20,
                height: 20,
                child: const Center(
                  child: Text(
                    "8",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {},
          ),
          const Divider(height: 20),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 35,
              color: defaultColor,
            ),
            title: const Text(
              "Settings",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.language,
              size: 35,
              color: defaultColor,
            ),
            title: const Text(
              "Language",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.share,
              size: 35,
              color: defaultColor,
            ),
            title: const Text(
              "Share Us",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
          const Divider(height: 20),
          ListTile(
            leading: const Icon(
              Icons.exit_to_app_rounded,
              size: 35,
              color: defaultColor,
            ),
            title: const Text(
              "Exit",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
