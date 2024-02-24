import 'package:bloc/bloc.dart';
import 'package:donate_clothes/ui/screens/layout_screen/layout_cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/network/local/cache_helper.dart';
import '../../brand_screen/brand/brand_screen.dart';
import '../../brand_screen/brand/brand_view.dart';
import '../../home_screen/home_screen.dart';
import '../../home_screen/home_view.dart';
import '../../organization_screen/organization/organization_screen.dart';
import '../../users/profile_screen/profile_screen.dart';


class LayoutCubit extends Cubit<LayoutStates>{
      LayoutCubit() : super(InitialState());

      static LayoutCubit get(context)=>BlocProvider.of(context);

      int currentIndex=0;
      List<Widget> screen=[
            HomeScreen(),
            OrganizationScreen(),
            BrandScreen(),
            ProfileScreen()
      ];
      void changeIndex(int index){
      currentIndex=index;
      emit(ChangeBottomNavStates());
}


      bool isDark=false;
      void changeMode( { bool? fromShared}){
            if(fromShared != null){
                  isDark=fromShared;
                  emit(AppChangeMode());
            }else {
                  isDark = !isDark;
                  CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
                        emit(AppChangeMode());
                  });
            }
      }

}