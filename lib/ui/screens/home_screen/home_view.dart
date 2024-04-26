import 'package:carousel_slider/carousel_slider.dart';
import 'package:donate_clothes/ui/widgets/basic.dart';
import 'package:donate_clothes/ui/widgets/default_text_form_field..dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants.dart';
import '../../widgets/our_recent_work.dart';
import '../setting_screen/setting_screen.dart';
import 'home_cubit/cubit.dart';


class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeView> {
  List<ImageModel> imageItems = [
    ImageModel(image: 'assets/images/o4.jpg'),
    ImageModel(image: 'assets/images/o5.jpg'),
    ImageModel(image: 'assets/images/o6.jpg'),
    ImageModel(image: 'assets/images/p4.jpg'),
    ImageModel(image: 'assets/images/o7.jpg'),
    ImageModel(image: 'assets/images/o8.jpg'),
    ImageModel(image: 'assets/images/p4.jpg'),
    ImageModel(image: 'assets/images/p3.jpg'),
    ImageModel(image: 'assets/images/p2.jpg'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffF9F9F9),
        leading: IconButton(
          icon: Icon(
            Icons.list,
            color: controller2.app,
            size: 25,
          ),
          iconSize: 100,
          onPressed: () {},
        ),
        titleSpacing: 80,
        title: Text(
          'Charity',
          textAlign: TextAlign.center,
          style: TextStyle(
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
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: controller2.app,
            fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          Row(
            children: [
              // Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     color: Colors.white,
              //   ),
              //   child: Container(
              //     width: 20,
              //     height: 20,
              //     decoration: BoxDecoration(
              //         color: Color(0xffF74F22),
              //         borderRadius: BorderRadiusDirectional.circular(20)),
              //     child: Text(
              //       'R',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //         fontSize: 15,
              //         color: Color(0xffFFFFFF),
              //       ),
              //     ),
              //   ),
              // ),
              IconButton(
                  onPressed: (){
                    navigateTo(context, SettingScreen());
                  },
                  icon: Icon(Icons.settings ,color: controller2.app,size: 3.h,)
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: [
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        width: 338,
                        height: 226,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/o6.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 338,
                        height: 81,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(20),
                                topEnd: Radius.circular(20),
                                bottomEnd: Radius.circular(10),
                                bottomStart: Radius.circular(10)),
                            color: Color(0xff000000).withOpacity(.5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'There are a lot of people in need who',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                            Text(
                              'help',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Color(0xffF74F22),
                              ),
                            ),
                            Text(
                              'ask for help.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        width: 338,
                        height: 226,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/o5.jpg'),
                          ),
                        ),
                      ),
                      Container(
                        width: 338,
                        height: 81,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(20),
                                topEnd: Radius.circular(20),
                                bottomEnd: Radius.circular(10),
                                bottomStart: Radius.circular(10)),
                            color: Color(0xff000000).withOpacity(.5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'These People always feal cold ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                            Text(
                              'NO',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Color(0xffF74F22),
                              ),
                            ),
                            Text(
                              'one feels them.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        width: 338,
                        height: 226,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/o2.jpg'),
                          ),
                        ),
                      ),
                      Container(
                        width: 338,
                        height: 81,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(20),
                                topEnd: Radius.circular(20),
                                bottomEnd: Radius.circular(10),
                                bottomStart: Radius.circular(10)),
                            color: Color(0xff000000).withOpacity(.5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Elderly and Young people in pain ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                            Text(
                              'NO',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Color(0xffF74F22),
                              ),
                            ),
                            Text(
                              'one feels them.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        width: 338,
                        height: 226,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/c1.jpg'),
                          ),
                        ),
                      ),
                      Container(
                        width: 338,
                        height: 81,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(20),
                                topEnd: Radius.circular(20),
                                bottomEnd: Radius.circular(10),
                                bottomStart: Radius.circular(10)),
                            color: Color(0xff000000).withOpacity(.6)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Please don\'t throw away your clothes.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        width: 338,
                        height: 226,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/o8.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: 338,
                        height: 81,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(20),
                                topEnd: Radius.circular(20),
                                bottomEnd: Radius.circular(10),
                                bottomStart: Radius.circular(10)),
                            color: Color(0xff000000).withOpacity(.5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Donate',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Color(0xffF74F22),
                              ),
                            ),
                            Text(
                              'Your Old Clothes.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            width: 338,
                            height: 226,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage('assets/images/sale.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: 338,
                            height: 81,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(20),
                                    topEnd: Radius.circular(20),
                                    bottomEnd: Radius.circular(10),
                                    bottomStart: Radius.circular(10)),
                                color: Color(0xff000000).withOpacity(.5)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'for your money get a discount from',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                Text(
                                  ' our supporting Brands',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        bottom: 100,
                        child: Container(
                          width: 150,
                          height: 85,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    '30%',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '50%',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "SALE",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: defaultColor),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '40%',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Text(
                                        '70%',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 25,
                                      ),
                                      Text(
                                        '100%',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        width: 338,
                        height: 226,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/r1.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: 338,
                        height: 81,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(20),
                                topEnd: Radius.circular(20),
                                bottomEnd: Radius.circular(10),
                                bottomStart: Radius.circular(10)),
                            color: Color(0xff000000).withOpacity(.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Come On ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                            Text(
                              ' Donate ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                                color: Color(0xffF74F22),
                              ),
                            ),
                            Text(
                              ' With us',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        width: 338,
                        height: 226,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('assets/images/p2.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        width: 338,
                        height: 81,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(20),
                                topEnd: Radius.circular(20),
                                bottomEnd: Radius.circular(10),
                                bottomStart: Radius.circular(10)),
                            color: Color(0xff000000).withOpacity(.5)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'in Exchange for your donation,',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                            Text(
                              'you will get coins .',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
                options: CarouselOptions(
                    height: 226,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.linearToEaseOut,
                    scrollDirection: Axis.horizontal,
                    viewportFraction: 1.5)
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 120,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    Container(
                      width: 155,
                      height: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('${imageItems[index].image}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 7.0,
                ),
                itemCount: imageItems.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Our recent works',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: Color(0xff000000),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width:double.infinity,
                child: ListView.separated(
                  //physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => OurRecentWork(

                    img: HomeCubit.get(context).donationCardResponse!.data![index].image!.url!,
                    description: HomeCubit.get(context).donationCardResponse!.data![index].description!,
                    title: HomeCubit.get(context).donationCardResponse!.data![index].title!,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 15.0,
                  ),
                  itemCount: HomeCubit.get(context).donationCardResponse!.data!.length,
                ),
              ),
            ),
          ],
        )
        ),

    );
  }

  Widget BuildImage(ImageModel model) => Container(
        width: 155,
        height: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage('${model.image}'),
            fit: BoxFit.fill,
          ),
        ),
      );
}

class ImageModel {
  final String image;

  ImageModel({
    required this.image,
  });
}
