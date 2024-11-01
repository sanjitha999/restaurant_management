part of 'restaurant_onboarding_bloc.dart';

@immutable
abstract class RestaurantOnboardingEvent {}

class RestaurantOnboardFetchInitialData extends RestaurantOnboardingEvent {}

class OnRestaurantNameInput extends RestaurantOnboardingEvent {
  final String name;

  OnRestaurantNameInput({required this.name});
}

class OnRestaurantNoInput extends RestaurantOnboardingEvent {
  final String number;

  OnRestaurantNoInput({required this.number});
}

class OnLocationPicked extends RestaurantOnboardingEvent {
  final LatLng latLng;

  OnLocationPicked({required this.latLng});
}

class OnRestaurantDetailsSubmit extends RestaurantOnboardingEvent {}

class OwnerNameInput extends RestaurantOnboardingEvent {
  final String name;

  OwnerNameInput({required this.name});
}

class OwnerNumberInput extends RestaurantOnboardingEvent {
  final String number;

  OwnerNumberInput({required this.number});
}

class OwnerEmailInput extends RestaurantOnboardingEvent {
  final String? emailId;

  OwnerEmailInput({this.emailId});
}

class SubmitRestaurantDetails extends RestaurantOnboardingEvent {}
