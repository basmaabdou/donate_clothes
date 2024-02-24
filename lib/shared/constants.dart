
import 'dart:ui';

import '../ui/screens/users/login_screen.dart';
import '../ui/widgets/basic.dart';
import 'network/local/cache_helper.dart';



void signOut(context){
  CacheHelper.removeDate(key: 'token').then((value) {
    navigateFinish(context, LoginScreen());
  });
}

String? token='';

String? sId='';

Color defaultColor=Color(0xffF74F22);


void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}








