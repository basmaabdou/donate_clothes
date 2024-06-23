import 'package:donate_clothes/ui/screens/layout_screen/layout_screen.dart';
import 'package:donate_clothes/ui/screens/setting_screen/setting_controller/theme_controller.dart';
import 'package:donate_clothes/ui/screens/setting_screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sizer/sizer.dart';

import '../../../../generated/l10n.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/default_container.dart';
import '../../splash_screen/splash_screen.dart';

class LanguageView extends GetView<SettingController> {
  SettingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: PreferredSize(
            preferredSize:
                const Size.fromHeight(0.0), // here the desired height
            child: AppBar(
              backgroundColor: controller.app,
              elevation: 0,
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Text(
                S.of(context).chooseLang,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).langInfo,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54),
              ),
              const Spacer(
                flex: 1,
              ),
              Row(
                children: [
                  DefaultContainer(
                    circleText: controller.selectedIndex.value == 0 ? 'ع' : 'A',
                    lang: controller.selectedIndex.value == 0
                        ? 'عربي'
                        : 'English',
                    backColor: Colors.white,
                    circleColor: Colors.white,
                    textColor: Colors.black,
                    onTap: () {
                      if (controller.selectedIndex.value == 0) {
                        controller.selectedIndex.value = 1;
                        S.load(const Locale('ar'));
                      } else {
                        controller.selectedIndex.value = 0;
                        S.load(const Locale('en'));
                      }
                    },
                  ),
                  const Spacer(),
                  DefaultContainer(
                    circleText: controller.selectedIndex.value == 0 ? 'A' : 'ع',
                    lang: controller.selectedIndex.value == 0
                        ? 'English'
                        : 'عربي',
                    backColor: Colors.black,
                    circleColor: controller.app,
                    textColor: Colors.white,
                    onTap: () {
                      if (controller.selectedIndex.value == 0) {
                        controller.selectedIndex.value = 0;
                        S.load(const Locale('ar'));
                      } else {
                        controller.selectedIndex.value = 1;
                        S.load(const Locale('en'));
                      }
                    },
                  )
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              Container(
                height: 4.h,
                width: double.infinity,
                child: DefaultButton(
                  text: S.of(context).saveChang,
                  fun: () {
                    Get.to(SettingScreen());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
