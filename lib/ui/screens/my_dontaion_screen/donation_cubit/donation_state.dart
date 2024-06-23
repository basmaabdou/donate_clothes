import '../../../../models/create_order_response.dart';

abstract class DonationStates {}

class InitialState extends DonationStates {}

class LoadingDonationStates extends DonationStates {}

class SuccessDonationStates extends DonationStates {}

class ErrorDonationStates extends DonationStates {}

class LoadingCreateStates extends DonationStates {}

class SuccessCreateStates extends DonationStates {
  final CreateOrder createOrder;
  SuccessCreateStates(this.createOrder);
}

class ErrorCreateStates extends DonationStates {
  final String error;
  ErrorCreateStates(this.error);
}
