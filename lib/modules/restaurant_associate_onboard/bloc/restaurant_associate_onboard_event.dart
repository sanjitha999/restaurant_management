part of 'restaurant_associate_onboard_bloc.dart';

@immutable
abstract class RestaurantAssociateOnboardEvent {}

class FetchAssociateOnboardInitialData extends RestaurantAssociateOnboardEvent {}

class NameInput extends RestaurantAssociateOnboardEvent {
  final String Name;

  NameInput({required this.Name});
}

class PasswordInput extends RestaurantAssociateOnboardEvent {
  final String password;

  PasswordInput({required this.password});
}

class FirstNameInput extends RestaurantAssociateOnboardEvent {
  final String firstName;

  FirstNameInput({required this.firstName});
}

class LastNameInput extends RestaurantAssociateOnboardEvent {
  final String lastName;

  LastNameInput({required this.lastName});
}

class MobileInput extends RestaurantAssociateOnboardEvent {
  final String mobile;

  MobileInput({required this.mobile});
}

class GenderInput extends RestaurantAssociateOnboardEvent {
  final String gender;

  GenderInput({required this.gender});
}

class DateOfBirthInput extends RestaurantAssociateOnboardEvent {
  final String dob;

  DateOfBirthInput({required this.dob});
}

class RoleInput extends RestaurantAssociateOnboardEvent {
  final String role;

  RoleInput({required this.role});
}

class SubmitDetails extends RestaurantAssociateOnboardEvent {}
