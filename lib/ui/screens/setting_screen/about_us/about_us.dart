import 'package:donate_clothes/ui/widgets/basic.dart';
import 'package:donate_clothes/ui/widgets/question_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/constants.dart';
import '../../../widgets/ThemeImage.widget.dart';
import '../../../widgets/default_text_form_field..dart';
import '../../donate_clothes_details_screen/donate_clothes_details.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(controller.app == defaultBlueColor
                                ? 'assets/images/blueLogo.jpg'
                                : controller.app == defaultGreenColor
                                    ? 'assets/images/greenLogo.jpg'
                                    : 'assets/images/orangeLogo.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Center(
                        child: Text(
                          'About Us',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 4.h,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 2.5.h,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        iconSize: 3.h,
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image(
                          image: AssetImage('assets/images/gaza.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.h,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aid for Gaza Children',
                          style: TextStyle(
                              fontSize: 2.h,
                              fontWeight: FontWeight.w700,
                              color: controller.app),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Children in Gaza need life-saving support',
                          style: TextStyle(
                            fontSize: 1.1.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          'Your contributions will provide critical support to children in Gaza, offering them access to education, healthcare, and essential supplies in a region deeply affected by conflict and poverty.',
                          style: TextStyle(
                            fontSize: 1.h,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Helping Today',
                          style: TextStyle(
                              fontSize: 2.h,
                              fontWeight: FontWeight.w700,
                              color: controller.app),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          'Our Goal is to Help Poor People',
                          style: TextStyle(
                            fontSize: 1.1.h,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          'Today, we supported the education of 20000 children born in poor families cross 12 undeveloped countries over the world . in the future, our goals are',
                          style: TextStyle(
                            fontSize: 1.h,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.check_circle_outline,color: controller.app,size: 2.h,),
                            Text(
                              'Have enough food for life.',
                              style: TextStyle(
                                fontSize: 1.h,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.check_circle_outline,color: controller.app,size: 2.h,),
                            Text(
                              'Poor children can return to school.',
                              style: TextStyle(
                                fontSize: 1.h,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.check_circle_outline,color: controller.app,size: 2.h,),
                            Text(
                              'Support poor people to have better jobs.',
                              style: TextStyle(
                                fontSize: 1.h,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 1.h,
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image(
                          image: AssetImage('assets/images/gaza4.jpeg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Asked Quesitons',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: controller.app
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    'We Need Your Help',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AnimatedContainerWidget(
                      question: 'Clothe a Life, Spread Warmth.',
                      answer: 'Clothe a Life, Spread Warmth. Your donations can provide essential clothing for those in need. We accept new and gently used clothing items of all sizes and types. Every piece of clothing can make a significant difference in someone\'s life. From warm winter coats to summer dresses, your contributions help keep families clothed throughout the year. Clothing is a basic necessity that many take for granted, it\'s a luxury they cannot afford. By donating, you are ensuring that everyone has the dignity and comfort of appropriate attire.',
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AnimatedContainerWidget(
                    question: 'Empower Families, Transform Lives.',
                    answer: 'Empower Families, Transform Lives. Your monetary donations can have a profound effect on poor families. Financial contributions enable us to provide immediate assistance, support sustainable development, and create lasting change in the lives of those in need. With your help, we can fund educational programs, healthcare initiatives, Every dollar donated goes directly to those in need, helping to break the cycle of poverty and build a brighter future. Your generosity can transform lives, providing hope and opportunity where it is needed most.'
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  AnimatedContainerWidget(
                    question: 'Nourish and Furnish Hope.',
                    answer: 'Nourish and Furnish Hope. Your support in providing food and furniture can drastically improve the quality of life for many families. Donations of non-perishable food items and gently used furniture are greatly appreciated and will be put to good use. Imagine the joy and relief of a family receiving a hearty meal or a comfortable bed to sleep in. Your contributions ensure that no one has to go hungry or live in an empty home. Together, we can nourish bodies and furnish homes, spreading hope and comfort to those who need it most.'
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image(
                              image: AssetImage('assets/images/donateCloth.jpeg'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 1.h,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              'clothes donation',
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'By donating your clothes, you are providing warmth, comfort, and a sense of dignity to those in need. Imagine the joy and gratitude of a child who receives a warm winter.',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            ),
                            Divider(
                              color: Colors.grey, // Color of the line
                              thickness: 1,        // Thickness of the line
                            ),
                            Container(
                              width: 20.h,
                              height: 4.h,
                              decoration: BoxDecoration(
                                  color: controller2.app,
                                  borderRadius: BorderRadius.circular(1.h)),
                              child: MaterialButton(
                                onPressed: () {
                                  navigateTo(context, DonateClothesDetails());
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'Donate Now',
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(width: 1.h,),
                                    Icon(Icons.favorite_sharp, size: 3.h, color: Colors.white)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
