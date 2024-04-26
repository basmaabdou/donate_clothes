import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../screens/donate_clothes_details_screen/donate_clothes_details.dart';
import '../screens/our_work_screen/work_screen.dart';
import 'animation.dart';
import 'default_text_form_field..dart';

class OurRecentWork extends StatelessWidget {

  final String img,title,description;

  const OurRecentWork({super.key, required this.img, required this.description, required this.title});
  @override
  Widget build(BuildContext context) {
    double _currentSliderValue = 20;
    return  InkWell(
      onTap: (){
        Navigator.push(context,ScaleTransition1( OurWorkScreen(img: img, description: description, title: title,)));
      },
      child: Container(
        width: 47.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(20),
            color: Color(0xffFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      width: 360,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(img),
                            fit: BoxFit.fill
                        ),
                      ),
                    ),
                    Container(
                      height: 15,
                      width: 63,
                      decoration: BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadiusDirectional.only(bottomStart:Radius.circular(20))
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.only(start: 4),
                        child: Row(
                          children: [
                            Icon(Icons.access_time_outlined,size: 8,color: controller2.app,),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '12 day left',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 8,
                                color:controller2.app,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                 title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: controller2.app,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                // LinearPercentIndicator(
                //   width: 290.0,
                //   lineHeight: 7.0,
                //   percent: 0.5,
                //   barRadius: Radius.circular(10),
                //   progressColor: Color(0xffF74F22),
                // ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                  //  Spacer(),
                    Container(
                      width: 73,
                      height: 26,
                      decoration: BoxDecoration(
                          color: controller2.app,
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.push(context,FadeRoute2(DonateClothesDetails()));
                          },
                        child: Text(
                          'donate',
                          style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

