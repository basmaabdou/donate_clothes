import 'package:bloc/bloc.dart';
import 'package:donate_clothes/ui/screens/organization_screen/organization_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/organization_response.dart';
import '../../../../shared/constants.dart';
import '../../../../shared/network/remote/dio_helper.dart';
import '../../../../shared/network/remote/end_point.dart';


class OrganizationCubit extends Cubit<OrganizationStates>{
      OrganizationCubit() : super(InitialState());

      static OrganizationCubit get(context)=>BlocProvider.of(context);


      OrganizationResponse? organizationResponse;
      void getOrganizationData()
      {
            DioHelper.getData(
                url: GET_ORGANIZATION,
                token: token
            ).then((value)
            {
                  organizationResponse = OrganizationResponse.fromJson(value.data);
                  emit(SuccessOrganizationStates());
            }).catchError((error)
            {
                  emit(ErrorOrganizationStates());
                  print(error.toString());
            });
      }



}