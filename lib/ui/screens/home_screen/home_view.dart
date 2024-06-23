import 'package:carousel_slider/carousel_slider.dart';
import 'package:donate_clothes/ui/widgets/basic.dart';
import 'package:donate_clothes/ui/widgets/default_text_form_field..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/l10n.dart';
import '../../../shared/constants.dart';
import '../../widgets/ThemeImage.widget.dart';
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
    ImageModel(image: 'assets/images/o7.jpg'),
    ImageModel(image: 'assets/images/p4.jpg'),
    ImageModel(image: 'assets/images/o8.jpg'),
    ImageModel(image: 'assets/images/p4.jpg'),
    ImageModel(image: 'assets/images/p3.jpg'),
    ImageModel(image: 'assets/images/p2.jpg'),

  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
        ()=> Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xffF9F9F9),
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: AssetImage("assets/images/logo.jpg"),
              ),
            ),
          ),
          titleSpacing:80,
          title: Text(
            S.of(context).charityy,
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
              fontWeight: FontWeight.w900,
              fontSize: 3.5.h ,
              color: controller2.app,
              fontStyle: FontStyle.italic,
            ),
          ),
          actions: [
            IconButton(
                onPressed: (){
                  navigateTo(context, SettingScreen());
                },
                icon: Icon(Icons.settings ,color: controller2.app,size: 3.h,)
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Directionality(textDirection:controller.selectedIndex.value == 0 ?
          TextDirection.ltr:
          TextDirection.rtl,
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
                                    S.of(context).c11,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    S.of(context).c13,
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
                                    S.of(context).c21,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    S.of(context).no,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Color(0xffF74F22),
                                    ),
                                  ),
                                  Text(
                                    S.of(context).c22,
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
                                    S.of(context).c31,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    S.of(context).no,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Color(0xffF74F22),
                                    ),
                                  ),
                                  Text(
                                    S.of(context).c32,
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
                                    S.of(context).c4,
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
                                    S.of(context).donate,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Color(0xffF74F22),
                                    ),
                                  ),
                                  Text(
                                    S.of(context).c5,
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
                                        S.of(context).c6,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
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
                                              S.of(context).sale,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: controller.selectedIndex.value == 0?22:14,
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
                                    S.of(context).c71,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    S.of(context).donate,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Color(0xffF74F22),
                                    ),
                                  ),
                                  Text(
                                    S.of(context).c72,
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
                                    S.of(context).c81,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                      color: Color(0xffFFFFFF),
                                    ),
                                  ),
                                  Text(
                                    S.of(context).c82,
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
                    S.of(context).ourWork,
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
          )
          ),

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
