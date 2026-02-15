// ignore_for_file: must_be_immutable

import 'package:diva/layout/my_profile_layout/cubit/my_profile_layout_cubit.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarSliverAppBar extends StatelessWidget {
  GlobalKey? keyForBack;

  TabBarSliverAppBar({super.key, this.keyForBack});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyProfileLayoutCubit, MyProfileLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        MyProfileLayoutCubit cubit = MyProfileLayoutCubit.get(context);
        return SliverAppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: getProportionateScreenHeight(15),
          pinned: true,
          bottom: TabBar(
            indicatorColor: defaultColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.black,
            unselectedLabelStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            labelStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelColor: const Color(0xff9f9f9f),
            onTap: (index) {
              if (cubit.currentTabIndex == index) {
                Scrollable.ensureVisible(
                  keyForBack!.currentContext!,
                  duration: const Duration(milliseconds: 300),
                );
              } else {
                cubit.changeTabIndex(index);
              }
            },
            tabs: const [
              Tab(text: 'Post'),
              Tab(text: 'Prometing'),
            ],
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, 5),
                  blurRadius: 30,
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
