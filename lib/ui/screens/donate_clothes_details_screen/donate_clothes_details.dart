import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dio/dio.dart';
import 'package:donate_clothes/ui/screens/my_dontaion_screen/donation_cubit/donation_cubit.dart';
import 'package:donate_clothes/ui/screens/organization_screen/organization_cubit/cubit.dart';
import 'package:donate_clothes/ui/screens/organization_screen/organization_cubit/states.dart';
import 'package:donate_clothes/ui/screens/users/profile_screen/cubit_profile/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../shared/constants.dart';
import '../../widgets/ThemeImage.widget.dart';
import '../../widgets/basic.dart';
import '../../widgets/default_text_form_field..dart';
import '../layout_screen/layout_screen.dart';
import '../map_screen/map_screen.dart';
import '../my_dontaion_screen/donation_cubit/donation_state.dart';
import '../users/profile_screen/cubit_profile/cubit.dart';

class DonateClothesDetails extends StatefulWidget {
  final String? address;

  DonateClothesDetails({this.address});

  @override
  _DonateClothesDetailsState createState() => _DonateClothesDetailsState();
}

class _DonateClothesDetailsState extends State<DonateClothesDetails> {
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController(text: widget.address);
  }

  var phoneController = TextEditingController();
  var clothController = TextEditingController();
  var numClothController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  double quality = 1;
  int? isSelectedIndex = 0;
  File? image;

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path); // Convert XFile to File
      });
      print('Picked Image Path: ${image!}');
    } else {
      print('No image selected.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DonationCubit(),
        ),
        BlocProvider(
          create: (context) => OrganizationCubit()..getAllOrganizationData(),
        ),
      ],
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Scaffold(
              backgroundColor: Color(0xffFFFFFF),
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: controller.app == defaultBlueColor
                          ? Color(0xffEAEEF5)
                          : Colors.white,
                    )),
                title: Text(
                  'Donation Clothes Details',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: controller.app == defaultBlueColor
                          ? Color(0xffEAEEF5)
                          : Colors.white),
                ),
                backgroundColor: controller.app == defaultColor
                    ? Color.fromARGB(255, 253, 211, 199)
                    : controller.app == defaultBlueColor
                    ? Color(0xff8AA1CA)
                    : Color(0xffD1DFDB),
                elevation: 0,
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 13.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.only(
                            bottomStart: Radius.circular(5.h),
                            bottomEnd: Radius.circular(5.h)),
                        color: controller.app == defaultColor
                            ? Color.fromARGB(255, 253, 211, 199)
                            : controller.app == defaultBlueColor
                            ? Color(0xff8AA1CA)
                            : Color(0xffD1DFDB),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(1.h),
                        child: Container(
                          width: double.infinity,
                          height: 52,
                          child: TextFormField(
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w700),
                            readOnly: true,
                            controller: addressController,
                            keyboardType: TextInputType.streetAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Address must be not empty';
                              }
                              return null;
                            },
                            onTap: () {
                              navigateTo(context, MapScreen());
                            },
                            decoration: InputDecoration(
                                hintText: 'Al Haram Street',
                                hintStyle: TextStyle(
                                  color: controller2.app,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                                fillColor: Color(0xffFFFFFF),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: controller2.app,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                  BorderSide(color: controller2.app),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.location_on,
                                  color: controller2.app,
                                ),
                                suffixIcon: InkWell(
                                  child: Icon(
                                    Icons.wrong_location,
                                    color: controller2.app,
                                  ),
                                  onTap: () {
                                    addressController.clear();
                                  },
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
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
                                color: Color(0xff767676)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          BlocConsumer<OrganizationCubit, OrganizationStates>(
                            listener: (context, state) {},
                            builder: (context, state) {
                              return Container(
                                height: 165,
                                child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        isSelectedIndex = index;
                                        OrganizationCubit.get(context)
                                            .idOrganization =
                                            OrganizationCubit.get(context)
                                                .organizationResponse
                                                ?.result?[0]
                                                .sId ??
                                                '';
                                      });
                                    },
                                    child: Container(
                                      width: 158,
                                      height: 165,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: isSelectedIndex == index
                                              ? Colors.red
                                              : Colors.transparent,
                                          width: 2,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              OrganizationCubit.get(context)
                                                  .organizationResponse
                                                  ?.result?[index]
                                                  .images?[0]
                                                  .url ??
                                                  ''),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 25.0,
                                  ),
                                  itemCount: OrganizationCubit.get(context)
                                      .organizationResponse
                                      ?.result
                                      ?.length ??
                                      5,
                                  scrollDirection: Axis.horizontal,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Items Name',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          defaultTextForm(
                              controller: clothController,
                              type: TextInputType.text,
                              hintText: "Name of item",
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'Name must be not empty';
                                }
                                return null;
                              },
                              prefix: Icons.clean_hands),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Phone Number',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          defaultTextForm(
                            controller: phoneController,
                            type: TextInputType.phone,
                            hintText: "Phone Number",
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Phone must be not empty';
                              }
                              return null;
                            },
                            prefix: Icons.phone,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Quantity',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          defaultTextForm(
                            controller: numClothController,
                            type: TextInputType.number,
                            hintText: "Enter Quantity",
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'Quantity must be not empty';
                              }
                              return null;
                            },
                            prefix: Icons.production_quantity_limits,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Image',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff767676)),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          image != null
                              ? Image.file(
                            image!,
                            width: 100,
                            height: 100,
                          )
                              : Text('No image selected.'),
                          TextButton(
                            onPressed: pickImage,
                            child: Text('Pick Image'),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          BlocConsumer<DonationCubit, DonationStates>(
                            listener: (context, state) {
                              if (state is SuccessCreateStates) {
                                Get.offAll(() => LayoutScreen());
                                messageToast(
                                  msg: "Item Added Successfully",
                                  state: ToastStates.SUCCESS,
                                );
                              } else if (state is ErrorCreateStates) {
                                print(state.error);
                                messageToast(
                                  msg: state.error,
                                  state: ToastStates.ERROR,
                                );
                              }
                            },
                            builder: (context, state) {
                              return ConditionalBuilder(
                                condition: state is! LoadingCreateStates,
                                builder: (context) => MaterialButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      if (image != null) {
                                        DonationCubit.get(context)
                                            .createUserOrderData(
                                          itemsName: clothController.text,
                                          location: addressController.text,
                                          charity: OrganizationCubit.get(
                                              context)
                                              .idOrganization ??
                                              '656a214e49ffe49ca85e71f2',
                                          quantity: double.parse(
                                              numClothController.text),
                                          phone: phoneController.text,
                                          image: image!,
                                        );

                                      } else {
                                        // print(DonationCubit.get(context).createOrder!.status);
                                        // messageToast(
                                        //   msg: 'Please select an image',
                                        //   state: ToastStates.ERROR,
                                        // );
                                      }
                                    }
                                  },
                                  color: controller.app,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10.0)),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Center(
                                      child: Text(
                                        'Donate Now',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                fallback: (context) => Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
