import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:resturant_management/modules/dashboard/utils/role_based_dashboard_util.dart';

part 'bottom_nav_event.dart';

part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState>
    with RoleBasedDashboardUtil {

  BottomNavBloc()
      : super(BottomNavSelectedState(selectedIndex: 0)) {
    on<UpdateNavSelectionEvent>(_updateNavSelection);
  }

  Future<void> _updateNavSelection(
      UpdateNavSelectionEvent event, Emitter<BottomNavState> emit) async {
    emit(BottomNavSelectedState(selectedIndex: event.selectedIndex));
  }
}
