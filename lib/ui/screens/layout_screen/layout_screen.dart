
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              selectedLabelStyle: TextStyle(
                  color: Color(0xffF74F22),
                  fontWeight: FontWeight.w600,
                  fontSize: 11
              ),
              unselectedLabelStyle: TextStyle(
                  color: Color(0xff828A89),
                  fontSize: 12,
                  fontWeight: FontWeight.w200
              ),
              selectedItemColor: Color(0xffF74F22),
              // unselectedItemColor: Color(0xff828A89),
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home,size: 24),
                    label: 'Home'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance,size: 24),
                    label: 'Organization'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.handshake,size: 24),
                    label: 'Brand'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person,size: 24),
                    label: 'Profile'
                ),

              ],
            ),

          );
        },
      ),
    );
  }
}
