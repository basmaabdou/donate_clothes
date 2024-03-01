
import 'package:donate_clothes/models/ger_coins_response.dart';

import '../../../../../models/create_order_response.dart';

abstract class ProfileStates{}

class ProfileInitial extends ProfileStates{}

class LoadingProfileStates extends ProfileStates{}

class SuccessProfileStates extends ProfileStates{}

class ErrorProfileStates extends ProfileStates{}

class LoadingOrderStates extends ProfileStates{}

class SuccessOrderStates extends ProfileStates{}

class ErrorOrderStates extends ProfileStates{}

class LoadingUpdateProfileState extends ProfileStates {}

class SuccessUpdateProfileState extends ProfileStates
{
}

class ErrorUpdateProfileState extends ProfileStates {}

class LoadingUpdateProfileImageState extends ProfileStates {}

class SuccessUpdateProfileImageState extends ProfileStates {}

class ErrorUpdateProfileImageState extends ProfileStates {}

class ProfileImageSuccess extends ProfileStates {}

class ProfileImageError extends ProfileStates {}



class SuccessExchangeCoinsStates extends ProfileStates{}

class ErrorExchangeCoinsStates extends ProfileStates{
}


class LoadingGetCoinsState extends ProfileStates {}

class SuccessGetCoinsState extends ProfileStates {
  final GetCoins getCoins;
  SuccessGetCoinsState(this.getCoins);

}

class ErrorGetCoinsState extends ProfileStates {
  final String error;
  ErrorGetCoinsState(this.error);
}
