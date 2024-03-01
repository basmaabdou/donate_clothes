import 'package:flutter/material.dart';

import '../../../shared/network/local/cache_helper.dart';
import '../../widgets/basic.dart';
import '../../widgets/default_button.dart';
import '../users/login_screen.dart';

class OnBoardingScreenTwo extends StatefulWidget {
  const OnBoardingScreenTwo({super.key});

  @override
  State<OnBoardingScreenTwo> createState() => _OnBoardingScreenTwoState();
}

class _OnBoardingScreenTwoState extends State<OnBoardingScreenTwo> {
  void submit(){
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
                      image: NetworkImage('https://img.freepik.com/fotos-premium/caja-donacion-aislada-blanco_392895-185544.jpg'),
                      fit: BoxFit.fill,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please don\'t throw \nyour old clothes in \n the trash',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000)
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Donate Them',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Color(0xffF74F22)
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'when we give cheerfully and accept \ngratefully everyone is blessed',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff000000)
                ),
              ),
              SizedBox(height: 10,),
              //Spacer(),
              DefaultButton(text: 'Get Start', fun: (){submit();},)

            ],
          ),
        ),
      ),
    );
  }
}
