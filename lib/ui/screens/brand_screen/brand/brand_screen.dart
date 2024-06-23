import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/ThemeImage.widget.dart';
import '../../organization_screen/organization_cubit/cubit.dart';
import '../brand_cubit/cubit.dart';
import '../brand_cubit/states.dart';
import 'brand_view.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BrandCubit()..getAllBrandsData(),
      child: BlocConsumer<BrandCubit, BrandStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = BrandCubit.get(context);
          return ConditionalBuilder(
              condition: cubit.brandsResponse != null,
              builder: (context) => BrandView(),
              fallback: (context) => Center(
                  child: CircularProgressIndicator(color: controller.app)));
        },
      ),
    );
  }
}
