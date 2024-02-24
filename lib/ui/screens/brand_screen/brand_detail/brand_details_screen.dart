import 'package:flutter/material.dart';

import '../../../../shared/constants.dart';
import '../../layout_screen/layout_screen.dart';

class BrandDetailsScreen extends StatefulWidget {
  const BrandDetailsScreen({super.key});

  @override
  State<BrandDetailsScreen> createState() => _BrandDetailsScreenState();
}

class _BrandDetailsScreenState extends State<BrandDetailsScreen> {
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds:5),
            () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LayoutScreen()),
                (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 50,start: 20,end: 10,bottom: 10),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                Text(
                  'Congratulations',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w900,
                      color: defaultColor,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0, 3),
                        blurRadius: 4.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      Shadow(
                        offset: Offset(0, 3),
                        blurRadius: 4.0,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.star_border_outlined,size: 30,color: defaultColor,),
                Column(
                  children: [
                    Icon(Icons.star_rate_sharp,size: 10,color: defaultColor,),
                    SizedBox(height: 5,),
                    Icon(Icons.star_rate_sharp,size: 10,color: defaultColor,),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: 263,
              height: 154,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/adidas.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width:348,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffFCC1B1)
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 10,end: 10,bottom: 10,top: 20),
                child: Column(
                  children: [
                    Text(
                      'Thanks to your quest for charity, you got a ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Text(
                          '20%',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 18,
                              color: defaultColor
                          ),
                        ),
                        Text(
                          'discount from the DG brand',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 35,
            ),
            Text(
              'You can take advantage of the discount by visiting the nearest center to our brand',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),
            ),
          ],
        ),
      ),
    );
  }
}
