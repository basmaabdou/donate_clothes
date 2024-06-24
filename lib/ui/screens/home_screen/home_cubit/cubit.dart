import 'package:bloc/bloc.dart';
import 'package:donate_clothes/models/users_model.dart';
import 'package:donate_clothes/ui/screens/home_screen/home_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/brands_response.dart';
import '../../../../models/donation_card_response.dart';
import '../../../../models/organization_response.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_point.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(InitialStates());

  String? id = '';
  static HomeCubit get(context) => BlocProvider.of(context);

  DonationCardResponse? donationCardResponse;

  UserModel userModel = UserModel();
  void getDonationData() {
    DioHelper.getData(url: DONATIONCARD, token: token).then((value) {
      donationCardResponse = DonationCardResponse.fromJson(value.data);
      emit(SuccessDonationStates());
    }).catchError((error) {
      emit(ErrorDonationStates());
      print(error.toString());
    });
  }

  BrandsResponse? brandsResponse;
  OrganizationResponse? organizationResponse;

  void getAllOrganizationData() {
    DioHelper.getData(url: GET_ORGANIZATION, token: token).then((value) {
      organizationResponse = OrganizationResponse.fromJson(value.data);
      emit(SuccessOrganizationStates());
    }).catchError((error) {
      emit(ErrorOrganizationStates());
      print(error.toString());
    });
  }


  void getAllBrandsData() {
    DioHelper.getData(url: GET_BRANDS, token: token).then((value) {
      brandsResponse = BrandsResponse.fromJson(value.data);
      emit(SuccessBrandStates());
    }).catchError((error) {
      emit(ErrorBrandStates());
      print(error.toString());
    });
  }
}
