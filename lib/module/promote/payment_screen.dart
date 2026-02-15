// ignore_for_file: avoid_print, must_be_immutable

import 'package:diva/layout/my_profile_layout/cubit/my_profile_layout_cubit.dart';
import 'package:diva/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayementScreen extends StatefulWidget {
  int numberOfPost;
  PayementScreen({super.key, 
    required this.numberOfPost,
  });
  @override
  State<PayementScreen> createState() => _PayementScreenState();
}

class _PayementScreenState extends State<PayementScreen> {
  var codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Confirm the payment',
              style: TextStyle(
                fontSize: 27.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Please enter the code you received to confirm the payment',
              style: TextStyle(
                color: Color(0xff7C7D7E),
                fontSize: 13.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                controller: codeController,
                decoration: const InputDecoration(
                    labelText: 'Enter code', border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                color: const Color(0xff21115C),
              ),
              width: 120.0,
              child: BlocConsumer<MyProfileLayoutCubit, MyProfileLayoutStates>(
                listener: (context, state) {
                  if (state is PromoSucssesStates) {
                    print(state.sucss);
                    if ("The amount paid does not allow you to choos this number of posts" ==
                        state.sucss) {
                      showToast(text: state.sucss, state: ToastState.ERROR);
                    } else if ("Your code is invalid , Please check your code" ==
                        state.sucss) {
                      showToast(text: state.sucss, state: ToastState.ERROR);
                    } else {
                      showToast(text: state.sucss, state: ToastState.SUCCESS);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                  }
                  if (state is PromoErrorStates) {
                    showToast(
                      text: state.error,
                      state: ToastState.SUCCESS,
                    );
                  }
                },
                builder: (context, state) {
                  print(codeController.text);
                  print(widget.numberOfPost);
                  MyProfileLayoutCubit cubit =
                      MyProfileLayoutCubit.get(context);
                  return MaterialButton(
                    onPressed: () {
                      cubit.proomotion(
                        code: codeController.text,
                        namperOf: widget.numberOfPost,
                      );
                    },
                    child: const Text(
                      'CONFIRM',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
