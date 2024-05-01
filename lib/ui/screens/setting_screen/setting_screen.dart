
import 'package:donate_clothes/ui/screens/setting_screen/lang_screen/lang_view.dart';
import 'package:donate_clothes/ui/screens/setting_screen/setting_controller/theme_controller.dart';
import 'package:donate_clothes/ui/screens/setting_screen/theme_screen/theme_screen.dart';
import 'package:donate_clothes/ui/screens/users/login_screen.dart';
import 'package:donate_clothes/ui/screens/users/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/l10n.dart';
import '../../../shared/constants.dart';
import '../../widgets/logout.dart';
import '../../widgets/setting_row.dart';
import '../layout_screen/layout_screen.dart';

class SettingScreen extends StatelessWidget {
  SettingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return  Obx(
        ()=> Scaffold(
          appBar: PreferredSize(
              preferredSize:
              const Size.fromHeight(0.0), // here the desired height
              child: AppBar(
                backgroundColor: controller.app,
                elevation: 0,
              )),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.5.h),
            child: SingleChildScrollView(
              child:
              Directionality(
                textDirection:controller.selectedIndex == 0  ? TextDirection.ltr:TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 2.5.h,
                        color: controller.app,
                      ),
                      onTap: () {
                        Get.to(() => LayoutScreen());
                      },
                    ),
                    SizedBox(height: 5.h),
                    Center(
                      child: Text(
                        S.of(context).welcome,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 4.h,
                            decoration: BoxDecoration(
                              color: controller.app == defaultColor
                                  ? defaultColor
                                  : defaultGreenColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: MaterialButton(
                              onPressed: () {
                                Get.to(() => RegisterScreen());
                              },
                              child: Text(
                                S.of(context).register,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: controller.app == defaultColor
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 1.h,
                        ),
                        Expanded(
                          child: Container(
                            height: 4.h,
                            decoration: BoxDecoration(
                                color: controller.app == defaultColor
                                    ? defaultColor
                                    : defaultGreenColor,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: controller.app)),
                            child: MaterialButton(
                              onPressed: () {
                                Get.to(() => LoginScreen());
                              },
                              child: Text(
                                S.of(context).login,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: controller.app == defaultColor
                                        ? Colors.black
                                        : Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    SettingRow(
                      txt: S.of(context).changetheme,
                      endText: '',
                      onTap: () {
                        Get.to(() => ThemeScreen());
                      },
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SettingRow(
                        txt: S.of(context).lang,
                        endText: controller.selectedIndex == 1 ? 'العربيه' : 'English',
                        onTap: () {
                          Get.to(() => LanguageView());
                        }),
                    SizedBox(
                      height: 4.h,
                    ),
                    controller.selectedIndex == 0
                        ? LogOutWidget()
                        : Directionality(
                      textDirection: TextDirection.rtl,
                      child: LogOutWidget(),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(vertical: 10),
                      child: Container(
                        width: double.infinity,
                        height: 0.99,
                        color: Color(0xffCECDD0),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SettingRow(
                      txt: S.of(context).aboutus,
                      endText: '',
                      onTap: () {
                        //  Get.to(() => AboutUsView());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
