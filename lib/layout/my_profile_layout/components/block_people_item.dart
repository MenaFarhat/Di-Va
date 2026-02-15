import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

Widget blockPeopleItem({String? image, String? name}) {
  return ListTile(
    onTap: () {},
    leading: InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: defaultColor,
            width: 3,
          ),
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage(
            image!,
          ),
          radius: 35,
        ),
      ),
    ),
    trailing: IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.person_off_outlined,
        size: 28,
      ),
      color: defaultColor,
    ),
    title: Text(
      name!,
      style: const TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}
