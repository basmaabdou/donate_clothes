import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../widgets/animation.dart';
import '../donate_clothes_details_screen/donate_clothes_details.dart';
import '../home_screen/home_cubit/cubit.dart';

class OurWorkScreen extends StatelessWidget {
  String img, title, description;
   OurWorkScreen({super.key, required this.img, required this.description, required this.title});


  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar:AppBar(
        backgroundColor: const Color(0xffFFFFFF),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,size: 25,color: Color(0xffF74F22)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20,end: 20,bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 241,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(img),
                    fit: BoxFit.fill
                ),
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
                    color: Color(0xffF74F22),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.favorite_sharp,size: 25,color: Color(0xffF74F22))
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
                color: Color(0xffF74F22),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 338,
              height: 81,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffF1DCC7).withOpacity(.1)
              ),
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
                      progressColor: Color(0xffF74F22),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_rounded,
                          color: Color(0xffF74F22),
                          size: 14,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4562',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 10,
                              color: Color(0xffF74F22)),
                        ),
                        SizedBox(
                          width: 5,
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
                          width: 73,
                          height: 26,
                          decoration: BoxDecoration(
                              color: Color(0xffF74F22),
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                           onPressed: () {Navigator.push(context,FadeRoute2(DonateClothesDetails()));},
                            child: Text(
                              'donate',
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