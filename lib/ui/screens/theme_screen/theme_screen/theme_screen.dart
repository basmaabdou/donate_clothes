
import 'package:donate_clothes/ui/screens/onboarding_screen/on_boarding_screen.dart';
import 'package:donate_clothes/ui/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/constants.dart';
import '../../../widgets/ThemeImage.widget.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_text_button.dart';
import '../../../widgets/smooth_indicator.dart';
import '../theme_controller/theme_controller.dart';


class ThemeScreen extends GetView<ThemeController> {
  ThemeController controller = Get.find();



  @override
  Widget build(BuildContext context) {
    return  Obx(
        ()=> Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0.0), // here the desired height
              child: AppBar(
                backgroundColor: controller.app,
                elevation: 0,
              )),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child:  Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back_ios,size: 2.5.h,color: controller.app,)),
                    SizedBox(width: 7.h,),
                    Text(
                      'Change Theme',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                       'Orange',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        'Green',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7,),
                Row(
                  children: [
                    Expanded(
                        child:  ThemeImageWidget('assets/images/orange.jpg', defaultColor, textOrangeTheme, 0)
                    ),
                    const SizedBox(width: 15),

                    Expanded(
                      child:  ThemeImageWidget(
                          'assets/images/greenTheme.jpg', defaultGreenColor,textGreenTheme, 1),
                    ),
                  ],
                ),
                const Spacer(
                  flex: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info,
                      color: controller.app,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                     "You con change the theme later",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),

                SizedBox(height: 20,),
                Container(
                  height: 4.h,
                  width: double.infinity,
                  child: DefaultButton(text: 'Save Change', fun: (){
                    Get.to(SplashScreen());
                  },),
                ),
             ],
            ),
          ),
        ),
    );
  }


}
