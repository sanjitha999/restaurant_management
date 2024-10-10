import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/auth/auth_manager.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    print("MyTest :: hrere");
    on<FetchInitialData>(_fetchInitialData);
  }

  Future<void> _fetchInitialData(
    FetchInitialData event,
    Emitter<SplashState> emit,
  ) async {
    bool isAuthenticated = await AuthManager().isAuthenticated();
    if (isAuthenticated) {
      await _checkAndEmitState(emit);
    } else {
      // take to login
      await Future.delayed(Duration(seconds: 2));
      emit(LoginState());
    }
  }

  Future<void> _checkAndEmitState(Emitter<SplashState> emit) async {
    emit(DashboardState());
  }
}
