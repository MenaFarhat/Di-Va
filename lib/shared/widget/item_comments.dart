// ignore_for_file: avoid_print

import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

Widget buidCommentsItem() => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          onTap: () {
            print("MMMMMMM");
          },
          child: const CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/interests/art.jpg',
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mauricio Lopez",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '20 min ago20 min agssssaccasdlm,dspmdslmsdkmskdlsdksdkl;dslmsdmdslmklmk o20 min ago20 min ago20 min ago20 min ago20 min ago20 min ago20 min ago20 min ago20 min ago20 min ago20 min ago20 min ago',

                style: TextStyle(
                  color: textColor,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
