import 'package:bloc/bloc.dart' hide FormData;
import 'package:donate_clothes/models/brands_response.dart';
import 'package:donate_clothes/models/organization_response.dart';
import 'package:donate_clothes/ui/screens/users/profile_screen/cubit_profile/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../models/edit_profile_image_response.dart';
import '../../../../../models/edit_profile_response.dart';
import '../../../../../models/exchange_coins_resonse.dart';
import '../../../../../models/ger_coins_response.dart';
import '../../../../../models/profile_response.dart';
import '../../../../../shared/constants.dart';
import '../../../../../shared/network/remote/dio_helper.dart';
import '../../../../../shared/network/remote/end_point.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  ProfileResponse? profileModel;

  void getProfileData() {
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      profileModel = ProfileResponse.fromJson(value.data);
      // print(profileModel!.data!.username);
      emit(SuccessProfileStates());
    }).catchError((error) {
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

      getProfileData();
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

      getProfileData();
      emit(SuccessUpdateProfileImageState());
    }).catchError((error) {
      emit(ErrorUpdateProfileImageState());
      print(error.toString());
    });
  }

  ExchangeCoins? exchangeCoins;

  void getExchangeCoins({
    required String amount,
  }) {
    DioHelper.postData(url: QRCODE, token: token, data: {
      'amount': amount,
    }).then((value) {
      exchangeCoins = ExchangeCoins.fromJson(value.data);
      print(exchangeCoins!.message);
      print(exchangeCoins!.success);
      getProfileData();
      emit(SuccessExchangeCoinsStates());
    }).catchError((error) {
      emit(ErrorExchangeCoinsStates());
      print(error.toString());
    });
  }

  GetCoins? getCoins;

  void getCoinsOrder({required String idOrder}) {
    emit(LoadingGetCoinsState());
    DioHelper.postData(
      token: token,
      url: GETCOINS + "/" + idOrder,
    ).then((value) {
      getCoins = GetCoins.fromJson(value.data);
      emit(SuccessGetCoinsState(getCoins!));
      getProfileData();
    }).catchError((error) {
      emit(ErrorGetCoinsState(error.toString()));
    });
  }


}
