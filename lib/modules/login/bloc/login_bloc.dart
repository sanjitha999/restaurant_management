import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/modules/login/model/login_request_model.dart';
import 'package:resturant_management/modules/login/webservice/login_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc({
    required this.loginRepository,
  }) : super(LoginInitial()) {
    on<SubmitCredentials>(_onSubmitCredentials);
  }

  Future<void> _onSubmitCredentials(
    SubmitCredentials event,
    Emitter<LoginState> emit,
  ) async {
    try {
      await loginRepository.initiateLogin(
        loginModel: LoginRequestModel(
            username: event.userName, password: event.password),
      );
      // TODO(R Deekshitha): Ideally should check if master data is present or not, if not present only then call the api
      emit(LoginSuccessState());
    } catch (e) {
      emit(ExceptionState(message: "Invalid Credentials"));
    }
  }
}
