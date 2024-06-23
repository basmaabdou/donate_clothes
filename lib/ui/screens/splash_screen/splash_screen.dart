import 'dart:async';
import 'package:donate_clothes/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../onboarding_screen/on_boarding_screen.dart';
import '../setting_screen/setting_controller/theme_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => OnBoardingScreen()),
            (route) => false));
  }

  SettingController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            controller.app == defaultBlueColor
                ? 'assets/images/blueLogo.jpg'
                : controller.app == defaultGreenColor
                    ? 'assets/images/greenLogo.jpg'
                    : 'assets/images/orangeLogo.jpg',
            fit: BoxFit.fill,
          ),
        ],
      ),
    );

    //   Scaffold(
    //   backgroundColor: controller.app,
    //     body: Container(
    //       child:  Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Column(
    //               children: [
    //                 // ClipRRect(
    //                 //   borderRadius: BorderRadius.circular(20.0),
    //                 //   child: Image(
    //                 //     width: 400,
    //                 //     height: 400,
    //                 //     image: AssetImage("assets/images/logo.jpg"),
    //                 //   ),
    //                 // ),
    //                 Text(
    //                   'Charity',
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(
    //                     shadows: <Shadow>[
    //                       Shadow(
    //                         offset: Offset(0, 3),
    //                         blurRadius: 5.0,
    //                           color: Colors.grey
    //                         // color: Colors.grey.withOpacity(0.5),
    //                       ),
    //                       Shadow(
    //                         offset: Offset(0, 3),
    //                         blurRadius: 5.0,
    //                         color: Colors.grey
    //                         // color: Colors.grey.withOpacity(0.5),
    //                       ),
    //                     ],
    //                     color: Color(0xffFFFFFF),
    //                     fontSize: 47,
    //                     fontWeight: FontWeight.bold,
    //                     fontStyle: FontStyle.italic,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     )
    // );
  }
}
