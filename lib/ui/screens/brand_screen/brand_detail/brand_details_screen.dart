import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/constants.dart';
import '../../layout_screen/layout_screen.dart';
import '../brand_cubit/cubit.dart';
import '../brand_cubit/states.dart';

class BrandDetailsScreen extends StatefulWidget {
  final String id;

  const BrandDetailsScreen({super.key, required this.id});

  @override
  State<BrandDetailsScreen> createState() => _BrandDetailsScreenState();
}

class _BrandDetailsScreenState extends State<BrandDetailsScreen> {
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 4),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LayoutScreen()),
            (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          BrandCubit()..getSingleBrandsDetails(id: widget.id),
      child: BlocConsumer<BrandCubit, BrandStates>(
        listener: (BuildContext context, BrandStates state) {},
        builder: (BuildContext context, BrandStates state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 50, start: 20, end: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                      Icon(
                        Icons.star_border_outlined,
                        size: 30,
                        color: defaultColor,
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.star_rate_sharp,
                            size: 10,
                            color: defaultColor,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Icon(
                            Icons.star_rate_sharp,
                            size: 10,
                            color: defaultColor,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Container(
                      width: 263,
                      height: 154,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(BrandCubit.get(context)
                                  .getSingleBrandResponse
                                  ?.data
                                  ?.image
                                  ?.url ??
                              ''),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 348,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffFCC1B1)),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                          start: 10, end: 10, bottom: 10, top: 20),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Thanks to your quest for charity,you con got a',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Row(
                              children: [
                                Text(
                                  'high',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 15,
                                      color: defaultColor),
                                ),
                                Text(
                                  ' discount from the ${BrandCubit.get(context).getSingleBrandResponse?.data?.title ?? ''}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    BrandCubit.get(context)
                            .getSingleBrandResponse
                            ?.data
                            ?.info ??
                        '',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
