import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/create_order_response.dart';
import '../../../../models/order_response.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_point.dart';
import 'donation_state.dart';

class DonationCubit extends Cubit<DonationStates> {
  DonationCubit() : super(InitialState());

  static DonationCubit get(context)=> BlocProvider.of(context);

  DonationResponse? donationResponse;

  void getAllDonationData() {
    DioHelper.getData(
        url: ORDER_DONATINORDERS,
        token: token
    ).then((value) {
      donationResponse = DonationResponse.fromJson(value.data);
      emit(SuccessDonationStates());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorDonationStates());
    });
  }

  CreateOrder? createOrder;

  void createUserOrderData({
    required String itemsName,
    required String location,
    required String charity,
    required double quantity,
    required String phone,
  }) {
    emit(LoadingCreateStates());

    DioHelper.postData(
            url: ORDER_DONATAIONORDER, data: jsonEncode({
              'itemsName': itemsName,
              'location': location,
              'charity': charity,
              'quantity': quantity,
              'phone': phone,
            }),
            token: token)
        .then((value) {
      createOrder = CreateOrder.fromJson(value.data);
      if (createOrder != null) {
        emit(SuccessCreateStates(createOrder!));
      } else {
        print('Login model is null');
      }
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCreateStates(error.toString()));
    });
  }
}
