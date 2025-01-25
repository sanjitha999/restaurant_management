import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/session/session_manager.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLogoutEvent>(_authLogout);
  }

  Future<void> _authLogout(
    AuthLogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    await SessionManager().initiateLogout();
  }
}
