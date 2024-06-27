import 'package:donate_clothes/ui/screens/users/profile_screen/cubit_profile/cubit.dart';
import 'package:donate_clothes/ui/screens/users/profile_screen/cubit_profile/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../screens/coins_screen/coins_screen.dart';
import 'basic.dart';

class MyDonation extends StatefulWidget {
  final String title, status, loc, id;
  final int coins;

  const MyDonation(
      {super.key,
      required this.title,
      required this.status,
      required this.loc,
      required this.id,
      required this.coins});

  @override
  State<MyDonation> createState() => _MyDonationState();
}

class _MyDonationState extends State<MyDonation> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if (state is SuccessGetCoinsState) {
            messageToast(
                msg: state.getCoins.message!, state: ToastStates.SUCCESS);

            setState(() {});
          }
          if (state is ErrorGetCoinsState) {
            messageToast(msg: 'Coins already token', state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Container(
            width: double.infinity,
            // height: 14.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Padding(
                padding:
                    const EdgeInsetsDirectional.only(start: 7, end: 7, top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(top: 1.h),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('assets/images/o1.jpg'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                widget.title,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff323232)),
                              ),
                              Spacer(),
                              widget.status == "pending"
                                  ? SizedBox()
                                  : widget.coins == 0
                                      ? InkWell(
                                          onTap: () {
                                            ProfileCubit.get(context)
                                                .getCoinsOrder(
                                                    idOrder: widget.id);
                                          },
                                          child: Container(
                                              height: 30,
                                              width: 90,
                                              padding: EdgeInsets.all(0),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Center(
                                                child: Text(
                                                  'Collect Coins',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                              )),
                                        )
                                      : InkWell(
                                          onTap: () {
                                            ProfileCubit.get(context)
                                                .getCoinsOrder(
                                                    idOrder: widget.id);
                                          },
                                          child: Container(
                                              height: 30,
                                              width: 90,
                                              padding: EdgeInsets.all(0),
                                              decoration: BoxDecoration(
                                                  color: Color(0xffF74F22),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Center(
                                                child: Text(
                                                  'Collect Coins',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                              )),
                                        )
                            ],
                          ),
                          Text(
                            'coins: ${widget.coins}',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676)),
                          ),
                          Text(
                            'Status: ${widget.status}',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676)),
                          ),
                          Text(
                            'Location: ${widget.loc}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff767676)),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),

                  ],
                )),
          );
        },
      ),
    );
  }
}
