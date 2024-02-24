import 'package:flutter/material.dart';

class ShareBrands extends StatelessWidget {
  const ShareBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 158,
        height: 165,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffF74F22),width: 1),
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage('assets/images/r1.png'),
            fit: BoxFit.fill
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        )
    );
  }
}
