import 'package:donate_clothes/models/profile_response.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../shared/constants.dart';
import '../screens/payment/view/payment_view.dart';
import '../screens/donate_clothes_details_screen/donate_clothes_details.dart';
import 'ThemeImage.widget.dart';
import 'animation.dart';

void navigateTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

void navigateFinish(context, Widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => Widget), (route) => false);

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 0, end: 0),
      child: Container(
        width: double.infinity,
        height: 0.99,
        color: Color(0xffCECDD0),
      ),
    );

void messageToast({required String msg, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: ChooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastStates { SUCCESS, ERROR, WARNING }

Color ChooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = defaultColor;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Future<void> donateBottomSheet(context) => showModalBottomSheet<void>(
    context: context,
    backgroundColor: controller.app == defaultColor
        ? Color.fromARGB(255, 253, 211, 199)
        : Color(0xffD1DFDB),
    builder: (BuildContext context) {
      return SizedBox(
          height: 30.h,
          child: Center(
              child: Padding(
            padding: EdgeInsets.all(2.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    'What do you want to donate?',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 2.5.h),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Money",
                              style: TextStyle(
                                  color: controller.app,
                                  fontWeight: FontWeight.w800),
                            ),
                            Container(
                              width: 25.h,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: controller.app ==
                                          defaultColor
                                          ? Color(0xffF8724E)
                                          : controller.app == defaultGreenColor
                                          ? Color(0xff367562)
                                          : Color(0xff4469AB),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10))),
                                  child: Text(
                                    'PAYMOB',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () => {
                                    Navigator.push(context,
                                        SizeTransition1(PaymentView())),
                                  }),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 2.h,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Other Donation",
                              style: TextStyle(
                                  color: controller.app,
                                  fontWeight: FontWeight.w800),
                            ),
                            Container(
                              width: 25.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: controller.app ==
                                            defaultColor
                                        ? Color(0xffF8724E)
                                        : controller.app == defaultGreenColor
                                            ? Color(0xff367562)
                                            : Color(0xff4469AB),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                child: Text(
                                  'Donation form',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () => Navigator.push(context,
                                    SizeTransition1(DonateClothesDetails())),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    width: 25.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: controller.app, fontWeight: FontWeight.w800),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  )
                ]),
          )));
    });
