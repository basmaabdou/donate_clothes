import 'package:donate_clothes/ui/screens/my_dontaion_screen/donation_cubit/donation_cubit.dart';
import 'package:donate_clothes/ui/screens/my_dontaion_screen/donation_cubit/donation_state.dart';
import 'package:donate_clothes/ui/widgets/basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/animation.dart';
import '../../widgets/default_text_form_field..dart';
import '../../widgets/my_donation.dart';
import '../donate_clothes_details_screen/donate_clothes_details.dart';
import '../organization_screen/organization_cubit/cubit.dart';
import '../users/profile_screen/cubit_profile/cubit.dart';

class MyDonationView extends StatefulWidget {

  @override
  State<MyDonationView> createState() => _MyDonationViewState();
}

class _MyDonationViewState extends State<MyDonationView>
with SingleTickerProviderStateMixin {


  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DonationCubit()..getAllDonationData(),
      child: BlocConsumer<DonationCubit, DonationStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = DonationCubit.get(context);
          var user = ProfileCubit.get(context);
          //print(cubit.donationResponse?.success);
          //print(cubit.donationResponse?.length);

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
              backgroundColor: controller2.app,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 245,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(50),
                          bottomEnd: Radius.circular(50)),
                      color: controller2.app,
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
                                    user.profileModel!.data!.profilephoto!.url!,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  user.profileModel!.data!.username!,
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
                            'Congrats, ${user.profileModel!.data!.username!}',
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
                              '(${user.profileModel!.data!.orders!.length})',
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
                        TabBar(
                          unselectedLabelColor: Colors.black,
                          labelColor: controller2.app,
                          tabs: const [
                            Text('Pending'),
                            Text('Collected'),

                          ],
                          controller: tabController,
                          indicatorSize: TabBarIndicatorSize.tab,
                        ),
                        Container(
                          height: 500,
                          child: TabBarView(
                            controller: tabController,
                            children:  [
                              ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                user.profileModel!.data!.orders![index].status! =="pending"
                                    ? MyDonation(
                                  title: user.profileModel!.data!.orders![index].itemsName.toString(),
                                  status: user.profileModel!.data!.orders![index].status!,
                                  date: user.profileModel!.data!.createdAt!,
                                  loc: user.profileModel!.data!.orders![index].location!,
                                  id: user.profileModel!.data!.orders![index].sId!,
                                  coins: user.profileModel!.data!.orders![index].ordercoins! ,
                                )
                                    : SizedBox(),
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 5.0,
                                ),
                                itemCount: user.profileModel!.data!.orders!.length,
                                scrollDirection: Axis.vertical,
                              ),
                              ListView.separated(
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) =>
                                user.profileModel!.data!.orders![index].status! =="collected"
                                    ? MyDonation(
                                  title: user
                                      .profileModel!.data!.orders![index].itemsName
                                      .toString(),
                                  status:
                                  user.profileModel!.data!.orders![index].status!,
                                  date: user.profileModel!.data!.createdAt!,
                                  loc: user.profileModel!.data!.orders![index].location!,
                                  id: user.profileModel!.data!.orders![index].sId!,
                                    coins: user.profileModel!.data!.orders![index].ordercoins!
                                )
                                    :SizedBox(),
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 5.0,
                                ),
                                itemCount: user.profileModel!.data!.orders!.length,
                                scrollDirection: Axis.vertical,
                              ),
                            ],
                          ),
                        ),
              
              
              
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                donateBottomSheet(context);
              },
              child: Icon(Icons.add,color: Colors.white,),
              backgroundColor: controller2.app,
              mini: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          );
        },
      ),
    );
  }
}
