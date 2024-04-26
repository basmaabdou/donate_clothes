import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/constants.dart';




class ThemeController extends GetxController {


  var boardController1 = PageController();
  RxInt selectedIndex = 0.obs;

  RxInt selectedIndexTheme = 0.obs;
  IconData selectedIcon = Icons.check;

  var boardController2 = PageController(initialPage: 1);
  Color app = defaultColor;
  Color textApp=textOrangeTheme;

  void changeThemeColor(Color color,Color txtColor, int index) {
    app = color;
    selectedIndexTheme.value = index;
    textApp=txtColor;
    update();
  }


  var boardController3 = PageController(initialPage: 2);

  List<String> country = ['Egypt'];

  String? selectedCountry;

  var boardController4 = PageController(initialPage: 3);
  final List<Currencyy> currencies = [
    Currencyy('USD/دولار امريكي', 'assets/images/usd.png'),
    Currencyy('EUR/يورو', 'assets/images/eur.png'),
    Currencyy('RHD/دينار بحريني', 'assets/images/bhd.jpeg'),
    Currencyy('GBP/جنيه استرليني', 'assets/images/jpb.png'),
  ].obs;


}
class Currencyy {
  final String title;
  final String imageUrl;

  Currencyy(this.title, this.imageUrl);
}