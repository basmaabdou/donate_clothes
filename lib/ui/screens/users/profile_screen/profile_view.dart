import 'package:donate_clothes/ui/screens/layout_screen/layout_screen.dart';
import 'package:donate_clothes/ui/screens/users/profile_screen/cubit_profile/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
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
    return BlocProvider(
      create: (context) => ProfileCubit()..getProfileData(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffF9F9F9),
            appBar: AppBar(
              backgroundColor: const Color(0xffF74F22),
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  //Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LayoutScreen()));

                },
                icon: Icon(Icons.arrow_back, size: 25, color: Colors.white),
              ),
            ),
            body: Column(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadiusDirectional.only(
                        bottomStart: const Radius.circular(50),
                        bottomEnd: Radius.circular(50)),
                    color: const Color(0xffF74F22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(

                                ProfileCubit.get(context).profileModel?.data?.profilephoto?.url??'https://cdn.pixabay.com/photo/2017/06/09/23/22/avatar-2388584_1280.png' ,
                                width: 100,
                                height: 100,
                              ),
                            )
                          ,
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        ProfileCubit.get(context).profileModel?.data?.username.toString() ?? '',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xffFFFFFF)),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        ProfileCubit.get(context)
                                .profileModel
                                ?.data
                                ?.phone
                                .toString() ??
                            '',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xffF4F1F1)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.email_outlined,
                              size: 26, color: Colors.grey),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            ProfileCubit.get(context)
                                    .profileModel
                                    ?.data
                                    ?.email
                                    .toString() ??
                                '',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 360,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xffF74F22),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 4,
                              offset:
                                  const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context, SizeTransition3(EditProfileScreen()));
                          },
                          child: const Text(
                            'Edit Profile',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      InkWell(
                        onTap: () {
                          navigateTo(context, const CoinsScreen());
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.layers,
                              size: 23,
                              color: Color(0xffF74F22),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Text(
                              'My Coins',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color(0xff1E1919)),
                            ),
                            const Spacer(),
                            IconButton(
                              color: const Color(0xffF74F22),
                              onPressed: () {
                                navigateTo(context, const CoinsScreen());
                              },
                              icon: Container(
                                  height: 18.75,
                                  width: 18.75,
                                  color: const Color(0xffF74F22),
                                  child: const Icon(
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
                        onTap: () {
                          Navigator.push(
                              context, SizeTransition2(const MyDonationScreen()));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.favorite_rounded,
                              size: 23,
                              color: Color(0xffF74F22),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            const Text(
                              'My Donations',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color(0xff1E1919)),
                            ),
                            const Spacer(),
                            IconButton(
                              color: const Color(0xffF74F22),
                              onPressed: () {
                                Navigator.push(context,
                                    SizeTransition2(const MyDonationScreen()));
                              },
                              icon: Container(
                                  height: 18.75,
                                  width: 18.75,
                                  color: const Color(0xffF74F22),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 18,
                                  )),
                            )
                          ],
                        ),
                      ),
                      myDivider(),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
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
                        },
                        child: const Row(
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
                      const SizedBox(
                        height: 10,
                      ),
                      myDivider(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
