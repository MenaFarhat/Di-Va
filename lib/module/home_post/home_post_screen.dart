// ignore_for_file: avoid_print

import 'package:diva/module/follow/cubit/follow_cubit.dart';
import 'package:diva/module/home_post/components/buid_my_stoey.dart';
import 'package:diva/module/home_post/components/buid_post_home_item.dart';
import 'package:diva/module/home_post/components/buid_stoey_item.dart';
import 'package:diva/module/home_post/cubit/home_post_cubit.dart';
import 'package:diva/module/story/story_screen.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/network/local/cache_helper.dart';
import 'package:diva/shared/network/local/end_point.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// PusherService pusherService = PusherService();

// class HomePostScreen extends StatelessWidget {
//   static String routeName = "/HomePost";

//   @override
//   Widget build(BuildContext context) {
//     var token = CacheHelper.getData(key: TOKEN);
//     var useId = CacheHelper.getData(key: USERID);
//     print(token);
//     print(useId);
//     // pusherService.listen(
//     //     pusher, 'App.Models.User.3.Post', "App\\Events\\PostEvent");
//     // pusherService.listen(
//     pusher, 'private-App.Models.User.1.Post', "App\\Events\\PostEvent");

//     SizeConfig().init(context);

//     return Scaffold(
//       body: Center(
//         child: Text('sss'),
//       ),
//     );
//   }
// }

class HomePostScreen extends StatelessWidget {
  static String routeName = "/HomePost";

  const HomePostScreen({super.key});
  // LaravelFlutterPusher pusher =
  //     pusherService.initPusher("12345", "192.168.1.104", 6001, "mt1");
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    print(CacheHelper.getData(key: TOKEN));
    return BlocProvider(
      create: (context) => FollowCubit(),
      // ..getFollowing(userId: CacheHelper.getData(key: USERID)),
      child: BlocConsumer<FollowCubit, FollowStates>(
          listener: (context, state) {},
          builder: (context, state) {
            // FollowCubit cubitF = FollowCubit.get(context);
            // if (cubitF.following!.length > 0) {
            //   cubitF.following!.forEach(
            //     (FollowAndBlockModel element) {
            //       pusherService.listen(
            //         pusher,
            //         'private-App.Models.User.${element.userId}.Post',
            //         "App\\Events\\PostEvent",
            //         context,
            //       );
            //     },
            //   );
            // }
            return BlocProvider(
              create: (context) => HomePostCubit()..getHomePost(),
              child: BlocConsumer<HomePostCubit, HomePostStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  HomePostCubit cubit = HomePostCubit.get(context);
                  return Scaffold(
                    body: state is GetHomePostsErrorStates
                        ? const Center(
                            child: Text(
                              "Opss... You lost concted",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          )
                        : state is GetHomePostsLoadingStates
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsetsDirectional.only(
                                          start:
                                              getProportionateScreenWidth(12),
                                          top:
                                              getProportionateScreenHeight(16)),
                                      height: getProportionateScreenHeight(130),
                                      child: Row(
                                        children: [
                                          const buidMyStoey(),
                                          SizedBox(
                                              width:
                                                  getProportionateScreenWidth(
                                                      10)),
                                          Flexible(
                                            child: ListView.separated(
                                              physics: const BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return buidStoeyItem(
                                                  onPress: () {
                                                    navigateTo(
                                                      context,
                                                      StoryScreen(
                                                        user: cubit.data!
                                                            .stories![index],
                                                        users:
                                                            cubit.data!.stories,
                                                      ),
                                                    );
                                                  },
                                                  name: cubit.data!
                                                      .stories![index].name,
                                                  photo: cubit.data!
                                                      .stories![index].photo,
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) => SizedBox(
                                                width:
                                                    getProportionateScreenWidth(
                                                        10),
                                              ),
                                              itemCount:
                                                  cubit.data!.stories!.length,
                                            ),
                                          ),
                                          // ),
                                        ],
                                      ),
                                    ),
                                    const Divider(
                                      color: Color(0xff9a9ea4),
                                      thickness: 1,
                                    ),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          buidPostHomeItem(
                                        index: index,
                                        context: context,
                                        post: cubit
                                            .data!.posts!.homeModel![index],
                                      ),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(
                                        height: 20,
                                      ),
                                      itemCount:
                                          cubit.data!.posts!.homeModel!.length,
                                    ),
                                  ],
                                ),
                              ),
                  );
                },
              ),
            );
          }),
    );
  }
}
