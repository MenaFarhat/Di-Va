// ignore_for_file: must_be_immutable

import 'package:diva/layout/my_profile_layout/components/part_top_profile.dart';
import 'package:diva/layout/my_profile_layout/components/part_top_profile_sliver_app_bar.dart';
import 'package:diva/layout/my_profile_layout/components/tab_bar_sliver_app_bar.dart';
import 'package:diva/layout/profile/cubit/profile_cubit.dart';
import 'package:diva/module/profile_post/profile_post_sceen.dart';
import 'package:diva/module/profile_prometed/profile_prometed_screen.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  int? userId;
  ProfileScreen({super.key, 
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ScrollController scrollController = ScrollController();
    GlobalKey keyForBack = GlobalKey();
    return BlocProvider(
      create: (context) => ProfileCubit()
        ..getDataProfile(
          userId: userId,
        ),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if (state is ProfileBlockUserErrorStates) {
            showToast(
              text: state.error,
              state: ToastState.ERROR,
            );
          }
          if (state is ProfileBlockUserSucssesStates) {
            Navigator.pop(context);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          ProfileCubit cubit = ProfileCubit.get(context);
          return SafeArea(
            bottom: false,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                body: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      PartTopProfileSliverAppBar(
                        onPressed: () {
                          showMenu(
                            context: context,
                            position:
                                const RelativeRect.fromLTRB(double.infinity, 0, 0, 0),
                            items: [
                              PopupMenuItem(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return alertDialog(
                                          title: 'Block',
                                          context: context,
                                          onPressed: () {
                                            cubit.blockUser(
                                              userId: userId,
                                            );
                                          },
                                        );
                                      },
                                    );
                                  },
                                  leading: const Icon(
                                    Icons.block,
                                    color: Colors.red,
                                  ),
                                  title: const Text(
                                    'Block',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        scrollController: scrollController,
                        keyForBack: keyForBack,
                        icon: Icons.more_vert_rounded,
                        background: state is ProfileGetDataLoadingStates
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : PartTopProfile(
                                context: context,
                                scrollController: scrollController,
                                userId: userId,
                                data: cubit.profileData!,
                                isMe: false,
                              ),
                      ),
                      TabBarSliverAppBar(
                        keyForBack: keyForBack,
                      ),
                    ];
                  },
                  controller: scrollController,
                  body: TabBarView(
                    children: [
                      state is ProfileGetDataLoadingStates
                          ? const Scaffold(
                              body: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : PeofilePostScreen(
                              posts: cubit.profileData!.posts,
                            ),
                      state is ProfileGetDataLoadingStates
                          ? const Scaffold(
                              body: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : ProfilePrometedScreen(
                              posts: cubit.profileData!.postsPrometed,
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
