// ignore_for_file: must_be_immutable

import 'package:diva/layout/my_profile_layout/components/buid_post_profile_item.dart';
import 'package:diva/models/post_model.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';

class PeofilePostScreen extends StatelessWidget {
  List<PostModel>? posts;

  PeofilePostScreen({super.key, 
    required this.posts,
  });
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.only(
            top: getProportionateScreenHeight(20),
            end: getProportionateScreenWidth(10),
            start: getProportionateScreenWidth(10)),
        child:
            // BlocConsumer<MyProfileLayoutCubit, MyProfileLayoutStates>(
            //   listener: (context, state) {},
            //   builder: (context, state) {
            //     MyProfileLayoutCubit cubit = MyProfileLayoutCubit.get(context);
            // return
            posts!.isEmpty
                ? const Center(
                    child: Text(
                      'Opss... ,There are no posts. You can publish the first post',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  )
                : GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: posts!.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: getProportionateScreenWidth(10),
                      mainAxisSpacing: getProportionateScreenHeight(10),
                    ),
                    itemBuilder: (context, index) => buidPostProfileItem(
                      post: posts![index],
                      context: context,
                    ),
                  ),
        //   },
        // ),
      ),
    );
  }
}
