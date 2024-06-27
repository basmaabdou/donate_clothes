import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants.dart';
import '../screens/coins_screen/coins_screen.dart';
import '../screens/my_dontaion_screen/my_donation_screen.dart';
import '../screens/setting_screen/about_us/about_us.dart';
import '../screens/setting_screen/lang_screen/lang_view.dart';
import '../screens/setting_screen/theme_screen/theme_screen.dart';
import '../screens/users/profile_screen/cubit_profile/cubit.dart';
import '../screens/users/profile_screen/profile_screen.dart';
import 'animation.dart';
import 'basic.dart';
import 'default_text_form_field..dart';

class DrawerContainer extends StatelessWidget {
  const DrawerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.h),
      child: Column(
        children: [
          SizedBox(
            height: 3.h,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              ProfileCubit.get(context).profileModel?.data?.profilephoto?.url ??
                  'https://cdn.pixabay.com/photo/2017/06/09/23/22/avatar-2388584_1280.png',
              width: 16.h,
              height: 15.h,
            ),
          ),
          Text(
            ProfileCubit.get(context).profileModel?.data?.username.toString() ??
                '',
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: Color(0xffFFFFFF)),
          ),
          SizedBox(
            height: 3.h,
          ),
          InkWell(
            onTap: () {
              navigateTo(context, ProfileScreen());
            },
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 26,
                ),
                SizedBox(
                  width: 3.h,
                ),
                Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF9F9F9),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          InkWell(
            onTap: () {
              navigateTo(context, const CoinsScreen());
            },
            child: Row(
              children: [
                Icon(
                  Icons.layers,
                  color: Colors.white,
                  size: 26,
                ),
                SizedBox(width: 3.h),
                const Text(
                  'My Coins',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF9F9F9),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, SizeTransition2(const MyDonationScreen()));
            },
            child: Row(
              children: [
                Icon(
                  Icons.favorite_rounded,
                  color: Colors.white,
                  size: 26,
                ),
                SizedBox(
                  width: 3.h,
                ),
                const Text(
                  'My Donations',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF9F9F9),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          InkWell(
            onTap: () {
              Get.to(() => LanguageView());
            },
            child: Row(
              children: [
                Icon(
                  Icons.language,
                  color: Colors.white,
                  size: 26,
                ),
                SizedBox(
                  width: 3.h,
                ),
                Text(
                  'Languages',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF9F9F9),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          InkWell(
            onTap: () {
              donateBottomSheet(context);
            },
            child: Row(
              children: [
                Icon(
                  Icons.payments,
                  color: Colors.white,
                  size: 26,
                ),
                SizedBox(
                  width: 3.h,
                ),
                Text(
                  'Payments',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF9F9F9),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          InkWell(
            onTap: () {
              navigateTo(context, ThemeScreen());
            },
            child: Row(
              children: [
                Icon(
                  Icons.color_lens,
                  color: Colors.white,
                  size: 26,
                ),
                SizedBox(
                  width: 3.h,
                ),
                Text(
                  'Theme',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF9F9F9),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
          InkWell(
            onTap: (){
              navigateTo(context, AboutUsView());
            },
            child: Row(
              children: [
                Icon(
                  Icons.help,
                  color: Colors.white,
                  size: 26,
                ),
                SizedBox(
                  width: 3.h,
                ),
                Text(
                  'About Us',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF9F9F9),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 3.h),
          InkWell(
            onTap: () {
              Get.defaultDialog(
                title: '',
                content: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout_outlined,
                          size: 23,
                          color: controller2.app,
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
                      width: 12.h,
                      height: 5.h,
                      decoration: BoxDecoration(
                          color: controller2.app,
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
                        side: BorderSide(color: controller2.app),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'cancel',
                        style: TextStyle(
                            color: controller2.app,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 26,
                ),
                SizedBox(
                  width: 3.h,
                ),
                Text(
                  'LogOut',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xffF9F9F9),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),
        ],
      ),
    );
  }
}
