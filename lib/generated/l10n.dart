// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `charity`
  String get charity {
    return Intl.message(
      'charity',
      name: 'charity',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your languge`
  String get chooseLang {
    return Intl.message(
      'Choose Your languge',
      name: 'chooseLang',
      desc: '',
      args: [],
    );
  }

  /// `Please Choose Your prefered language to continue to the app`
  String get langInfo {
    return Intl.message(
      'Please Choose Your prefered language to continue to the app',
      name: 'langInfo',
      desc: '',
      args: [],
    );
  }

  /// `Save Change`
  String get saveChang {
    return Intl.message(
      'Save Change',
      name: 'saveChang',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to charity`
  String get welcome {
    return Intl.message(
      'Welcome to charity',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Change Theme`
  String get changetheme {
    return Intl.message(
      'Change Theme',
      name: 'changetheme',
      desc: '',
      args: [],
    );
  }

  /// `LogOut`
  String get logout {
    return Intl.message(
      'LogOut',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `AboutUs`
  String get aboutus {
    return Intl.message(
      'AboutUs',
      name: 'aboutus',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get lang {
    return Intl.message(
      'English',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `Orange`
  String get orange {
    return Intl.message(
      'Orange',
      name: 'orange',
      desc: '',
      args: [],
    );
  }

  /// `Green`
  String get green {
    return Intl.message(
      'Green',
      name: 'green',
      desc: '',
      args: [],
    );
  }

  /// `You con change the theme later`
  String get changeThemeLater {
    return Intl.message(
      'You con change the theme later',
      name: 'changeThemeLater',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure to logout`
  String get confirmLogout {
    return Intl.message(
      'Are you sure to logout',
      name: 'confirmLogout',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `There are a lot of people in need who`
  String get c11 {
    return Intl.message(
      'There are a lot of people in need who',
      name: 'c11',
      desc: '',
      args: [],
    );
  }

  /// `help`
  String get c12 {
    return Intl.message(
      'help',
      name: 'c12',
      desc: '',
      args: [],
    );
  }

  /// `ask for help.`
  String get c13 {
    return Intl.message(
      'ask for help.',
      name: 'c13',
      desc: '',
      args: [],
    );
  }

  /// `These People always feel cold `
  String get c21 {
    return Intl.message(
      'These People always feel cold ',
      name: 'c21',
      desc: '',
      args: [],
    );
  }

  /// `NO`
  String get no {
    return Intl.message(
      'NO',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `one feels them.`
  String get c22 {
    return Intl.message(
      'one feels them.',
      name: 'c22',
      desc: '',
      args: [],
    );
  }

  /// `Elderly and Young people in pain `
  String get c31 {
    return Intl.message(
      'Elderly and Young people in pain ',
      name: 'c31',
      desc: '',
      args: [],
    );
  }

  /// `one feels them.`
  String get c32 {
    return Intl.message(
      'one feels them.',
      name: 'c32',
      desc: '',
      args: [],
    );
  }

  /// `Please don't throw away your clothes.`
  String get c4 {
    return Intl.message(
      'Please don\'t throw away your clothes.',
      name: 'c4',
      desc: '',
      args: [],
    );
  }

  /// `Your Old Clothes.`
  String get c5 {
    return Intl.message(
      'Your Old Clothes.',
      name: 'c5',
      desc: '',
      args: [],
    );
  }

  /// `Donate`
  String get donate {
    return Intl.message(
      'Donate',
      name: 'donate',
      desc: '',
      args: [],
    );
  }

  /// `for your money get a discount from our supporting Brands`
  String get c6 {
    return Intl.message(
      'for your money get a discount from our supporting Brands',
      name: 'c6',
      desc: '',
      args: [],
    );
  }

  /// `SALE`
  String get sale {
    return Intl.message(
      'SALE',
      name: 'sale',
      desc: '',
      args: [],
    );
  }

  /// `Come On  `
  String get c71 {
    return Intl.message(
      'Come On  ',
      name: 'c71',
      desc: '',
      args: [],
    );
  }

  /// `   With us`
  String get c72 {
    return Intl.message(
      '   With us',
      name: 'c72',
      desc: '',
      args: [],
    );
  }

  /// `in Exchange for your donation,`
  String get c81 {
    return Intl.message(
      'in Exchange for your donation,',
      name: 'c81',
      desc: '',
      args: [],
    );
  }

  /// `you will get coins .`
  String get c82 {
    return Intl.message(
      'you will get coins .',
      name: 'c82',
      desc: '',
      args: [],
    );
  }

  /// `Our recent works`
  String get ourWork {
    return Intl.message(
      'Our recent works',
      name: 'ourWork',
      desc: '',
      args: [],
    );
  }

  /// `+ OTHER NGOs`
  String get other {
    return Intl.message(
      '+ OTHER NGOs',
      name: 'other',
      desc: '',
      args: [],
    );
  }

  /// `Help organizations save people`
  String get dataOr {
    return Intl.message(
      'Help organizations save people',
      name: 'dataOr',
      desc: '',
      args: [],
    );
  }

  /// `Our organization`
  String get ourOr {
    return Intl.message(
      'Our organization',
      name: 'ourOr',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Organization`
  String get org {
    return Intl.message(
      'Organization',
      name: 'org',
      desc: '',
      args: [],
    );
  }

  /// `Brand`
  String get brand {
    return Intl.message(
      'Brand',
      name: 'brand',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomBack',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter You Details`
  String get enterData {
    return Intl.message(
      'Please Enter You Details',
      name: 'enterData',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get Email {
    return Intl.message(
      'Email Address',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgetPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get anotheAcc {
    return Intl.message(
      'Don\'t have an account?',
      name: 'anotheAcc',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get signUp {
    return Intl.message(
      'SignUp',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
