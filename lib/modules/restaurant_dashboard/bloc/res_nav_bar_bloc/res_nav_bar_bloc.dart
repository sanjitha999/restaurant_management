import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'res_nav_bar_event.dart';

part 'res_nav_bar_state.dart';

class ResNavBarBloc extends Bloc<ResNavBarEvent, ResNavBarState> {
  ResNavBarBloc() : super(MenuTabTapState()) {
    on<MenuTabTapEvent>(_onMenuTabTap);
    on<OperatorsTabTapEvent>(_onOperatorTabTap);
    on<ProfileTabTapEvent>(_onProfileTabTap);
  }

  FutureOr<void> _onMenuTabTap(
    MenuTabTapEvent event,
    Emitter<ResNavBarState> emit,
  ) {
    emit(MenuTabTapState());
  }

  FutureOr<void> _onProfileTabTap(
    ProfileTabTapEvent event,
    Emitter<ResNavBarState> emit,
  ) {
    emit(ProfileTabTapState());
  }

  FutureOr<void> _onOperatorTabTap(
    OperatorsTabTapEvent event,
    Emitter<ResNavBarState> emit,
  ) {
    emit(OperatorsTabTapState());
  }
}
