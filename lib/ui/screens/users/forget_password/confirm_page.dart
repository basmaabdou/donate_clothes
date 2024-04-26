import 'package:donate_clothes/ui/screens/users/forget_password/set_new_password.dart';
import 'package:donate_clothes/ui/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import '../../../widgets/default_text_form_field..dart';

class ConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
          const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            backgroundColor: controller2.app,
            elevation: 0,
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                InkWell(
                  child: Icon(Icons.arrow_back_ios,color: controller2.app,size: 2.5.h,),
                  onTap: (){Get.back();},
                ),
                SizedBox(width: 7.h,),
                Text(
                  'Password reset',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              'Your password has been successfully reset. click\nconfirm to set a new password',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color.fromARGB(255, 131, 129, 129),
              ),
            ),
            SizedBox(height: 25),
            DefaultButton(
                text: 'Confirm',
                fun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SetNewPassword()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
