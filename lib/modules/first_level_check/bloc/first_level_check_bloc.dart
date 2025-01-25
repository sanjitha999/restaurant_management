import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/modules/dashboard/models/master_data_model.dart';
import 'package:resturant_management/modules/first_level_check/model/first_level_request_model.dart';
import 'package:resturant_management/modules/first_level_check/webservice/first_level_check_repository.dart';
import 'package:resturant_management/session/session_manager.dart';

part 'first_level_check_event.dart';

part 'first_level_check_state.dart';

class FirstLevelCheckBloc
    extends Bloc<FirstLevelCheckEvent, FirstLevelCheckState> {
  final String businessId;
  final FirstLevelCheckRepository firstLevelCheckRepository;

  FirstLevelCheckBloc({
    required this.businessId,
    required this.firstLevelCheckRepository,
  }) : super(FirstLevelCheckInitial()) {
    on<FetchCheckDataEvent>(_fetchCheckDataEvent);
    on<UpdateKitchenHygiene>(_updateKitchenHygiene);
    on<UpdateAc>(_updateAc);
    on<UpdatePurifiedWater>(_updatePurifiedWater);
    on<UpdateSeatCapacity>(_updateSeatCapacity);
    on<UpdateCarParkingCapacity>(_updateCarParkingCapacity);
    on<UpdateRestRoomCapacity>(_updateRestRoomCapacity);
    on<UpdateRestaurantCleanliness>(_updateResCleanliness);
    on<UpdateAmbiance>(_updateAmbiance);
    on<SubmitFirstLevelCheck>(_submitFirstLevelCheck);
  }

  /// These are checklists
  String _kitchenHygiene = '';
  String _ac = '';
  String _purifiedWater = '';

  /// These are drop down
  String _seatCapacity = '';
  String _carParkingCapacity = '';
  String _restRoomCleanliness = '';
  String _restaurantCleanliness = '';
  String _ambiance = '';

  ///These are the list of dropdown values
  List<String> _seatsList = ['None'];
  List<String> _carParkList = ['None'];
  List<String> _restroomList = ['None'];
  List<String> _cleanlinessList = ['None'];
  List<String> _ambianceList = ['None'];

  Future<void> _fetchCheckDataEvent(
    FetchCheckDataEvent event,
    Emitter<FirstLevelCheckState> emit,
  ) async {
    MasterDataModel? masterData = await SessionManager().getMasterData();
    var firstLevelCheck = masterData?.approvalItemMap;
    _seatsList += firstLevelCheck?.seatCapacity ?? [];
    _carParkList += firstLevelCheck?.carParkingCapacity ?? [];
    _restroomList += firstLevelCheck?.feedbackPoints ?? [];
    _cleanlinessList += firstLevelCheck?.feedbackPoints ?? [];
    _ambianceList += firstLevelCheck?.feedbackPoints ?? [];

    emit(
      ContentState(
        kitchenHygiene: _getBoolFromText(_kitchenHygiene),
        ac: _getBoolFromText(_ac),
        purifiedWater: _getBoolFromText(_purifiedWater),
        seatCap: _seatsList[0],
        carParkingCap: _carParkList[0],
        restroomCap: _restroomList[0],
        restaurantCleanliness: _cleanlinessList[0],
        ambiance: _ambianceList[0],
        seatsList: _seatsList,
        carParkList: _carParkList,
        restroomList: _restroomList,
        cleanlinessList: _cleanlinessList,
        ambianceList: _ambianceList,
      ),
    );
  }

  void _updateKitchenHygiene(
    UpdateKitchenHygiene event,
    Emitter<FirstLevelCheckState> emit,
  ) {
    _kitchenHygiene = _getStringFromBool(event.isChecked);
    emit((state as ContentState).copyWith(
      kitchenHygiene: _getBoolFromText(_kitchenHygiene),
    ));
  }

  void _updateAc(
    UpdateAc event,
    Emitter<FirstLevelCheckState> emit,
  ) {
    _ac = _getStringFromBool(event.isChecked);
    emit((state as ContentState).copyWith(
      ac: _getBoolFromText(_ac),
    ));
  }

  String _getStringFromBool(bool isChecked) {
    if (isChecked) {
      return "YES";
    } else {
      return "NO";
    }
  }

  bool _getBoolFromText(String isChecked) {
    if (isChecked == "YES") {
      return true;
    } else {
      return false;
    }
  }

  void _updatePurifiedWater(
    UpdatePurifiedWater event,
    Emitter<FirstLevelCheckState> emit,
  ) {
    _purifiedWater = _getStringFromBool(event.isChecked);
    emit((state as ContentState).copyWith(
      purifiedWater: _getBoolFromText(_purifiedWater),
    ));
  }

  void _updateSeatCapacity(
    UpdateSeatCapacity event,
    Emitter<FirstLevelCheckState> emit,
  ) {
    _seatCapacity = event.seatCapacity;
    emit((state as ContentState).copyWith(
      seatCap: _seatCapacity,
    ));
  }

  void _updateCarParkingCapacity(
    UpdateCarParkingCapacity event,
    Emitter<FirstLevelCheckState> emit,
  ) {
    _carParkingCapacity = event.parkingCap;
    emit((state as ContentState).copyWith(
      carParkingCap: _carParkingCapacity,
    ));
  }

  void _updateRestRoomCapacity(
    UpdateRestRoomCapacity event,
    Emitter<FirstLevelCheckState> emit,
  ) {
    _restRoomCleanliness = event.restroomCap;
    emit((state as ContentState).copyWith(
      restroomCap: _restRoomCleanliness,
    ));
  }

  void _updateResCleanliness(
    UpdateRestaurantCleanliness event,
    Emitter<FirstLevelCheckState> emit,
  ) {
    _restaurantCleanliness = event.cleanliness;
    emit((state as ContentState).copyWith(
      restaurantCleanliness: _restaurantCleanliness,
    ));
  }

  void _updateAmbiance(
    UpdateAmbiance event,
    Emitter<FirstLevelCheckState> emit,
  ) {
    _ambiance = event.ambiance;
    emit((state as ContentState).copyWith(
      ambiance: _ambiance,
    ));
  }

  Future<void> _submitFirstLevelCheck(
    SubmitFirstLevelCheck event,
    Emitter<FirstLevelCheckState> emit,
  ) async {
    emit(LoadingState());
    try {
      final FirstLevelRequestModel firstLevelRequestModel =
          FirstLevelRequestModel(
        approvalRequest: ApprovalRequest(
          approvalData: ApprovalData(
              kitchenHygiene: _kitchenHygiene ?? '',
              ac: _ac ?? '',
              purifiedWater: _purifiedWater ?? '',
              seatCapacity: _seatCapacity ?? '',
              carParkingCapacity: _carParkingCapacity ?? '',
              restRoomCapacity: _restRoomCleanliness ?? '',
              restaurantCleanliness: _restaurantCleanliness ?? '',
              ambiance: _ambiance ?? ''),
        ),
      );
      await firstLevelCheckRepository.submitFirstLevelApproval(
        requestBody: firstLevelRequestModel,
        businessId: businessId,
      );

      emit(FirstLevelApprovalSubmitState(businessId: businessId));
    } catch (e) {
     debugPrint("Exception submitting amenities $e");
    }
  }
}
