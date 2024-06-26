import 'package:donate_clothes/ui/screens/my_dontaion_screen/my_donation_screen.dart';
import 'package:donate_clothes/ui/widgets/basic.dart';
import 'package:donate_clothes/ui/widgets/default_text_form_field..dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeSliderItem extends StatelessWidget {
  final String image;
  final String text1;
  final String? text2;
  final String? text3;
  const HomeSliderItem(
      {super.key,
      required this.image,
      required this.text1,
      this.text2,
      this.text3});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 226,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            // height: 81,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20),
                    topEnd: Radius.circular(20),
                    bottomEnd: Radius.circular(10),
                    bottomStart: Radius.circular(10)),
                color: Color(0xff000000).withOpacity(.5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  text1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateTo(context, MyDonationScreen());
                  },
                  child: Text(
                    text2 ?? "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Colors.purpleAccent,
                    ),
                  ),
                ),
                Text(
                  text3 ?? "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
