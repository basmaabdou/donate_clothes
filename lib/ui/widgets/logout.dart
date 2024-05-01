import 'package:donate_clothes/ui/widgets/setting_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
                    color: Color(0xffF74F22),
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
                width: 80,
                height: 30,
                decoration: BoxDecoration(
                    color: const Color(0xffF74F22),
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
                  side: const BorderSide(
                      color: Color(0xffF74F22)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:  Text(
                  S.of(context).cancel,
                  style: TextStyle(
                      color: Color(0xffF74F22),
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
