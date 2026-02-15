import 'package:diva/layout/home_layout/components/part_top_home_sliver_app_bar.dart';
import 'package:diva/layout/home_layout/components/tab_bar_sliver_app_bar_home.dart';
import 'package:diva/module/explore/explore_screen.dart';
import 'package:diva/module/home_post/home_post_screen.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  static String routeName = "/HomeLayout";

  const HomeLayout({super.key});

// TabController s=TabController(length: 2,vsync: this);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SafeArea(
        bottom: false,
        // maintainBottomViewPadding: true,
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            // extendBody: true,
            body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  const PartTopHomeSliverAppBar(),
                  const TabBarSliverAppBarHome(),
                ];
              },
              body: TabBarView(
                physics: const PageScrollPhysics(),
                children: [
                  const HomePostScreen(),
                  ExploreScreen(constraints: constraints),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
