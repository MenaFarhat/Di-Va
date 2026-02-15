import 'package:diva/layout/my_profile_layout/components/block_people_item.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

Widget peopleBlockBottomSheet(context) => Column(
      children: [
        Divider(
          color: defaultColor,
          thickness: 4,
          height: 20,
          indent: MediaQuery.of(context).size.width / 2 - 30,
          endIndent: MediaQuery.of(context).size.width / 2 - 30,
        ),
        Expanded(
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) => blockPeopleItem(
              image: 'assets/images/interests/animal.jpg',
              name: "Mina farhat",
            ),
            separatorBuilder: (context, index) => const Divider(
              height: 15,
            ),
          ),
        ),
      ],
    );
