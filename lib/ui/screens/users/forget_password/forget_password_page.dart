import 'package:donate_clothes/shared/constants.dart';
import 'package:donate_clothes/ui/screens/users/forget_password/check_email.dart';
import 'package:donate_clothes/ui/widgets/default_text_form_field..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../setting_screen/setting_controller/theme_controller.dart';

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  bool isButtonEnabled = false; // تعريف متغير للتحكم في تفعيل الزر
SettingController controller=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
          const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            backgroundColor: controller.app,
            elevation: 0,
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  InkWell(
                      child: Icon(Icons.arrow_back_ios,color: controller.app,size: 2.5.h,),
                    onTap: (){Get.back();},
                  ),
                  SizedBox(width: 7.h,),
                  Text(
                    'Forgot password',
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
                'Please enter your email to reset the password',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color.fromARGB(255, 131, 129, 129),
                ),
              ),
              SizedBox(height: 20),
              defaultTextForm(
                controller: _emailController,
                type: TextInputType.emailAddress,
                hintText: "Enter your email",
                validate: (value) {},
                prefix: Icons.email_outlined,
                onChanged: (value) {
                  setState(() {
                    isButtonEnabled = value
                        .isNotEmpty; // تحديث حالة التفعيل بناءً على مدى إمتلاء النص
                  });
                },
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckEmailPage()),
                        );
                      }
                    : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return controller.app==defaultColor? Color.fromARGB(255, 253, 211, 199) : Color(0xffD1DFDB); // تعيين اللون عندما يكون الزر فعالا
                      }
                      return controller.app; // تعيين اللون عندما يكون الزر فعالا
                    },
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                      Size.fromHeight(55.0)), // تحديد ارتفاع الزر
                ),
                child: Text('Reset Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
