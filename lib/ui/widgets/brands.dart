import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../screens/brand_screen/brand_detail/brand_details_screen.dart';
import 'basic.dart';
import 'default_text_form_field..dart';
class BrandsLogo extends StatelessWidget {

  final String image,id;

  const BrandsLogo({super.key, required this.image, required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, BrandDetailsScreen(id: id,));
      },
      child: Container(
        width: double.infinity,
        height:20.h,
        decoration: BoxDecoration(
          border: Border.all(color: controller2.app),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
