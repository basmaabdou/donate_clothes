import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donate_clothes/ui/screens/users/profile_screen/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_profile/cubit.dart';
import 'cubit_profile/states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              builder: (context) => ProfileView(),
              fallback: (context) => Scaffold(body: Center(child: CircularProgressIndicator()))
          );
        },
      ),
    );
  }
}
