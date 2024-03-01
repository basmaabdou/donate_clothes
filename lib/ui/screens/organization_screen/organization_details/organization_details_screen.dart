import 'package:donate_clothes/ui/screens/organization_screen/organization_cubit/cubit.dart';
import 'package:donate_clothes/ui/screens/organization_screen/organization_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/organize_details_widget.dart';

class OrganizationDetailsScreen extends StatefulWidget {
  final String sId;


  const OrganizationDetailsScreen({super.key, required this.sId});

  @override
  State<OrganizationDetailsScreen> createState() => _OrganizationDetailsState();
}

class _OrganizationDetailsState extends State<OrganizationDetailsScreen> {

  int? isSelectedIndex =0;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (BuildContext context) => OrganizationCubit()..getAllOrganizationDetails(sId: widget.sId),
        child: BlocConsumer<OrganizationCubit, OrganizationStates>(
          listener: (BuildContext context, OrganizationStates state) {},
          builder: (BuildContext context, OrganizationStates state) {
            return Scaffold(

              body: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 50, start: 20, end: 10, bottom: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            OrganizationCubit.get(context).getOrgDetails?.data?.title ?? '',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
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
                      ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>InkWell(
                          onTap: (){
                            setState(() {
                              isSelectedIndex=index;
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            height: 178,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      OrganizationCubit.get(context).getOrgDetails?.data?.images?[isSelectedIndex!].url ?? ''
                                  ),
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
                        ),
                        itemCount: 1,


                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 91,
                        child: ListView.separated(
                          shrinkWrap: true  ,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isSelectedIndex=index;
                                    print(isSelectedIndex);
                                 //   OrganizationCubit.get(context).getOrgDetails?.data?.images?[index].url ?? '';
                                  });
                                },
                                child: Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: isSelectedIndex == index ? Colors.red : Colors.transparent,
                                      width: 2,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(OrganizationCubit.get(context).getOrgDetails?.data?.images?[index].url ?? ''),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 15.0,
                          ),
                          itemCount: OrganizationCubit.get(context).getOrgDetails?.data?.images?.length??4,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        OrganizationCubit.get(context)
                                .getOrgDetails
                                ?.data
                                ?.title ??
                            '',
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
                        OrganizationCubit.get(context)
                                .getOrgDetails
                                ?.data
                                ?.organizationInfo ??
                            '',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
