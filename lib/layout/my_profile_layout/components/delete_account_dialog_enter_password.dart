import 'package:diva/layout/my_profile_layout/cubit/my_profile_layout_cubit.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget deleteAccountDialogEnterPassword(context) =>
    BlocConsumer<MyProfileLayoutCubit, MyProfileLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MyProfileLayoutCubit cubit = MyProfileLayoutCubit.get(context);
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: const Text("Enter Your Password to continue"),
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 24.0, 10.0),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          content: TextFormField(
            obscureText: cubit.isPassword,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: Icon(cubit.suffix, color: defaultColor),
                onPressed: () {
                  cubit.changePasswordVisibility();
                },
              ),
              hintText: "Enter your Password",
              hintStyle: const TextStyle(
                color: hintFieldColor,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: defaultColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Send",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: defaultColor,
                ),
              ),
            ),
          ],
        );
      },
    );
