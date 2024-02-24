import 'package:flutter/material.dart';

import '../screens/coins_screen/coins_screen.dart';
import 'basic.dart';

class MyDonation extends StatelessWidget {
  final String title,status,loc,add,date;
  const MyDonation({super.key, required this.title, required this.status, required this.date,  required this.loc, required this.add});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width:260 ,
          height: 85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 7,end: 7,top: 7),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('assets/images/d1.png'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff323232)
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                         'Status: ${status}',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff767676)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,color: Colors.grey,size: 18,),
                        Text(
                         '${loc}${add}',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey
                          ),
                        ),
                      ],
                    ),
                    Text(
                     date,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffD9D9D9)
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        TextButton(
            onPressed: (){
              navigateTo(context, CoinsScreen());
            },
            child: Text(
          'Collect Coins',
          style: TextStyle(
              fontSize: 10,
              fontWeight:FontWeight.w500 ,
              color: Color(0xffF74F22)
          ),
        )
        )

      ],
    );
  }
}
