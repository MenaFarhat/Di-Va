import 'package:diva/layout/my_profile_layout/cubit/my_profile_layout_cubit.dart';
import 'package:diva/models/follow_model.dart';
import 'package:diva/shared/components/constants.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
Widget peopleBlockBottomSheet(context) {
  MyProfileLayoutCubit.get(context).blocking();
  return Column(
    children: [
      Divider(
        color: defaultColor,
        thickness: 4,
        height: 20,
        indent: MediaQuery.of(context).size.width / 2 - 30,
        endIndent: MediaQuery.of(context).size.width / 2 - 30,
      ),
      BlocConsumer<MyProfileLayoutCubit, MyProfileLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          MyProfileLayoutCubit cubit = MyProfileLayoutCubit.get(context);

          return Expanded(
            child: state is MyProfileBlockingLoadingStates
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.separated(
                    itemCount: cubit.blockingPeople!.length,
                    itemBuilder: (context, index) => blockPeopleItem(
                      person: cubit.blockingPeople![index],
                      cubit: cubit,
                    ),
                    separatorBuilder: (context, index) => const Divider(
                      height: 10,
                      thickness: 2,
                      // indent: MediaQuery.of(context).size.width / 4, //- 100,
                      // endIndent: MediaQuery.of(context).size.width / 8,
                      endIndent: 100,
                      // (MediaQuery.of(context).size.width / 4),
                    ),
                  ),
          );
        },
      ),
    ],
  );
}

Widget blockPeopleItem({
  required FollowAndBlockModel person,
  required MyProfileLayoutCubit cubit,
}) {
  return ListTile(
    leading: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: defaultColor,
            width: 3,
          ),
        ),
        child: person.photo != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(
                  "$HOST/$USERIMAGE/${person.photo!}",
                ),
              )
            : const CircleAvatar(
                backgroundImage: AssetImage(
                  USERIMAGENULL,
                ),
              )),
    trailing: IconButton(
      onPressed: () {
        cubit.uNblockUser(userId: person.userId);
      },
      icon: const Icon(
        Icons.person_off_outlined,
      ),
      color: defaultColor,
    ),
    title: Text(
      person.name!,
      style: const TextStyle(
        fontStyle: FontStyle.italic,
      ),
    ),
  );
}
