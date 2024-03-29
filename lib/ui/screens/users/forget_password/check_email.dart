import 'package:donate_clothes/ui/screens/users/forget_password/confirm_page.dart';
import 'package:flutter/material.dart';

class CheckEmailPage extends StatefulWidget {
  @override
  _CheckEmailPageState createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  TextEditingController _controller5 = TextEditingController();


  bool get isButtonEnabled =>
      _controller1.text.isNotEmpty &&
      _controller2.text.isNotEmpty &&
      _controller3.text.isNotEmpty &&
      _controller4.text.isNotEmpty &&
      _controller5.text.isNotEmpty;

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _controller5.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Check your email',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black),
            ),
            SizedBox(height: 10),
            Text(
              'We sent a reset link Please enter the 5-digit code mentioned in the email.',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: Color.fromARGB(255, 131, 129, 129)),
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller1,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      setState(() {});
                    },
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: '',
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: _controller2,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      setState(() {});
                    },
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: '',
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: _controller3,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      setState(() {});
                    },
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: '',
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: _controller4,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      setState(() {});
                    },
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: '',
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: TextField(
                    controller: _controller5,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      setState(() {});
                    },
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: '',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: isButtonEnabled
                  ? () {
                      if (isButtonEnabled) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConfirmPage()),
                        );
                      }
                    }
                  : null,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Color.fromARGB(255, 253, 211, 199);
                    }
                    return Color(0xffF74F22);
                  },
                ),
                fixedSize: MaterialStateProperty.all<Size>(
                  Size.fromHeight(55.0),
                ),
              ),
              child: Text(
                'Verify Code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Text(
                  'Haven’t got the email yet?',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color.fromARGB(255, 131, 129, 129)),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
// Set the flag to clear codes
                      _controller1.clear();
                      _controller2.clear();
                      _controller3.clear();
                      _controller4.clear();
                      _controller5.clear();
                    });
                  },
                  child: Text(
                    'Resend email',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffF74F22)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
