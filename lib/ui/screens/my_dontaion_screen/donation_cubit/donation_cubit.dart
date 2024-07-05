import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/create_order_response.dart';
import '../../../../models/order_response.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_point.dart';
import 'donation_state.dart';
import 'dart:convert';

class DonationCubit extends Cubit<DonationStates> {
  DonationCubit() : super(InitialState());

  static DonationCubit get(context) => BlocProvider.of(context);

  DonationResponse? donationResponse;

  void getAllDonationData() {
    DioHelper.getData(url: ORDER_DONATINORDERS, token: token).then((value) {
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
    required File image,
  }) async {
    emit(LoadingCreateStates());

    try {
      FormData formData = FormData.fromMap({
        'itemsName': itemsName,
        'location': location,
        'charity': charity,
        'quantity': quantity,
        'phone': phone,
        'image': await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
      });

      DioHelper.postDonateData(
        url: ORDER_DONATAIONORDER,
        data: formData,
        token: token,
      ).then((value) {
        createOrder = CreateOrder.fromJson(value.data);
        if (createOrder != null) {
          emit(SuccessCreateStates(createOrder!));
        } else {
          emit(ErrorCreateStates('Failed to parse response'));
          print('Failed to parse response');
        }
      }).catchError((error) {
        emit(ErrorCreateStates('Request failed: $error'));
        print('Request failed: $error');
      });
    } catch (e) {
      emit(ErrorCreateStates('Error creating request: $e'));
      print('Error creating request: $e');
    }
  }


// void createUserOrderData({
  //   required String itemsName,
  //   required String location,
  //   required String charity,
  //   required double quantity,
  //   required String phone,
  //   required String image,
  // }) {
  //   emit(LoadingCreateStates());
  //
  //   DioHelper.postData(
  //           url: ORDER_DONATAIONORDER,
  //           data: jsonEncode({
  //             'itemsName': itemsName,
  //             'location': location,
  //             'charity': charity,
  //             'quantity': quantity,
  //             'phone': phone,
  //             'image': image,
  //           }),
  //           token: token)
  //       .then((value) {
  //     createOrder = CreateOrder.fromJson(value.data);
  //     if (createOrder != null) {
  //       emit(SuccessCreateStates(createOrder!));
  //     } else {
  //       print('Login model is null');
  //     }
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ErrorCreateStates(error.toString()));
  //   });
  // }
}
