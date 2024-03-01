import 'package:donate_clothes/ui/screens/brand_screen/brand_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShareBrands extends StatefulWidget {
  String image;
  String id;
  int? isSelectedIndex ;
  bool isSelected ;


  ShareBrands({super.key, required this.image, required this.id,    this.isSelected = false,
  this.isSelectedIndex
  });

  @override
  State<ShareBrands> createState() => _ShareBrandsState();
}

class _ShareBrandsState extends State<ShareBrands> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        setState(() {
          widget.isSelected = !widget.isSelected;
          BrandCubit.get(context).idBrand=widget.id;

        });
      },
      child: Container(
        width: 158,
        height: 165,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: widget.isSelected ? Colors.red : Colors.transparent,
            width: 2,
          ),
          image: DecorationImage(
            image: NetworkImage(widget.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
