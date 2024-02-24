import 'package:bloc/bloc.dart';
import 'package:donate_clothes/ui/screens/brand_screen/brand_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/brands_response.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_point.dart';


class BrandCubit extends Cubit<BrandStates>{
      String? id='';
      BrandCubit() : super(InitialState());

      static BrandCubit get(context)=>BlocProvider.of(context);


      BrandsResponse? brandsResponse;
      void getBrandsData()
      {
            DioHelper.getData(
                url: GET_BRANDS,
                token: token
            ).then((value)
            {
                  brandsResponse = BrandsResponse.fromJson(value.data);
                  emit(SuccessBrandStates());
            }).catchError((error)
            {
                  emit(ErrorBrandStates());
                  print(error.toString());
            });
      }



}