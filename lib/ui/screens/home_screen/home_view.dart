import 'package:carousel_slider/carousel_slider.dart';
import 'package:donate_clothes/ui/screens/brand_screen/brand_detail/brand_details_screen.dart';
import 'package:donate_clothes/ui/screens/my_dontaion_screen/my_donation_screen.dart';
import 'package:donate_clothes/ui/screens/organization_screen/organization_details/organization_details_screen.dart';
import 'package:donate_clothes/ui/screens/setting_screen/theme_screen/theme_screen.dart';
import 'package:donate_clothes/ui/screens/users/profile_screen/profile_screen.dart';
import 'package:donate_clothes/ui/widgets/basic.dart';
import 'package:donate_clothes/ui/widgets/default_text_form_field..dart';
import 'package:donate_clothes/ui/widgets/drawer.dart';
import 'package:donate_clothes/ui/widgets/logout.dart';
import 'package:donate_clothes/ui/widgets/slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../generated/l10n.dart';
import '../../../shared/constants.dart';
import '../../widgets/ThemeImage.widget.dart';
import '../../widgets/animation.dart';
import '../../widgets/brands.dart';
import '../../widgets/our_recent_work.dart';
import '../coins_screen/coins_screen.dart';
import '../setting_screen/lang_screen/lang_view.dart';
import '../setting_screen/setting_screen.dart';
import '../users/profile_screen/cubit_profile/cubit.dart';
import 'home_cubit/cubit.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  List<ImageModel> imageItems = [
    ImageModel(image: 'assets/images/o4.jpg'),
    ImageModel(image: 'assets/images/o7.jpg'),
    ImageModel(image: 'assets/images/p4.jpg'),
    ImageModel(image: 'assets/images/o8.jpg'),
    ImageModel(image: 'assets/images/p4.jpg'),
    ImageModel(image: 'assets/images/p3.jpg'),
    ImageModel(image: 'assets/images/p2.jpg'),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Obx(() => Scaffold(
          key: _scaffoldKey,
          drawer: new Drawer(
            backgroundColor: controller2.app,
            child: DrawerContainer(),
          ),
          backgroundColor: const Color(0xffF9F9F9),
          appBar: AppBar(
            forceMaterialTransparency: true,
            elevation: 0.0,
            backgroundColor: const Color(0xffF9F9F9),
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: controller2.app,
              ),
              iconSize: 4.h,
              onPressed: () {
                _scaffoldKey.currentState!.openDrawer();
              },
            ),
            title: Center(
              child: Text(
                S.of(context).charityy,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 3.5.h,
                  color: controller2.app,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    navigateTo(context, SettingScreen());
                  },
                  icon: Icon(
                    Icons.settings,
                    color: controller2.app,
                    size: 3.h,
                  )),
            ],
          ),
          body: Directionality(
              textDirection: controller.selectedIndex.value == 0
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                        items: [
                          HomeSliderItem(
                            image: 'assets/images/gaza1.jpeg',
                            text1: 'Be of help and hope',
                            text2: 'for',
                            text3: 'the children of Gaza',
                          ),
                          HomeSliderItem(
                            image: 'assets/images/gaza5.jpeg',
                            text1: S.of(context).c71,
                            text2: 'Together, we can make a difference',
                          ),
                          HomeSliderItem(
                              image: 'assets/images/o6.jpg',
                              text1: S.of(context).c11,
                              text2: S.of(context).c13),
                          HomeSliderItem(
                              image: 'assets/images/o5.jpg',
                              text1: S.of(context).c21,
                              text2: S.of(context).no,
                              text3: S.of(context).c22),
                          HomeSliderItem(
                              image: 'assets/images/o2.jpg',
                              text1: S.of(context).c31,
                              text2: S.of(context).no,
                              text3: S.of(context).c32),
                          HomeSliderItem(
                            image: 'assets/images/o8.jpg',
                            text1: S.of(context).donate,
                            text2: S.of(context).c5,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              HomeSliderItem(
                                image: 'assets/images/sale.jpg',
                                text1: S.of(context).c6,
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
                                                    fontSize: controller
                                                                .selectedIndex
                                                                .value ==
                                                            0
                                                        ? 22
                                                        : 14,
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
                          HomeSliderItem(
                            image: 'assets/images/o1.jpg',
                            text1: S.of(context).c81,
                            text2: S.of(context).c82,
                          ),
                        ],
                        options: CarouselOptions(
                            height: 226,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            autoPlayAnimationDuration: Duration(seconds: 1),
                            autoPlayCurve: Curves.linearToEaseOut,
                            scrollDirection: Axis.horizontal,
                            viewportFraction: 1.5)),
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(
                          //   height: 1.h,
                          // ),
                          // Container(
                          //   height: 120,
                          //   child: ListView.separated(
                          //     physics: BouncingScrollPhysics(),
                          //     itemBuilder: (context, index) => InkWell(
                          //       onTap: () {
                          //         navigateTo(context, MyDonationScreen());
                          //       },
                          //       child: Container(
                          //         width: 155,
                          //         height: 145,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(10),
                          //           image: DecorationImage(
                          //             image: AssetImage(
                          //                 '${imageItems[index].image}'),
                          //             fit: BoxFit.cover,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     separatorBuilder: (context, index) =>
                          //         const SizedBox(
                          //       width: 7.0,
                          //     ),
                          //     itemCount: imageItems.length,
                          //     scrollDirection: Axis.horizontal,
                          //   ),
                          // ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            S.of(context).ourbr,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 120,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  navigateTo(context, BrandDetailsScreen(id:HomeCubit.get(context).brandsResponse!
                                      .result![index]
                                      .sId!));
                                },
                                child: Container(
                                  width: 155,
                                  height: 145,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        '${HomeCubit.get(context).brandsResponse?.result?[index].image?.url??""}'
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                              const SizedBox(
                                width: 7.0,
                              ),
                              itemCount: HomeCubit.get(context).brandsResponse?.length??0,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          Text(
                            S.of(context).ourOr,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Container(
                            height: 120,
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  navigateTo(context, OrganizationDetailsScreen(sId:HomeCubit.get(context).organizationResponse!
                                      .result![index]
                                      .sId!));
                                },
                                child: Container(
                                  width: 155,
                                  height: 145,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${HomeCubit.get(context).organizationResponse!
                                              .result![index]
                                              .images![index]
                                              .url!}'
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                              const SizedBox(
                                width: 7.0,
                              ),
                              itemCount: HomeCubit.get(context).organizationResponse?.length??0,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          Text(
                            S.of(context).ourWork,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsetsDirectional.only(start: 1.h,end: 1.h,bottom: 2.h),
                      child: Container(
                        width: double.infinity,
                        height: 43.h, // Add height constraint
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final donationCard =
                                HomeCubit.get(context).donationCardResponse;
                            if (donationCard == null) {
                              return Center(child: CircularProgressIndicator());
                            }
                            return OurRecentWork(
                              img: donationCard.data![index].image!.url!,
                              description: donationCard.data![index].description!,
                              title: donationCard.data![index].title!,
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 15.0,
                          ),
                          itemCount: HomeCubit.get(context)
                                  .donationCardResponse
                                  ?.data
                                  ?.length ??
                              0,
                        ),
                      ),
                    ),

                  ],
                ),
              )),
        ));
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
