import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/modules/dashboard/models/master_data_model.dart';
import 'package:resturant_management/modules/dashboard/utils/role_based_dashboard_util.dart';
import 'package:resturant_management/modules/dashboard/webservice/master_sync_repo.dart';
import 'package:resturant_management/session/session_manager.dart';
import 'package:resturant_management/storage/app_shared_preferences.dart';
import 'package:resturant_management/utils/app_global_keys.dart';
import 'package:resturant_management/utils/user_role_extension.dart';
import 'package:resturant_management/webservices/app_exceptions.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState>
    with RoleBasedDashboardUtil {
  final MasterSyncRepository masterSyncRepository;

  DashboardBloc({required this.masterSyncRepository})
      : super(DashboardLoadingState()) {
    on<FetchDashboardDataEvent>(_fetchInitialData);
  }

  List<Widget> _pages = [];
  List<BottomNavigationBarItem> _bottomNavItems = [];

  Future<void> _fetchInitialData(FetchDashboardDataEvent event,
      Emitter<DashboardState> emit) async {
    try {
      final Preferences prefs = AppDI.inject<Preferences>();
      MasterDataModel? masterDataPrefs = await prefs.getMasterDataModel();
      if (masterDataPrefs == null) {
        await masterSyncRepository.getMasterSyncData();
      }
      final MasterDataModel? masterData = await prefs.getMasterDataModel();
          UserRole? userRole =
          UserRoleExtension.fromScopeString(masterData?.scopes?[0] ?? '');
      SessionManager().setUserRole(userRole);
      if (userRole != null) {
        _pages = getPages(userRole);
        _bottomNavItems = getBottomNavItems(userRole);
      }
      emit(
        DashboardContentState(
          bottomNavItems: _bottomNavItems,
          pages: _pages,
        ),
      );
    } on UnAuthorizedException catch (e) {
      emit(UnAuthorizedState());
    } catch (e, stack) {
    }
  }
}
