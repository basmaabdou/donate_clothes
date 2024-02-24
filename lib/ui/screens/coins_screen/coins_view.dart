import 'package:flutter/material.dart';

import '../../widgets/basic.dart';
import '../../widgets/default_button.dart';
import '../brand_screen/brand/brand_screen.dart';
import '../users/profile_screen/cubit_profile/cubit.dart';

class CoinsView extends StatelessWidget {
  const CoinsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color:Color(0xffF74F22) ,)
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 143,
                height: 133,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/ca1.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              height:20 ,
            ),
            Text(
              'Results of Coins',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xffF74F22)
              ),
            ),
            SizedBox(
              height:35 ,
            ),
            Container(
              height:216 ,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 20,end: 20,bottom: 20,top: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.check,size: 24,color: Color(0xffF74F22),),
                        Spacer(),
                        Text(
                          'SCORE Coins',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff060710)
                          ),
                        ),
                        Spacer(),
                        Text(
                          ProfileCubit.get(context).profileModel!.data!.coins.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff060710)
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:25 ,
                    ),
                    myDivider(),
                    SizedBox(
                      height:25 ,
                    ),
                    Row(
                      children: [
                        Icon(Icons.money_sharp,size: 24,color: Color(0xffF74F22),),
                        Spacer(),
                        Text(
                          'Donations',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff060710)
                          ),
                        ),
                        Spacer(),
                        Text(
                          '${  ProfileCubit.get(context)
                              .profileModel!
                              .data!.orders!.length}',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff060710)
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height:25 ,
                    ),
                    myDivider(),
                    SizedBox(
                      height:25 ,
                    ),
                    Row(
                      children: [
                        Icon(Icons.handshake,size: 24,color: Color(0xffF74F22),),
                        Spacer(),
                        Text(
                          'Available brand',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff060710)
                          ),
                        ),
                        Spacer(),
                        Text(
                          '3',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Color(0xff060710)
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(
              height:50 ,
            ),
            DefaultButton(text: 'Exchange your money', fun: (){navigateTo(context, BrandScreen());})
          ],
        ),
      ),
    );
  }
}
