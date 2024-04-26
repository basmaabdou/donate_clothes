import 'dart:convert';

import 'package:donate_clothes/shared/constants.dart';
import 'package:donate_clothes/ui/screens/brand_screen/brand_cubit/cubit.dart';
import 'package:donate_clothes/ui/screens/brand_screen/brand_cubit/states.dart';
import 'package:donate_clothes/ui/screens/users/profile_screen/cubit_profile/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../widgets/basic.dart';
import '../../widgets/default_button.dart';
import '../../widgets/default_text_form_field..dart';
import '../layout_screen/layout_screen.dart';
import '../users/profile_screen/cubit_profile/cubit.dart';

class CoinsView extends StatefulWidget {
  const CoinsView({super.key});

  @override
  State<CoinsView> createState() => _CoinsViewState();
}

class _CoinsViewState extends State<CoinsView> {
  @override
  Widget build(BuildContext context) {
    var amountController = TextEditingController();
    // var qty = int.tryParse(amountController.text);
    // bool vis = false;

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProfileCubit()..getProfileData(),
          ),
          BlocProvider(
            create: (context) => BrandCubit()..getAllBrandsData(),
          ),
        ],
        child: BlocConsumer<ProfileCubit, ProfileStates>(
          listener: (context, state) {
            if (state is SuccessExchangeCoinsStates) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: Text('Thank you for exchange coins'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 150,
                              width: 100,
                              child: Center(
                                child: QrImageView(
                                  data: amountController.text,
                                  version: QrVersions.auto,
                                  size: 170.0,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Container(
                                width: 135,
                                height: 37,
                                decoration: BoxDecoration(
                                    color: controller2.app,
                                    borderRadius: BorderRadius.circular(10)),
                                child: MaterialButton(
                                  onPressed: () {
                                    navigateFinish(context, LayoutScreen());
                                  },
                                  child: Text(
                                    'Go Home',
                                    style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ));
              ProfileCubit.get(context).getProfileData();

            }
            if (state is ErrorExchangeCoinsStates){

              messageToast(msg: "Coins not enough!", state: ToastStates.ERROR, );

              // Fluttertoast.showToast(
              //     msg: "Coins not enough!",
              //     toastLength: Toast.LENGTH_SHORT,
              //     gravity: ToastGravity.CENTER,
              //     timeInSecForIosWeb: 1,
              //     textColor: Colors.white,
              //     fontSize: 16.0,
              //   backgroundColor: Colors.red
              // );

            }
          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:  Icon(
                      Icons.arrow_back,
                      color: controller2.app,
                    )),
                backgroundColor: Colors.white,
                elevation: 0,
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 143,
                          height: 133,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/ca1.jpg'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                       Text(
                        'Results of Coins',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: controller2.app),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Container(
                        height: 216,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xffF3F3F3),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 20, end: 20, bottom: 20, top: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                   Icon(
                                    Icons.check,
                                    size: 24,
                                    color: controller2.app,
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'SCORE Coins',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff060710)),
                                  ),
                                  const Spacer(),
                                  Text(
                                    ProfileCubit.get(context)
                                            .profileModel
                                            ?.data!
                                            .coins!
                                            .toString() ??
                                        '',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xff060710)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              myDivider(),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                   Icon(
                                    Icons.money_sharp,
                                    size: 24,
                                    color: controller2.app,
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'Donation',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff060710)),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${ProfileCubit.get(context).profileModel?.data!.orders!.length ?? ''}',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xff060710)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              myDivider(),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.handshake,
                                    size: 24,
                                    color: controller2.app,
                                  ),
                                  Spacer(),
                                  Text(
                                    'Available brand',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff060710)),
                                  ),
                                  Spacer(),
                                  BlocConsumer<BrandCubit, BrandStates>(
                                    listener: (context, state) {
                                      // TODO: implement listener
                                    },
                                    builder: (context, state) {
                                      return Text(
                                        "${BrandCubit.get(context).brandsResponse?.brands!.length ?? ''}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                            color: Color(0xff060710)),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Center(child: QRCodeImage(base64String: "${ProfileCubit.get(context).profileModel?.data?.qrcode?.replaceRange(0,22,"")}")

                      // Center(
                      //   child: Container(
                      //     width: 263,
                      //     height: 154,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       image: DecorationImage(
                      //         image: NetworkImage("${ProfileCubit.get(context).profileModel?.data?.qrcode??''}"),
                      //         fit: BoxFit.cover,
                      //
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      //
                        // Center(
                      //   child: defaultTextForm(
                      //       controller: amountController,
                      //       type: TextInputType.text,
                      //       validate: (value) {
                      //         if (value!.isEmpty) {
                      //           return 'amount must be not empty';
                      //         }
                      //         return null;
                      //       },
                      //       prefix: Icons.monetization_on_outlined),
                      // ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Center(
                      //   child: DefaultButton(
                      //       text: 'Exchange your coins',
                      //       fun: () {
                       //         ProfileCubit.get(context).getExchangeCoins(
                      //             amount: amountController.text);
                      //         if (state is SuccessExchangeCoinsStates) {
                      //           print(ProfileCubit.get(context)
                      //               .exchangeCoins!
                      //               .success);
                      //
                      //           // if (
                      //           //  ProfileCubit.get(context).profileModel?.data!.coins! >= 5
                      //           // ) {
                      //           //   ProfileCubit.get(context).getExchangeCoins(
                      //           //       amount: amountController.text);
                      //           //   if (state is SuccessExchangeCoinsStates) {
                      //           //     print(ProfileCubit
                      //           //         .get(context)
                      //           //         .exchangeCoins!
                      //           //         .success);
                      //           //   }
                      //           // } else {
                      //           //   print("error");
                      //           // }
                      //
                      //           //navigateTo(context, const BrandScreen());
                      //         }
                      //       }),
                      // )
                            )],
                  ),
                ),
              ),
            );
          },
        ));
  }
}


class QRCodeImage extends StatelessWidget {
  final String base64String;

  const QRCodeImage({Key? key, required this.base64String}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.memory(
        base64Decode(base64String),
        // You might need to adjust width and height as needed
        width: 300,
        height: 200,
        );
  }
}