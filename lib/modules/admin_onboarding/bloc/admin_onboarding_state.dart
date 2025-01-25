part of 'admin_onboarding_bloc.dart';

@immutable
abstract class AdminOnboardingState {}

class AdminOnboardingLoading extends AdminOnboardingState {}

class AdminContentState extends AdminOnboardingState {
  final bool? showAdminButton;

  AdminContentState({required this.showAdminButton});

  AdminContentState copyWith({bool? showAdminButton}) {
    return AdminContentState(
      showAdminButton: showAdminButton ?? this.showAdminButton,
    );
  }
}

class AdminDetailsSubmittedState extends AdminOnboardingState {
  final String? message;

  AdminDetailsSubmittedState({this.message});
}
