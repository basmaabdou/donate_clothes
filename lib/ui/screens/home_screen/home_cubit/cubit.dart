import 'package:bloc/bloc.dart';
import 'package:donate_clothes/ui/screens/home_screen/home_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/donation_card_response.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_point.dart';



class HomeCubit extends Cubit<HomeStates>{
      HomeCubit() : super(InitialStates());

      static HomeCubit get(context)=>BlocProvider.of(context);

      DonationCardResponse? donationCardResponse;
      void getDonationData()
      {
            DioHelper.getData(
                url: DONATION,
                token: token
            ).then((value)
            {
                  donationCardResponse = DonationCardResponse.fromJson(value.data);
                  emit(SuccessDonationStates());
            }).catchError((error)
            {
                  emit(ErrorDonationStates());
                  print(error.toString());
            });
      }


}