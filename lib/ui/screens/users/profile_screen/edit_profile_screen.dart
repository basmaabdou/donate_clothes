import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:donate_clothes/ui/screens/users/profile_screen/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../../shared/constants.dart';
import '../../../widgets/ThemeImage.widget.dart';
import '../../../widgets/default_text_form_field..dart';
import 'cubit_profile/cubit.dart';
import 'cubit_profile/states.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfileScreen> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passController = TextEditingController();

  var confirmPassController = TextEditingController();

  var phoneController = TextEditingController();

  bool isPassword = false;

  File? profileImage;

  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        profileImage = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>ProfileCubit()..getProfileData()..editProfileResponse..editProfileImageResponse,
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (BuildContext context, state) {
         if (state is SuccessUpdateProfileState) {
           Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileView()));
         }
        },
        builder: (BuildContext context, Object? state) {
          nameController.text=ProfileCubit.get(context).profileModel?.data?.username.toString() ?? "name not available";
          phoneController.text = ProfileCubit.get(context).profileModel?.data?.phone??"phone  not available";
          passController.text = ProfileCubit.get(context).editProfileResponse?.data?.password??"123456";
          String profilePhoto=ProfileCubit.get(context).profileModel?.data?.profilephoto?.url ?? "";


          return ConditionalBuilder(
            condition: ProfileCubit.get(context).profileModel != null,
            builder: (BuildContext context) {
              return Scaffold(
                backgroundColor: Color(0xffF9F9F9),
                appBar: AppBar(
                  backgroundColor: Color(0xffF9F9F9),
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileView()));
                      ProfileCubit.get(context).getProfileData();
                    },
                    icon: Icon(Icons.arrow_back, size: 25, color: controller2.app),
                  ),
                  titleSpacing: 80,
                  title: Text(
                    'Edit Prifile',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Color(0xff000000)),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(state is LoadingUpdateProfileImageState)
                        LinearProgressIndicator(backgroundColor: controller2.app,),
                      if(state is LoadingUpdateProfileImageState)
                        SizedBox(
                          height: 10,
                        ),
                      Container(
                        height: 33.h,
                        child: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Container(
                                height: 22.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius:  BorderRadius.only(
                                      bottomLeft: Radius.circular(8),
                                      bottomRight:  Radius.circular(8),
                                    ),
                                    image: DecorationImage(
                                      image:  AssetImage('assets/images/gaza2.jpeg')  ,
                                      fit: BoxFit.fill,
                                    )

                                ),
                              ),
                            ),
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                profileImage != null
                                    ? CircleAvatar(
                                  radius: 11.h,
                                  backgroundImage: (profileImage == null)
                                      ? NetworkImage(profileImage as String)
                                  as ImageProvider<Object>?
                                      : FileImage(profileImage!),
                                )
                                    : CircleAvatar(
                                  radius: 11.h,
                                  backgroundImage:
                                  NetworkImage(ProfileCubit.get(context).profileModel!.data!.profilephoto!.url!),
                                ),
                                Positioned(
                                  top: 15.h,
                                  right: 0.5.h,
                                  child: IconButton(
                                      onPressed: () {
                                        getImageFromGallery();
                                      },
                                      icon: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: controller2.app,
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            size: 20,
                                            color: Colors.white,
                                          ))),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // if(state is LoadingUpdateProfileImageState)
                      //   LinearProgressIndicator(backgroundColor: controller2.app,),
                      // if(state is LoadingUpdateProfileImageState)
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      // if(state is LoadingUpdateProfileState)
                      //   LinearProgressIndicator(backgroundColor:controller2.app),
                      // if(state is LoadingUpdateProfileState)
                      //   SizedBox(
                      //     height: 10,
                      //   ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      // Center(
                      //   child: Stack(
                      //     alignment: AlignmentDirectional.bottomEnd,
                      //     children: [
                      //       profileImage != null
                      //           ? CircleAvatar(
                      //         radius: 80,
                      //         backgroundImage: (profileImage == null)
                      //             ? NetworkImage(profileImage as String)
                      //         as ImageProvider<Object>?
                      //             : FileImage(profileImage!),
                      //       )
                      //           : CircleAvatar(
                      //         radius: 80,
                      //         backgroundImage:
                      //         NetworkImage(ProfileCubit.get(context).profileModel!.data!.profilephoto!.url!),
                      //       ),
                      //       Positioned(
                      //         top: 13.h,
                      //         right: 1.h,
                      //         child: IconButton(
                      //             onPressed: () {
                      //               getImageFromGallery();
                      //             },
                      //             icon: CircleAvatar(
                      //                 radius: 20,
                      //                 backgroundColor: controller2.app,
                      //                 child: Icon(
                      //                   Icons.camera_alt_outlined,
                      //                   size: 20,
                      //                   color: Colors.white,
                      //                 ))),
                      //       ),
                      //     ],
                      //   ),
                      // ),


                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                  color: Color(0xff000000)),
                            ),
                            SizedBox(
                                height: 10
                            ),
                            defaultTextForm(
                                controller: nameController,
                                type: TextInputType.text,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Name must be not empty';
                                  }
                                  return null;
                                },
                                prefix: Icons.person_outline_rounded),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Your Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                  color: Color(0xff000000)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultTextForm(
                                controller: passController,
                                type: TextInputType.visiblePassword,
                                validate: (value) {
                                  if (value.isEmpty) {
                                    return 'the password not allow to be empty';
                                  }
                                  return null;
                                },
                                prefix: Icons.lock,
                                suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                                isPassword: !isPassword,
                                suffixPressed: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                }),
                            const SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Your Phone',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 14,
                                  color: Color(0xff000000)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            defaultTextForm(
                                controller: phoneController,
                                type: TextInputType.phone,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'Phone must be not empty';
                                  }
                                  return null;
                                },
                                prefix: Icons.phone_in_talk_outlined),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width/1.4,
                          height: 45,
                          decoration: BoxDecoration(
                              color: controller2.app,
                              borderRadius: BorderRadius.circular(10)),
                          child: MaterialButton(
                            onPressed: () {
                              ProfileCubit.get(context).updateUserData(
                                username: nameController.text,
                                password: passController.text,
                                phone: phoneController.text,
                              );
                              ProfileCubit.get(context).updateUserProfile(profilephoto: profilePhoto);
                              setState(() {
                                ProfileCubit.get(context).getProfileData();
                              });
                            },
                            child: Text(
                              'save',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                    ],
                  ),
                ),
              );
            },
            fallback: (context)=> Scaffold(body: Center(child: CircularProgressIndicator(color: controller.app))),
          );
        },
      ),
    );
  }
}
