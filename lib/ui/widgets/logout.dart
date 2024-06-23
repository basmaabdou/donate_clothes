import 'package:donate_clothes/ui/widgets/default_text_form_field..dart';
import 'package:donate_clothes/ui/widgets/setting_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../generated/l10n.dart';
import '../../shared/constants.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingRow(
      txt: S.of(context).logout,
      endText: '',
      onTap:() {
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
                    color:controller2.app,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    S.of(context).logout,
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
              Text(
                S.of(context).confirmLogout,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff000000)),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 12.h,
                height: 5.h,
                decoration: BoxDecoration(
                    color: controller2.app,
                    borderRadius: BorderRadius.circular(10)),
                child: MaterialButton(
                  onPressed: () {
                    signOut(context);
                  },
                  child:  Text(
                    S.of(context).yes,
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
                  side:  BorderSide(
                      color:controller2.app),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:  Text(
                  S.of(context).cancel,
                  style: TextStyle(
                      color: controller2.app,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        );
        //  Get.to(() => AboutUsView());
      },
    );
  }
}
