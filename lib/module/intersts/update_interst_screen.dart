// ignore_for_file: must_be_immutable

import 'package:diva/layout/app_layout/cubit/app_layout_cubit.dart';
import 'package:diva/module/intersts/cubit/intersts_cubit.dart';
import 'package:diva/module/intersts/interests_screen.dart';
import 'package:diva/shared/components/components.dart';
import 'package:diva/shared/components/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UpdateInterestsScreen extends StatelessWidget {
  List<int>? interest;
  UpdateInterestsScreen({super.key, required this.interest});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => InterstsCubit()..getintest(interest: interest!),
      child: BlocConsumer<InterstsCubit, InterstsStates>(
        listener: (context, state) {
          if (state is UpdateInsterstsSucssesState) {
            AppLayoutCubit.get(context).changeBottomNav(3);
            Navigator.pop(context);
            // navigateTo(
            //   context,
            //   AppLayout(),
            // );
          }
          if (state is UpdateInsterstsErrorState) {
            showToast(
              text: state.error,
              state: ToastState.ERROR,
            );
          }
        },
        builder: (context, state) {
          InterstsCubit cubit = InterstsCubit.get(context);
          return interstScreen(
            text: 'Update',
            context: context,
            selected: cubit.selected,
            selectedForAPI: cubit.selectedForAPI,
            cubit: cubit,
            isUpdate: true,
          );
        },
      ),
    );
  }
}
