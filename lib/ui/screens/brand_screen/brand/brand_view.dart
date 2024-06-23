import 'package:carousel_slider/carousel_slider.dart';
import 'package:donate_clothes/ui/widgets/default_text_form_field..dart';
import 'package:flutter/material.dart';

import '../../../widgets/brands.dart';
import '../brand_cubit/cubit.dart';

class BrandView extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 20, end: 20, bottom: 20, top: 40),
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CarouselSlider(
                  items: [
                    Container(
                      width: 342,
                      height: 214,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage('assets/images/nik.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      width: 342,
                      height: 214,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage('assets/images/zara.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      width: 342,
                      height: 214,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage('assets/images/puman.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      width: 342,
                      height: 214,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadiusDirectional.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage('assets/images/adidasSh.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 226,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: true,
                    autoPlay: true,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                    // viewportFraction: 2.0
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 342,
                height: 44,
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'search your prefer brand',
                    labelStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: controller2.app),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: controller2.app,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: controller2.app),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: controller2.app)),
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color:controller2.app,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                height: 390,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => BrandsLogo(
                    image: BrandCubit.get(context).brandsResponse!.result![index].image!.url!,
                    id:BrandCubit.get(context).brandsResponse!.result![index].sId! ,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 25.0,
                  ),
                  itemCount: BrandCubit.get(context).brandsResponse!.result!.length,
                  scrollDirection: Axis.vertical,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
