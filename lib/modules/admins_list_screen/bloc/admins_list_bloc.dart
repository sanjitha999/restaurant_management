import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/modules/admins_list_screen/models/business_user_models.dart';
import 'package:resturant_management/modules/admins_list_screen/webservice/admin_list_repository.dart';

part 'admins_list_event.dart';

part 'admins_list_state.dart';

class AdminsListBloc extends Bloc<AdminsListEvent, AdminsListState> {
  final AdminListRepository repository;

  AdminsListBloc({required this.repository}) : super(AdminsListLoadingState()) {
    on<FetchAdminListEvent>(_fetchAdminListEvent);
  }

  FutureOr<void> _fetchAdminListEvent(
    FetchAdminListEvent event,
    Emitter<AdminsListState> emit,
  ) async {
    try {
      final List<BusinessUser>? adminList = await repository.getAdminList();
      emit(AdminListDisplayState(adminList: adminList ?? []));
    } catch (e) {
     debugPrint("MyTest :: fetch admin error $e");
    }
  }
}
