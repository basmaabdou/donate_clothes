import 'package:flutter/material.dart';

class SettingRow extends StatelessWidget {
  String txt, endText;
  final onTap;
  SettingRow(
      {super.key,
      required this.txt,
      required this.onTap,
      required this.endText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            txt,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          ),
          Spacer(),
          Text(
            endText,
            style: TextStyle(fontSize: 12),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 15,
          )
        ],
      ),
    );
  }
}
