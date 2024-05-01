import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:sizer/sizer.dart';

import '../screens/setting_screen/setting_controller/theme_controller.dart';



SettingController controller = Get.find();


Widget ThemeImageWidget(String imagePath, Color color, Color txtColor,int index) {

  return InkWell(
    onTap: () {
      controller.changeThemeColor(color, txtColor, index);
    },
    child: Container(
      decoration: BoxDecoration(
        color: controller.selectedIndexTheme.value == index
            ? Colors.grey.withOpacity(0.2)
            : null,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image(
            image: AssetImage(imagePath),
            // height: 40.h,
            color:
            controller.selectedIndexTheme.value == index ? Colors.grey : null,
            colorBlendMode: BlendMode.modulate,
          ),
          if(controller.selectedIndexTheme.value == index)
             const Icon(
            Icons.check,
            color: Colors.white,
          )
        ],
      ),
    ),
  );
}