import 'package:flutter/material.dart';

import '../../../widgets/organize_details_widget.dart';

class OrganizationDetailsScreen extends StatefulWidget {
  @override
  State<OrganizationDetailsScreen> createState() => _OrganizationDetailsState();
}

class _OrganizationDetailsState extends State<OrganizationDetailsScreen> {

  String selectedText = 'The ICRC delegation in Egypt';
  String selectedDes = ' promotes and ensures respect for international humanitarian law and facilitates ICRC operations around the world through dialogue with the government, multilateral organizations, civil society and diplomatic officials. She helps reconnect family members separated due to conflict, violence and migration, and works closely with the Egyptian Red Crescent and other partner organisations';
  String selectedImg = 'assets/images/r1.png';

  void onTitle(String newText) {
    setState(() {
      selectedText = newText;
    });
  }
  void onDes(String newText) {
    setState(() {
      selectedDes = newText;
    });
  }
  void onImg(String newText) {
    setState(() {
      selectedImg = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
            top: 50, start: 20, end: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ICRC ORGANIZATION',
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                ),
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.exit_to_app,
                    size: 20,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 178,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage(selectedImg),
                    fit: BoxFit.fill),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 91,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => OrganizeDetailsWidget(
                  onTitleTap: onTitle,
                  onDesTap:onDes,
                  onImgTap: onImg,
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15.0,
                ),
                itemCount: 4,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              selectedText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              selectedDes,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}