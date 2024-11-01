part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class SubmitCredentials extends LoginEvent {
  final String userName;
  final String password;

  SubmitCredentials({
    required this.userName,
    required this.password,
  });
}
