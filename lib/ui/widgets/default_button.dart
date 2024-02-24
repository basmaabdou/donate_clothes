import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final fun;

  const DefaultButton({super.key, required this.text, required this.fun});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315,
      height: 50,
      decoration: BoxDecoration(
          color: Color(0xffF74F22),
          borderRadius: BorderRadius.circular(20)
      ),
      child: MaterialButton(
        onPressed: fun,
        child: Text(
          text,
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 18,
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}
