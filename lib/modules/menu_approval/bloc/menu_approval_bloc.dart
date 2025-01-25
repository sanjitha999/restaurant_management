import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/modules/dashboard/models/master_data_model.dart';
import 'package:resturant_management/modules/menu_approval/models/menu_approval_response_model.dart';
import 'package:resturant_management/modules/menu_approval/models/title_item_model.dart';
import 'package:resturant_management/modules/menu_approval/webservice/menu_approval_repository.dart';
import 'package:resturant_management/session/session_manager.dart';
import 'package:resturant_management/utils/string_utils.dart';

part 'menu_approval_event.dart';

part 'menu_approval_state.dart';

class MenuApprovalBloc extends Bloc<MenuApprovalEvent, MenuApprovalState> {
  final MenuApprovalRepository repository;
  final String businessId;

  MenuApprovalBloc({
    required this.repository,
    required this.businessId,
  }) : super(MenuApprovalLoading()) {
    on<FetchApprovalListEvent>(_fetchApprovalListEvent);
    on<SubmitApprovalEvent>(_submitApprovalEvent);
  }

  Future<void> _fetchApprovalListEvent(
    FetchApprovalListEvent event,
    Emitter<MenuApprovalState> emit,
  ) async {
    final MasterDataModel? masterData = await SessionManager().getMasterData();
    final SecondLevelCheckItemMapModel? secondLevelItemMapModel =
        masterData?.secondLevelCheckItemMap;
   debugPrint(
        "MyTEst :: masterData ${masterData?.toJson()}");

    final List<TitleItemsModel> checkListContent = [];
    if (secondLevelItemMapModel != null) {
      checkListContent.add(TitleItemsModel(
        title: "CHECK LIST",
        items: secondLevelItemMapModel.checkList,
      ));
      checkListContent.add(TitleItemsModel(
        title: "MANDATORY LIST",
        items: secondLevelItemMapModel.mandatoryList,
      ));
    }

    emit(MenuCheckListContent(
      checkListContent: checkListContent,
    ));
  }

  Future<void> _submitApprovalEvent(
    SubmitApprovalEvent event,
    Emitter<MenuApprovalState> emit,
  ) async {
    try {
      final MenuApprovalResponseModel? menuApprovalResponse =
          await repository.approveMenu(
        businessId: businessId,
      );
      emit(SuccessState(message: menuApprovalResponse?.message ?? ''));
    } catch (e) {
      emit(ExceptionState(message: e.toString()));
    }
  }
}
