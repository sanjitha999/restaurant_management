import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/auth/auth_manager.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {

  SplashBloc() : super(SplashInitial()) {
    on<FetchInitialData>(_fetchInitialData);
  }

  Future<void> _fetchInitialData(
    FetchInitialData event,
    Emitter<SplashState> emit,
  ) async {
    bool isAuthenticated = await AuthManager().isAuthenticated();
    await Future.delayed(const Duration(seconds: 5));
    // "LoginRequest": {
    //         "username": "rvay@vaylabs.com",
    //         "password": "Rvay@54321"
    //     }

    // Admin
    // UserName: Deeksha@admin
    // password: Admin@123
    if (isAuthenticated) {
      await _checkAndEmitState(emit);
    } else {
      emit(LoginState());
    }
  }

  Future<void> _checkAndEmitState(Emitter<SplashState> emit) async {
    emit(DashboardState());
  }
}
