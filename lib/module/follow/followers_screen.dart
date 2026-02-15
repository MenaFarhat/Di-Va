// ignore_for_file: must_be_immutable

import 'package:diva/module/follow/build_follow_pepole.dart';
import 'package:diva/module/follow/cubit/follow_cubit.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FollowersScreen extends StatelessWidget {
  int? userId;
  FollowersScreen({super.key, this.userId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.5,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
          ),
          centerTitle: true,
          title: const Text(
            'Followers',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: Padding(
          padding:
              EdgeInsetsDirectional.only(top: getProportionateScreenHeight(15)),
          child: BlocProvider(
            create: (context) => FollowCubit()..getFollowers(userId: userId),
            child: BlocConsumer<FollowCubit, FollowStates>(
              listener: (context, state) {},
              builder: (context, state) {
                FollowCubit cubit = FollowCubit.get(context);
                return state is FollowGetFollowersLoadingStates
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : cubit.followers!.isEmpty
                        ? const Center(
                            child: Text(
                              'There are no Followers.',
                            ),
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) {
                              return buildFollowPepole(
                                person: cubit.followers![index],
                                context: context,
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            itemCount: cubit.followers!.length,
                          );
              },
            ),
          ),
        ),
      ),
    );
  }
}

// Widget followepepole(String image, String name, BuildContext context) {
//   return Row(
//     children: [
//       Padding(
//         padding: EdgeInsets.all(8),
//         child: Container(
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: LinearGradient(
//               begin: Alignment(0.5, 0),
//               end: Alignment(0.5, 1),
//               colors: [defaultColor, defaultColor],
//             ),
//             border: Border.all(
//               color: Colors.transparent,
//               width: 3,
//             ),
//           ),
//           child: CircleAvatar(
//             backgroundImage: AssetImage(
//               image,
//             ),
//             radius: 30,
//           ),
//         ),
//       ),
//       SizedBox(width: 5),
//       Text(
//         name,
//         style: TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.w400,
//           fontStyle: FontStyle.italic,
//         ),
//       ),
//       SizedBox(width: 12),
//       IconButton(
//           onPressed: () {},
//           icon: Icon(
//             FluentIcons.chat_48_regular,
//             size: 25,
//             color: defaultColor,
//           )),
//       Spacer(),
//       IconButton(
//         onPressed: () {},
//         icon: Icon(
//           Icons.arrow_forward_ios_rounded,
//           size: 25,
//         ),
//       ),
//     ],
//   );
// }
