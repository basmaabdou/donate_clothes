import 'package:bloc/bloc.dart';
import 'package:donate_clothes/ui/screens/brand_screen/brand_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/brands_response.dart';
import '../../../../models/getSingleBrand.response.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_point.dart';

class BrandCubit extends Cubit<BrandStates> {
  String? idBrand;
  String? id = '';

  BrandCubit() : super(InitialState());

  static BrandCubit get(context) => BlocProvider.of(context);

  BrandsResponse? brandsResponse;
  GetSingleBrandResponse? getSingleBrandResponse;

  void getAllBrandsData() {
    DioHelper.getData(url: GET_BRANDS, token: token).then((value) {
      brandsResponse = BrandsResponse.fromJson(value.data);
      emit(SuccessBrandStates());
    }).catchError((error) {
      emit(ErrorBrandStates());
      print(error.toString());
    });
  }

  void getSingleBrandsDetails({required String id}) {
    DioHelper.getData(url: GET_BRANDS + "/" + id, token: token).then((value) {
      getSingleBrandResponse = GetSingleBrandResponse.fromJson(value.data);
      emit(SuccessSingleBrandDetailStates());
    }).catchError((error) {
      emit(ErrorSingleBrandDetailStates());
      print(error.toString());
    });
  }
}
