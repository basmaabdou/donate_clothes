import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/ThemeImage.widget.dart';
import 'home_cubit/cubit.dart';
import 'home_cubit/states.dart';
import 'home_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()..getDonationData(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, HomeStates state) {},
        builder: (BuildContext context, HomeStates state) {
          var cubit = HomeCubit.get(context);
          return ConditionalBuilder(
              condition: cubit.donationCardResponse != null,
              builder: (context) => HomeView(),
              fallback: (context) => Scaffold(
                      body: Center(
                          child: CircularProgressIndicator(
                    color: controller.app,
                  ))));
        },
      ),
    );
  }
}
