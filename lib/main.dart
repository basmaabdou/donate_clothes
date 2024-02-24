import 'package:bloc/bloc.dart';
import 'package:donate_clothes/shared/bloc_observed.dart';
import 'package:donate_clothes/shared/constants.dart';
import 'package:donate_clothes/shared/network/local/cache_helper.dart';
import 'package:donate_clothes/shared/network/remote/dio_helper.dart';
import 'package:donate_clothes/ui/screens/layout_screen/layout_screen.dart';
import 'package:donate_clothes/ui/screens/onboarding_screen/on_boarding_screen.dart';
import 'package:donate_clothes/ui/screens/users/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? onBoarding= CacheHelper.getData(key: 'onBoarding',);
  token=CacheHelper.getData(key: 'token' );
   sId=CacheHelper.getData(key: 'id' );
  print(token);

  Widget widget;
  if(onBoarding!=null){
    if(token !=null) {
      widget = LayoutScreen();
    }else {
      widget = LoginScreen();
    }
  }else{
    widget=OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startWidget;
  MyApp( { this.startWidget});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutScreen(),
    );
  }
}