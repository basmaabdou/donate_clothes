import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../shared/constants.dart';
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

        },
        builder: (BuildContext context, Object? state) {
          nameController.text =  ProfileCubit.get(context) .profileModel?.data?.username ?? 'name not available';
          phoneController.text =  ProfileCubit.get(context).profileModel?.data?.phone ?? 'Phone not available';
          passController.text= ProfileCubit.get(context).editProfileResponse?.data?.password ?? '12345678';
          String profilePhoto=ProfileCubit.get(context).editProfileResponse?.data?.profilephoto?.url ?? "";

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
                    },
                    icon: Icon(Icons.arrow_back, size: 25, color: Color(0xffF74F22)),
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
                body: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(state is LoadingUpdateProfileImageState)
                          LinearProgressIndicator(backgroundColor: defaultColor,),
                        if(state is LoadingUpdateProfileImageState)
                          SizedBox(
                            height: 10,
                          ),
                        if(state is LoadingUpdateProfileState)
                          LinearProgressIndicator(backgroundColor:defaultColor),
                        if(state is LoadingUpdateProfileState)
                          SizedBox(
                            height: 10,
                          ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              profileImage != null
                                  ? CircleAvatar(
                                radius: 80,
                                backgroundImage: (profileImage == null)
                                    ? NetworkImage(profileImage as String)
                                as ImageProvider<Object>?
                                    : FileImage(profileImage!),
                              )
                                  : CircleAvatar(
                                radius: 80,
                                backgroundImage:
                                NetworkImage(ProfileCubit.get(context).profileModel!.data!.profilephoto!.url!),
                              ),
                              Positioned(
                                top: 120,
                                right: 18.0,
                                child: IconButton(
                                    onPressed: () {
                                      getImageFromGallery();
                                    },
                                    icon: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: Color(0xffF74F22),
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          size: 20,
                                        ))),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
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
                          height: 25,
                        ),
                        Center(
                          child: Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffF74F22),
                                borderRadius: BorderRadius.circular(10)),
                            child: MaterialButton(
                              onPressed: () {
                                ProfileCubit.get(context).updateUserData(
                                  username: nameController.text,
                                  password: passController.text,
                                  phone: phoneController.text,
                                );
                                ProfileCubit.get(context).updateUserProfile(profilephoto: profilePhoto);
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
                ),
              );
            },
            fallback: (context)=> Scaffold(body: Center(child: CircularProgressIndicator())),
          );
        },
      ),
    );
  }
}
