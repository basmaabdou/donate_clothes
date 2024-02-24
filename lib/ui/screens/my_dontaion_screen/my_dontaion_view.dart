import 'package:flutter/material.dart';

import '../../widgets/animation.dart';
import '../../widgets/my_donation.dart';
import '../donate_clothes_details_screen/donate_clothes_details.dart';
import '../users/profile_screen/cubit_profile/cubit.dart';

class MyDonationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit=ProfileCubit.get(context);
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: Color(0xffF74F22),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 230,
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
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 20, end: 10, bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            cubit
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
                          cubit
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Congrats, ${cubit.profileModel!.data!.username.toString()}',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffF4F1F1)),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    'You have contributed to the heating of \n many  people this month',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xffF4F1F1)),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'My Donations ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '(${  cubit
                          .profileModel!
                          .data!.orders!.length})',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffC4C4C4)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  width: 339,
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => MyDonation(
                        title:cubit.profileModel!.data!.orders![index].itemsName.toString() ,
                        status: cubit.profileModel!.data!.orders![index].status! ,
                        date: cubit.profileModel!.data!.createdAt!,
                      loc:  cubit.profileModel!.data!.orders![index].city!,
                      add: cubit.profileModel!.data!.orders![index].address!,
                    ),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15.0,
                    ),
                    itemCount: cubit.profileModel!.data!.orders!.length,
                    scrollDirection: Axis.vertical,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,FadeRoute1(DonateClothesDetails()));
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xffF74F22),
        mini: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
