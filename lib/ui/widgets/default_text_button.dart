import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  final String text;
  final fun;

  const DefaultTextButton({super.key, required this.text, required this.fun});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:fun,
      child:
      Text(
       text,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.black45
        ),
      ),
    );
  }
}
