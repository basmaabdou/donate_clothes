import 'package:flutter/material.dart';

import '../screens/brand_screen/brand_detail/brand_details_screen.dart';
import 'basic.dart';
class BrandsLogo extends StatelessWidget {

  final String image;

  const BrandsLogo({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context, BrandDetailsScreen());
      },
      child: Container(
        width: 339,
        height: 169,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffF74F22)),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
          image: DecorationImage(
            image: NetworkImage(image),
          ),
        ),
      ),
    );
  }
}
