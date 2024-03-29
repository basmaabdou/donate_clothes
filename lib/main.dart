import 'package:bloc/bloc.dart';
import 'package:donate_clothes/firebase_options.dart';
import 'package:donate_clothes/shared/bloc_observed.dart';
import 'package:donate_clothes/shared/constants.dart';
import 'package:donate_clothes/shared/network/local/cache_helper.dart';
import 'package:donate_clothes/shared/network/remote/dio_helper.dart';
import 'package:donate_clothes/ui/screens/layout_screen/layout_screen.dart';
import 'package:donate_clothes/ui/screens/map_screen/map_screen.dart';
import 'package:donate_clothes/ui/screens/onboarding_screen/on_boarding_screen.dart';
import 'package:donate_clothes/ui/screens/users/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
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
      home: startWidget,
    );
  }
}