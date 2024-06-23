import 'package:donate_clothes/shared/constants.dart';
import 'package:donate_clothes/ui/widgets/ThemeImage.widget.dart';
import 'package:donate_clothes/ui/widgets/basic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/animation.dart';
import '../../widgets/default_text_form_field..dart';
import '../donate_clothes_details_screen/donate_clothes_details.dart';
import '../home_screen/home_cubit/cubit.dart';

class OurWorkScreen extends StatelessWidget {
  String img, title, description;
  OurWorkScreen(
      {super.key,
      required this.img,
      required this.description,
      required this.title});

  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 25, color: controller2.app),
        ),
      ),
      body: Padding(
        padding:
             EdgeInsetsDirectional.only(start: 3.h, end: 3.h, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:
                    DecorationImage(image: NetworkImage(img), fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: controller2.app,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.favorite_sharp, size: 25, color: controller2.app)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Color(0xff000000),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'The donation process is now available',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: controller2.app,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 15.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF1DCC7).withOpacity(.1)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    LinearPercentIndicator(
                      width: 290.0,
                      lineHeight: 7.0,
                      percent: 0.5,
                      barRadius: Radius.circular(10),
                      progressColor: controller2.app,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_rounded,
                          color: controller2.app,
                          size: 16,
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                        Text(
                          '4562',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: controller2.app),
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                        Text(
                          'doners',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 15.h,
                          height: 4.h,
                          decoration: BoxDecoration(
                              color: controller2.app,
                              borderRadius: BorderRadius.circular(1.h)),
                          child: MaterialButton(
                            onPressed: () {
                              donateBottomSheet(context);
                            },
                            child: Text(
                              'Donate Now',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
