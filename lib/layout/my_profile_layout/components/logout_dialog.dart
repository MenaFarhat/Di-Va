import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

Widget logoutDialog(context) => AlertDialog(
      title: const Text("Logout your Account"),
      content: const Text("Are you sure?"),
      contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 24.0, 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: defaultColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            "OK",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: defaultColor,
            ),
          ),
        ),
      ],
    );
