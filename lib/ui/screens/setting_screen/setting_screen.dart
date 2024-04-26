
import 'package:donate_clothes/ui/screens/theme_screen/theme_controller/theme_controller.dart';
import 'package:donate_clothes/ui/screens/users/login_screen.dart';
import 'package:donate_clothes/ui/screens/users/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants.dart';
import '../../widgets/setting_row.dart';
import '../theme_screen/theme_screen/theme_screen.dart';

class SettingScreen extends StatelessWidget {
  ThemeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                    Get.back();
                  },
                ),
                SizedBox(height: 5.h),
                Center(
                  child: Text(
                    'Welcome to Charity',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 2.h),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: controller.app==defaultColor?defaultColor:defaultGreenColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(() => RegisterScreen());
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: controller.app==defaultColor?Colors.black:Colors.white
                            ),
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
                            color: controller.app==defaultColor?defaultColor:defaultGreenColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: controller.app)
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(() => LoginScreen());
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: controller.app==defaultColor?Colors.black:Colors.white),
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
                  txt:  'Change Theme',
                  endText: '',
                  onTap: () {
                    Get.to(() =>ThemeScreen());
                  },
                ),
                SizedBox(
                  height: 4.h,
                ),
                SettingRow(
                    txt:  'Language',
                    endText: controller.selectedIndex == 1 ? 'العربيه' : 'English',
                    onTap: () {
                      // Get.defaultDialog(
                      //     backgroundColor: controller2.app,
                      //     title: S.of(context).chooseLang,
                      //     titleStyle: TextStyle(color: controller2.textApp),
                      //     radius: 2.h,
                      //     content: Padding(
                      //       padding: const EdgeInsets.all(10.0),
                      //       child: Column(
                      //         children: [
                      //           Container(
                      //             height: 10.h,
                      //             width: double.infinity,
                      //             decoration: BoxDecoration(
                      //               color: controller.selectedIndex.value == 0
                      //                   ? Colors.white
                      //                   : Colors.black,
                      //               borderRadius: BorderRadius.circular(10),
                      //             ),
                      //             child: MaterialButton(
                      //               onPressed: () {
                      //                 if (controller.selectedIndex.value == 0) {
                      //                   controller.selectedIndex.value = 1;
                      //                   S.load(const Locale('en'));
                      //                 }
                      //                 Get.back();
                      //               },
                      //               child: Row(
                      //                 children: [
                      //                   Text(
                      //                     'English',
                      //                     style: TextStyle(
                      //                         fontSize: 14,
                      //                         color: controller
                      //                             .selectedIndex.value ==
                      //                             0
                      //                             ? Colors.black
                      //                             : defaultYellowColor),
                      //                   ),
                      //                   Spacer(),
                      //                   controller.selectedIndex.value == 0
                      //                       ? Container(
                      //                     height: 2.h,
                      //                     width: 2.h,
                      //                     decoration: BoxDecoration(
                      //                         borderRadius:
                      //                         BorderRadius.circular(50),
                      //                         border: Border.all(
                      //                             color: Colors.grey)),
                      //                   )
                      //                       : CircleAvatar(
                      //                       radius: 5.h,
                      //                       backgroundColor:
                      //                       defaultYellowColor,
                      //                       child: Icon(
                      //                         Icons.check,
                      //                         color: Colors.black,
                      //                         size: 15,
                      //                       ))
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 1.h,
                      //           ),
                      //           Container(
                      //             height: 5.h,
                      //             width: double.infinity,
                      //             decoration: BoxDecoration(
                      //               color: controller.selectedIndex.value == 1
                      //                   ? Colors.white
                      //                   : Colors.black,
                      //               borderRadius: BorderRadius.circular(5),
                      //             ),
                      //             child: MaterialButton(
                      //               onPressed: () {
                      //                 if (controller.selectedIndex.value == 1) {
                      //                   controller.selectedIndex.value = 0;
                      //                   S.load(const Locale('ar'));
                      //                 }
                      //                 Get.back();
                      //               },
                      //               child: Row(
                      //                 children: [
                      //                   Text(
                      //                     'Arabic (العربية)',
                      //                     style: TextStyle(
                      //                         fontSize: 14,
                      //                         color: controller
                      //                             .selectedIndex.value ==
                      //                             1
                      //                             ? Colors.black
                      //                             : defaultYellowColor),
                      //                   ),
                      //                   Spacer(),
                      //                   controller.selectedIndex.value == 1
                      //                       ? Container(
                      //                     height: 2.h,
                      //                     width: 2.h,
                      //                     decoration: BoxDecoration(
                      //                         borderRadius:
                      //                         BorderRadius.circular(50),
                      //                         border: Border.all(
                      //                             color: Colors.grey)),
                      //                   )
                      //                       : CircleAvatar(
                      //                       radius: 1.h,
                      //                       backgroundColor:
                      //                       defaultYellowColor,
                      //                       child: Icon(
                      //                         Icons.check,
                      //                         color: Colors.black,
                      //                         size: 15,
                      //                       ))
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ));
                    }
                ),
                SizedBox(
                  height: 4.h,
                ),
                SettingRow(
                  txt: 'LogOut',
                  endText: '',
                  onTap:() {
                    Get.defaultDialog(
                      title: '',
                      content: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout_outlined,
                                size: 23,
                                color: Color(0xffF74F22),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'LogOut',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                    color: Color(0xff1E1919)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text(
                            'Are you sure you want to logout',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xff000000)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                                color: const Color(0xffF74F22),
                                borderRadius: BorderRadius.circular(10)),
                            child: MaterialButton(
                              onPressed: () {
                                signOut(context);
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  color: Color(0xffF74F22)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'cancel',
                              style: TextStyle(
                                  color: Color(0xffF74F22),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    );
                    //  Get.to(() => AboutUsView());
                  },
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
                  txt: 'About Us',
                  endText: '',
                  onTap:() {
                  //  Get.to(() => AboutUsView());
                  },
                ),
              ],
            ),
          ),
        ),
      );
  }
}
