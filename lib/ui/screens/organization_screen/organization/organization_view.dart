import 'package:flutter/material.dart';

import '../../../widgets/our_organization.dart';
import '../organization_cubit/cubit.dart';

class OrganizationView extends StatelessWidget {
  const OrganizationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  width: 375,
                  height: 240,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(20),bottomEnd: Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/c2.jpg'),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      '+ OTHER NGOs',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.handshake, color: Color(0xffF74F22),size: 15,),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Help organizations save people',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.handshake, color: Color(0xffF74F22),size: 15,),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],

            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our organization',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 1000,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>  OurOrganization(
                        image: OrganizationCubit.get(context).organizationResponse!.allOrganizaions![index].images![index].url!,
                        title: OrganizationCubit.get(context).organizationResponse!.allOrganizaions![index].title!,
                        info: OrganizationCubit.get(context).organizationResponse!.allOrganizaions![index].organizationInfo!,
                        sId:OrganizationCubit.get(context).organizationResponse!.allOrganizaions![index].sId! ,
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 15.0,
                      ),
                      itemCount: OrganizationCubit.get(context).organizationResponse!.allOrganizaions!.length,
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
