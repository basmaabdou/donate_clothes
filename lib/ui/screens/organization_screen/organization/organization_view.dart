import 'package:donate_clothes/ui/widgets/ThemeImage.widget.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
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
        child: Directionality(
          textDirection: controller.selectedIndex == 0
              ? TextDirection.ltr
              : TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.only(
                          bottomStart: Radius.circular(20),
                          bottomEnd: Radius.circular(20)),
                      image: DecorationImage(
                          image: AssetImage('assets/images/c2.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        S.of(context).other,
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
                          Icon(
                            Icons.handshake,
                            color: Color(0xffF74F22),
                            size: 15,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            S.of(context).dataOr,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Color(0xffFFFFFF),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.handshake,
                            color: Color(0xffF74F22),
                            size: 15,
                          ),
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
                      S.of(context).ourOr,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 1000,
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => OurOrganization(
                          image: OrganizationCubit.get(context)
                              .organizationResponse!
                              .result![index]
                              .images![index]
                              .url!,
                          title: OrganizationCubit.get(context)
                              .organizationResponse!
                              .result![index]
                              .title!,
                          info: OrganizationCubit.get(context)
                              .organizationResponse!
                              .result![index]
                              .organizationInfo!,
                          sId: OrganizationCubit.get(context)
                              .organizationResponse!
                              .result![index]
                              .sId!,
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15.0,
                        ),
                        itemCount: OrganizationCubit.get(context)
                            .organizationResponse!
                            .result!
                            .length,
                        scrollDirection: Axis.vertical,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
