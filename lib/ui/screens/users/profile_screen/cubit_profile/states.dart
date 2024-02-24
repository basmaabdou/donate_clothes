
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

class SuccessUpdateProfileImageState extends ProfileStates
{
}

class ErrorUpdateProfileImageState extends ProfileStates {}

class ProfileImageSuccess extends ProfileStates {}

class ProfileImageError extends ProfileStates {}




