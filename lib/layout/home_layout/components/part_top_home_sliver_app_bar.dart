import 'package:diva/module/search/custom_search_delegate_secreen.dart';
import 'package:diva/shared/components/constants.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:diva/shared/cubit/app_cubit.dart';
import 'package:diva/shared/network/remote/end_points.dart';
import 'package:diva/shared/styes/colors.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PartTopHomeSliverAppBar extends StatelessWidget {
  const PartTopHomeSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SliverAppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: getProportionateScreenHeight(60),
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 10),
        child: BlocBuilder<AppCubit, AppStates>(
          // listener: (context, state) {},
          builder: (context, state) {
            AppCubit appCubit = AppCubit.get(context);
            return IconButton(
              icon: Icon(
                appCubit.iconTheme,
                size: 35,
                color: defaultColor,
              ),
              onPressed: () {
                appCubit.changeAppMode();
              },
            );
          },
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegateSecreen(
                // items: People,
                searchLabel: 'Search people',
                suggestion: const Center(
                  child: Text('Filter people by name'),
                ),
                failure: const Center(
                  child: Text('No person found :('),
                ),
                // filter: (person) => [person.name],

                builder: (person) => ListTile(
                  onTap: () {
                    // navigateTo(
                    //     context,
                    //     ProfileScreen(
                    //       userId: person.userId,
                    //     ));
                  },
                  title: Text(person.name),
                  leading: person.photo != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(
                            "$HOST/$USERIMAGE/${person.photo}",
                          ),
                        )
                      : const CircleAvatar(
                          backgroundImage: AssetImage(
                            USERIMAGENULL,
                          ),
                        ),
                ),
              ),
            );
          },
          icon: const Icon(
            // IconBroken.Search,
            FluentIcons.people_search_24_regular,
            // .search,
            size: 35,
            color: defaultColor,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
