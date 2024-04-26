import 'package:donate_clothes/ui/screens/theme_screen/theme_controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class SmoothIndicatorWidget extends StatelessWidget {
  PageController borderController;
   SmoothIndicatorWidget({super.key,required this.borderController});

  @override
  Widget build(BuildContext context) {
    ThemeController controller = Get.find();
    return SmoothPageIndicator(
      controller: borderController,
      count: 4,
      effect: WormEffect(
        dotColor: Colors.grey.withOpacity(.4),
        activeDotColor: controller.app,
        dotHeight: 8,
        dotWidth: 8,
      ),
    );
  }
}
