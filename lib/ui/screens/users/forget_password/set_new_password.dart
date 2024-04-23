import 'package:donate_clothes/ui/screens/users/forget_password/successful.dart';
import 'package:donate_clothes/ui/widgets/default_text_form_field..dart';
import 'package:flutter/material.dart';

class SetNewPassword extends StatefulWidget {
  @override
  _SetNewPasswordState createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  bool isButtonEnabled = false;
  bool isPassword = false;

  @override
  void dispose() {
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Set a new password',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Create a new password. Ensure it differs from\nprevious ones for security',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color.fromARGB(255, 131, 129, 129),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              defaultTextForm(
                controller: passController,
                type: TextInputType.emailAddress,
                hintText: "Enter your email",
                validate: (value) {},
                prefix: Icons.email_outlined,
                onChanged: (value) {
                  setState(() {
                    isButtonEnabled = value.isNotEmpty;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Confirm Password',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              defaultTextForm(
                controller: confirmPassController,
                type: TextInputType.visiblePassword,
                hintText: 'Confirm Password',
                validate: (value) {},
                prefix: Icons.lock,
                onChanged: (value) {
                  setState(() {
                    isButtonEnabled = passController.text.isNotEmpty &&
                        confirmPassController.text.isNotEmpty;
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Successful()),
                        );
                      }
                    : null,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return Color.fromARGB(255, 253, 211, 199);
                      }
                      return Color.fromRGBO(247, 79, 34, 1);
                    },
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                      Size.fromHeight(55.0)), // تحديد ارتفاع الزر
                ),
                child: Text('Update Password',
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
