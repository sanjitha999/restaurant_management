part of 'restaurant_associate_onboard_bloc.dart';

@immutable
abstract class RestaurantAssociateOnboardState {}

class OnboardingLoading extends RestaurantAssociateOnboardState {}

class ContentState extends RestaurantAssociateOnboardState {
  final bool? showButton;

  ContentState({required this.showButton});

  ContentState copyWith({bool? showButton}) {
    return ContentState(
      showButton: showButton ?? this.showButton,
    );
  }
}

class DetailsSubmittedState extends RestaurantAssociateOnboardState {
  final String? message;

  DetailsSubmittedState({this.message});
}

class RolesFetchedState extends RestaurantAssociateOnboardState {
  final List<String> roles;

  RolesFetchedState({required this.roles});
}

