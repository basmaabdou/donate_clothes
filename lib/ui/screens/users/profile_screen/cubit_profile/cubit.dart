import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:donate_clothes/ui/screens/users/profile_screen/cubit_profile/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/edit_profile_image_response.dart';
import '../../../../../models/edit_profile_response.dart';
import '../../../../../models/profile_response.dart';
import '../../../../../shared/constants.dart';
import '../../../../../shared/network/remote/dio_helper.dart';
import '../../../../../shared/network/remote/end_point.dart';


class ProfileCubit extends Cubit<ProfileStates>{
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context)=> BlocProvider.of(context);


  ProfileResponse? profileModel;
  void getProfileData()
  {

    DioHelper.getData(
        url: PROFILE,
        token: token
    ).then((value)
    {
      profileModel = ProfileResponse.fromJson(value.data);
      // print(profileModel!.data!.username);


      emit(SuccessProfileStates());
    }).catchError((error)
    {
      emit(ErrorProfileStates());
      print(error.toString());
    });
  }

  EditProfileResponse? editProfileResponse;
  void updateUserData({
    required String username,
    required String password,
    required String phone,
    // required String profilephoto,
  }) {
    emit(LoadingUpdateProfileState());

    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'username': username,
        'password': password,
        'phone': phone,
        // 'profilephoto': profilephoto,
      },
    ).then((value) {
      editProfileResponse = EditProfileResponse.fromJson(value.data);
      // printFullText(editProfileResponse!.message!);

      emit(SuccessUpdateProfileState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUpdateProfileState());
    });
  }

  EditProfileImageResponse? editProfileImageResponse;
  void updateUserProfile({
    required String profilephoto,
  }) {
    emit(LoadingUpdateProfileImageState());
    DioHelper.postData(
      url: UPDATE_PROFILE_Image,
      data: {
        'profilephoto': profilephoto,
      },
    ).then((value) {
      editProfileImageResponse = EditProfileImageResponse.fromJson(value.data);

      emit(SuccessUpdateProfileImageState());
    }).catchError((error) {
      emit(ErrorUpdateProfileImageState());
      print(error.toString());
    });
  }



}