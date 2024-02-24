import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../users/profile_screen/cubit_profile/cubit.dart';
import '../users/profile_screen/cubit_profile/states.dart';
import 'coins_view.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileCubit()..getProfileData(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (BuildContext context, ProfileStates state) {  },
        builder: (BuildContext context, ProfileStates state) {
          var cubit = ProfileCubit.get(context);
          return ConditionalBuilder(
              condition: cubit.profileModel != null  ,
              builder: (context) => CoinsView(),
              fallback: (context) => Scaffold(body: Center(child: CircularProgressIndicator()))
          );
        },
      ),
    );
  }
}
