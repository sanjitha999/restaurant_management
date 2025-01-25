part of 'admin_onboarding_bloc.dart';

@immutable
abstract class AdminOnboardingEvent {}

class AdminNameInput extends AdminOnboardingEvent {
  final String adminName;

  AdminNameInput({required this.adminName});
}

class AdminPasswordInput extends AdminOnboardingEvent {
  final String password;

  AdminPasswordInput({required this.password});
}

class AdminFirstNameInput extends AdminOnboardingEvent {
  final String firstName;

  AdminFirstNameInput({required this.firstName});
}

class AdminLastNameInput extends AdminOnboardingEvent {
  final String lastName;

  AdminLastNameInput({required this.lastName});
}

class AdminMobileInput extends AdminOnboardingEvent {
  final String mobile;

  AdminMobileInput({required this.mobile});
}

class AdminGenderInput extends AdminOnboardingEvent {
  final String gender;

  AdminGenderInput({required this.gender});
}

class AdminDateOfBirthInput extends AdminOnboardingEvent {
  final String dob;

  AdminDateOfBirthInput({required this.dob});
}

class SubmitAdminDetails extends AdminOnboardingEvent {}
