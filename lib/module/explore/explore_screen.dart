// ignore_for_file: avoid_print, must_be_immutable

import 'package:diva/module/explore/buildListExplore.dart';
import 'package:diva/module/explore/cubit/explore_cubit.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/local/cache_helper.dart';
import 'package:diva/shared/network/local/end_point.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreScreen extends StatelessWidget {
  BoxConstraints? constraints;
  ExploreScreen({super.key, this.constraints});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(CacheHelper.getData(key: TOKEN));
    return BlocProvider(
      create: (context) => ExploreCubit()..getData(),
      child: BlocConsumer<ExploreCubit, ExploreStates>(
        listener: (context, state) {},
        builder: (context, state) {
          ExploreCubit cubit = ExploreCubit().get(context);
          return Scaffold(
            body: state is ExploreGetDataLoadingState?
                ? const Center(child: CircularProgressIndicator())
                : cubit.dataRight.isEmpty && cubit.dataLeft.isEmpty
                    ? const Center(
                        child: Text(
                          "Opss... ,There are no posts. You can publish the first post",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColor,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildListExplore(
                              context: context,
                              constraints: constraints!,
                              list: cubit.dataRight,
                              isRight: true,
                            ),
                            buildListExplore(
                              context: context,
                              constraints: constraints!,
                              list: cubit.dataLeft,
                              isRight: false,
                            ),
                          ],
                        ),
                      ),
          );
        },
      ),
    );
  }
}

// child: SelectableText(
//   'ssssss',
//   style: TextStyle(color: Colors.white),
//   toolbarOptions: ToolbarOptions(
//     copy: true,
//   ),
// ),
// 'https://cdn5.vectorstock.com/i/thumb-large/45/59/profile-photo-placeholder-icon-design-in-gray-vector-37114559.jpg',
