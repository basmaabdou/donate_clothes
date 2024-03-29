import 'dart:async';

import 'package:flutter/material.dart';

import '../onboarding_screen/on_boarding_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds:5),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => OnBoardingScreen()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF74F22),
        body: Container(
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Charity',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0, 3),
                        blurRadius: 5.0,
                          color: Colors.grey
                        // color: Colors.grey.withOpacity(0.5),
                      ),
                      Shadow(
                        offset: Offset(0, 3),
                        blurRadius: 5.0,
                        color: Colors.grey
                        // color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                    color: Color(0xffFFFFFF),
                    fontSize: 47,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
