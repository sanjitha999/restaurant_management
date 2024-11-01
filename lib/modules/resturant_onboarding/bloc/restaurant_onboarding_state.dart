part of 'restaurant_onboarding_bloc.dart';

@immutable
abstract class RestaurantOnboardingState {}

class RestaurantOnboardingInitial extends RestaurantOnboardingState {}

class RestaurantContentState extends RestaurantOnboardingState {
  final AddressModel? addressModel;
  final bool? showRestaurantButton;
  final OwnerInfoModel? ownerInfoModel;
  final bool? showOwnerButton;

  RestaurantContentState({
    this.addressModel,
    this.showRestaurantButton,
    this.ownerInfoModel,
    this.showOwnerButton,
  });

  RestaurantContentState copyWith({
    AddressModel? addressModel,
    bool? showRestaurantButton,
    OwnerInfoModel? ownerInfoModel,
    bool? showOwnerButton,
  }) {
    return RestaurantContentState(
      addressModel: addressModel ?? this.addressModel,
      showRestaurantButton: showRestaurantButton ?? this.showRestaurantButton,
      ownerInfoModel: ownerInfoModel ?? this.ownerInfoModel,
      showOwnerButton: showOwnerButton ?? this.showOwnerButton,
    );
  }
}

class RestaurantDetailsSubmittedState extends RestaurantOnboardingState {
  final SubmitRestaurantResponse? restaurantResponse;

  RestaurantDetailsSubmittedState({required this.restaurantResponse});
}
