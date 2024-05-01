import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/ThemeImage.widget.dart';
import '../users/profile_screen/cubit_profile/cubit.dart';
import '../users/profile_screen/cubit_profile/states.dart';
import 'my_dontaion_view.dart';

class MyDonationScreen extends StatelessWidget {
  const MyDonationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ProfileCubit()..getProfileData(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (BuildContext context, ProfileStates state) {  },
        builder: (BuildContext context, ProfileStates state) {
          var cubit = ProfileCubit.get(context);
         // print(cubit.profileModel?.data!.orders!.length);
          return ConditionalBuilder(
              condition: cubit.profileModel != null  ,
              builder: (context) => MyDonationView(),
              fallback: (context) => Scaffold(body: Center(child: CircularProgressIndicator(color: controller.app)))
          );
        },
      ),
    );
  }
}
