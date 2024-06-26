import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/network/local/cache_helper.dart';
import '../../widgets/basic.dart';
import '../../widgets/default_button.dart';
import '../setting_screen/setting_controller/theme_controller.dart';
import '../users/login_screen.dart';

class OnBoardingScreenTwo extends StatefulWidget {
  const OnBoardingScreenTwo({super.key});

  @override
  State<OnBoardingScreenTwo> createState() => _OnBoardingScreenTwoState();
}

class _OnBoardingScreenTwoState extends State<OnBoardingScreenTwo> {
  SettingController controller = Get.find();
  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      navigateFinish(context, LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/fotos-premium/caja-donacion-aislada-blanco_392895-185544.jpg'),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Text(
                'Please don\'t throw \nyour old clothes in \n the trash',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 2.8.h,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Text(
                'Donate Them',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 3.5.h,
                    fontWeight: FontWeight.w700,
                    color: controller.app),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 3.h),
                child: Text(
                  'Help us bring hope and support to those who need it most. Your donation matters',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: 1.8.h,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              //Spacer(),
              Container(
                width: 30.h,
                child: DefaultButton(
                  text: 'Get Start',
                  fun: () {
                    submit();
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
