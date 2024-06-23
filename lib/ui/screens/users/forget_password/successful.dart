import 'package:donate_clothes/ui/screens/users/login_screen.dart';
import 'package:donate_clothes/ui/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../../../widgets/default_text_form_field..dart';

class Successful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0.0), // here the desired height
          child: AppBar(
            backgroundColor: controller2.app,
            elevation: 0,
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.red, // لون الإطار
                      width: 2, // سمك الإطار
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 230, 223),
                    radius: 60,
                    child: Icon(
                      Icons.check,
                      color: Color(0xffF74F22),
                      size: 50,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            TyperAnimatedTextKit(
              isRepeatingAnimation: false,
              onTap: () {
                print("Tap Event");
              },
              text: [
                "Successful  ",
              ],
              textStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Congratulations! Your password has\nbeen changed. Click continue to login',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: Color.fromARGB(255, 131, 129, 129),
              ),
            ),
            SizedBox(height: 20),
            DefaultButton(
              text: 'Update Password',
              fun: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginScreen()), // توجيه إلى صفحة الـ "Login"
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
