
import 'package:donate_clothes/ui/widgets/default_text_form_field..dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../generated/l10n.dart';
import 'layout_cubit/cubit.dart';
import 'layout_cubit/states.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LayoutCubit(),
      child: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (BuildContext context, LayoutStates state) {  },
        builder: (BuildContext context, LayoutStates state) {
          var cubit = LayoutCubit.get(context);
          return Scaffold(
            body: cubit.screen[cubit.currentIndex],
            bottomNavigationBar: Directionality(
              textDirection: controller2.selectedIndex==0 ? TextDirection.ltr : TextDirection.rtl,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.currentIndex,
                selectedLabelStyle: TextStyle(
                    color: controller2.app,
                    fontWeight: FontWeight.w600,
                    fontSize: 11
                ),
                unselectedLabelStyle: TextStyle(
                    color: Color(0xff828A89),
                    fontSize: 12,
                    fontWeight: FontWeight.w200
                ),
                selectedItemColor: controller2.app,
                // unselectedItemColor: Color(0xff828A89),
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home,size: 24),
                      label: S.of(context).home
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_balance,size: 24),
                      label: S.of(context).org
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.handshake,size: 24),
                      label: S.of(context).brand
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person,size: 24),
                      label: S.of(context).profile
                  ),

                ],
              ),
            ),

          );
        },
      ),
    );
  }
}
