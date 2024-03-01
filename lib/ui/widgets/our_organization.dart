import 'package:flutter/material.dart';
import '../screens/organization_screen/organization_cubit/cubit.dart';
import '../screens/organization_screen/organization_details/organization_details_screen.dart';
import 'animation.dart';

class OurOrganization extends StatelessWidget {
final String image,title,info,sId;

  const OurOrganization({super.key, required this.image, required this.title, required this.info, required this.sId});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,SizeTransition1(OrganizationDetailsScreen(
          sId: sId,
        )));
        print(OrganizationCubit.get(context).getOrgDetails?.data);

      },
      child: Container(
        width: 346,
        height: 310 ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 326,
                  height: 134,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xff000000),
                  ),
                ),
                SizedBox(
                    height: 5
                ),
                Text(
                  info,
                   maxLines: 6,
                   overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
