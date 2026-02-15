// ignore_for_file: deprecated_member_use

import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

class TabBarSliverAppBarHome extends StatelessWidget {
  const TabBarSliverAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 0,
      pinned: true,
      bottom: const TabBar(
        indicatorColor: defaultColor,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: defaultColor,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        unselectedLabelColor: Color(0xff9f9f9f),
        unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        tabs: [
          Tab(
            text: 'Home',
          ),
          Tab(
            text: "Explore",
          ),
        ],
      ),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: defaultColor.withOpacity(0.3),
              offset: const Offset(0, 5),
              blurRadius: 30,
            )
          ],
        ),
      ),
    );
  }
}
