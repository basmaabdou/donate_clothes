import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../shared/constants.dart';
import '../../widgets/basic.dart';
import '../../widgets/share_brand.dart';
import '../layout_screen/layout_screen.dart';
import '../map_screen/map_screen.dart';

class DonateClothesDetails extends StatefulWidget {
  @override
  State<DonateClothesDetails> createState() => _DonateClothesDetailsState();
}

class _DonateClothesDetailsState extends State<DonateClothesDetails> {
var addressController=TextEditingController();
var pickUpController=TextEditingController();
var dateController=TextEditingController();
var phoneController=TextEditingController();
var clothController=TextEditingController();
// var dateController=TextEditingController();


  double _startValue = 12;
  double _endValue = 15;
  String timeFormatter(double time) {
    final formatTime = TimeOfDay.fromDateTime(DateTime(2022, 1, 1, time.round(), 0));
    return formatTime.format(context);
  }

  double quality=10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color:Color(0xffF74F22) ,)
        ),
        title: Center(
          child: Text(
            'Donation Clothes Details',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xffF74F22)
            ),
          ),
        ),
        backgroundColor: Color(0xffFBB7A4),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 159,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(bottomStart: Radius.circular(50),bottomEnd: Radius.circular(50)),
                color: Color(0xffFBB7A4),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 320,
                    height:40 ,
                    child:   TextFormField(
                      controller: addressController,
                      keyboardType:  TextInputType.streetAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'adsress must be not empty';
                        }
                        return null;
                      },
                      onTap: (){
                          navigateTo(context, MapScreen());
                      },
                      decoration: InputDecoration(
                        hintText: 'Al Haram Street',
                          hintStyle: TextStyle(
                          color: Color(0xff323232),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                          fillColor: Color(0xffFFFFFF),
                          filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFFFFFF), width: 2.0,),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Color(0xffFFFFFF)),
                        ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        prefixIcon: Icon(
                         Icons.location_on,color: Color(0xffC4C4C4),
                        ),
                        suffixIcon: InkWell(
                            child: Icon(Icons.wrong_location),
                          onTap: (){addressController.clear();},
                        )

                      ),

                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 320,
                    height:40 ,
                    child:   TextFormField(
                      controller: pickUpController,
                      keyboardType:  TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'pickUp must be not empty';
                        }
                        return null;
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: 'Pickup Instruction?',
                          hintStyle: TextStyle(
                            color: Color(0xff323232),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                          fillColor: Color(0xffFFFFFF),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFFFFFF), width: 2.0,),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.add,color: Color(0xffC4C4C4),
                          ),

                      ),

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Where to share Clothes',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676)
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    height:165,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>ShareBrands(),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 25.0,
                      ),
                      itemCount:2,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'clothes Item (s)',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676)
                    ),
                  ),
                  TextFormField(
                    controller: clothController,
                    decoration: InputDecoration(
                        hintText: "Anna Nagar, 3rd Street",
                        hintStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff323232)
                        ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffF4F1F1))
                      )
                    ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'phone number',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676)
                    ),
                  ),
                  TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                          hintText: "+9639554252222",
                          hintStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff323232)
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffF4F1F1))
                          )
                      ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Pickup Day',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676)
                    ),
                  ),
                  TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        hintText: "11/12/2023",
                        hintStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff323232)
                        ),
                        suffixIcon: Icon(Icons.arrow_drop_down_outlined,size: 24,color: Color(0xff767676),),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffF4F1F1))
                          )
                      ),
                      onTap: () async {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('2024-05-03')).then((value) {
                          dateController.text=DateFormat.yMMMd().format(value!);
                        });

                      }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Pickup Time',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676)
                    ),
                  ),
                  Container(
                    height: 25,
                    width:double.infinity ,
                    child: RangeSlider(
                      values: RangeValues(_startValue, _endValue),
                      min: 10,
                      max: 21,
                      activeColor:defaultColor,
                      inactiveColor:Color(0xffC4C4C4),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _startValue = values.start;
                          _endValue = values.end;
                        });
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${timeFormatter(_startValue)}',
                        style: TextStyle(
                          color: Color(0xffC4C4C4),
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      )
                        ),
                      Text(
                        '${timeFormatter(_endValue)}',
                        style: TextStyle(
                          color: Color(0xffC4C4C4),
                          fontWeight: FontWeight.w400,
                          fontSize: 12
                      ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Quantity',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff767676)
                    ),
                  ),
                  Container(
                    width:double.infinity ,
                    height: 25,
                    child: Slider(
                        value: quality,
                        max: 100,
                        min: 1,
                        activeColor:defaultColor,
                        inactiveColor:Color(0xffC4C4C4),
                        onChanged: (value){
                          setState(() {
                            quality=value;
                          });
                        }
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Min: 01',
                        style: TextStyle(
                            color: Color(0xffC4C4C4),
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),
                      ),
                      Text(
                        ' ${quality.toInt()}',
                        style: TextStyle(
                            color: Color(0xffC4C4C4),
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),
                      ),
                      Text(
                        'Max: 100' ,
                        style: TextStyle(
                            color: Color(0xffC4C4C4),
                            fontWeight: FontWeight.w400,
                            fontSize: 12
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
          Center(
          child: Container(
            width: 155,
            height: 35,
            decoration: BoxDecoration(
                color: Color(0xffF74F22),
                borderRadius: BorderRadius.circular(20)
            ),
            child: MaterialButton(
              onPressed: (){
                Get.defaultDialog(
                  title: '',
                  content: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                       Container(
                         width:73,
                           height: 71,
                           decoration: BoxDecoration(
                             color: defaultColor,
                             borderRadius: BorderRadius.circular(50)
                           ),
                           child: Icon(Icons.check,size: 50,color: Colors.white,)
                       ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Thank you for your  generous',
                          style: TextStyle(
                              color:defaultColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          'DONATION!',
                          style: TextStyle(
                              color: defaultColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                      width: 84,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage('assets/images/like.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 110,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Color(0xffF74F22),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              navigateFinish(context, LayoutScreen());
                            },
                            child: Text(
                              'Go Home',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              child: Text(
                'Donate',
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
          ),
        ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
