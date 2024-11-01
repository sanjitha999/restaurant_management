part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class ExceptionState extends LoginState {
  final String message;

  ExceptionState({required this.message});
}

class LoginSuccessState extends LoginState {}