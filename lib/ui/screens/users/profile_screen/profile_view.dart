import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../shared/constants.dart';
import '../../../widgets/animation.dart';
import '../../../widgets/basic.dart';
import '../../coins_screen/coins_screen.dart';
import '../../my_dontaion_screen/my_donation_screen.dart';
import 'cubit_profile/cubit.dart';
import 'edit_profile_screen.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        backgroundColor: Color(0xffF74F22),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(50),
                  bottomEnd: Radius.circular(50)),
              color: Color(0xffF74F22),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    ProfileCubit.get(context)
                        .profileModel!
                        .data!
                        .profilephoto!
                        .url!,
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  ProfileCubit.get(context)
                      .profileModel!
                      .data!
                      .username
                      .toString(),
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Color(0xffFFFFFF)),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  ProfileCubit.get(context)
                      .profileModel!
                      .data!
                      .phone
                      .toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffF4F1F1)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.email_outlined, size: 26, color: Colors.grey),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      ProfileCubit.get(context)
                          .profileModel!
                          .data!
                          .email
                          .toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 360,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffF74F22),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context,SizeTransition3(EditProfileScreen()));
                    },
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                          color: Color(0xffFFFFFF),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                InkWell(
                  onTap:(){
                    navigateTo(context, CoinsScreen());
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.layers,
                        size: 23,
                        color: Color(0xffF74F22),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        'My Coins',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff1E1919)),
                      ),
                      Spacer(),
                      IconButton(
                        color: Color(0xffF74F22),
                        onPressed: () {
                          navigateTo(context, CoinsScreen());
                        },
                        icon: Container(
                            height: 18.75,
                            width: 18.75,
                            color: Color(0xffF74F22),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            )),
                      )
                    ],
                  ),
                ),
                myDivider(),
                InkWell(
                  onTap: (){
                    Navigator.push(context, SizeTransition2(MyDonationScreen()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_rounded,
                        size: 23,
                        color: Color(0xffF74F22),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        'My Donations',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff1E1919)),
                      ),
                      Spacer(),
                      IconButton(
                        color: Color(0xffF74F22),
                        onPressed: () {
                          Navigator.push(context, SizeTransition2(MyDonationScreen()));
                        },
                        icon: Container(
                            height: 18.75,
                            width: 18.75,
                            color: Color(0xffF74F22),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 18,
                            )),
                      )
                    ],
                  ),
                ),
                myDivider(),
                SizedBox(
                  height: 10,
                ),
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
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Are you sure you want to logout',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: Color(0xff000000)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 80,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Color(0xffF74F22),
                                borderRadius: BorderRadius.circular(10)),
                            child: MaterialButton(
                              onPressed: () {
                                signOut(context);
                              },
                              child: Text(
                                'Yes',
                                style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xffF74F22)),
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
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout_outlined,
                        size: 23,
                        color: Color(0xffF74F22),
                      ),
                      SizedBox(
                        width: 10,
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
                ),
                SizedBox(
                  height: 10,
                ),
                myDivider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
