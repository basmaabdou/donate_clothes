import 'package:donate_clothes/ui/screens/users/forget_password/set_new_password.dart';
import 'package:donate_clothes/ui/widgets/default_button.dart';
import 'package:flutter/material.dart';

class ConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Password reset',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
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
