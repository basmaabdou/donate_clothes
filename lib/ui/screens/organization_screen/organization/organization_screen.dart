import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/ThemeImage.widget.dart';
import '../organization_cubit/cubit.dart';
import '../organization_cubit/states.dart';
import 'organization_view.dart';


class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => OrganizationCubit()..getAllOrganizationData(
      ),
      child: BlocConsumer<OrganizationCubit,OrganizationStates>(
        listener: ( context,  state) {  },
        builder: ( context,state) {
          var cubit = OrganizationCubit.get(context);
          return ConditionalBuilder(
              condition: cubit.organizationResponse != null  ,
              builder: (context) => OrganizationView(),
              fallback: (context) => Scaffold(body: Center(child: CircularProgressIndicator(color: controller.app)))
          );
        },
      ),
    );
  }
}
