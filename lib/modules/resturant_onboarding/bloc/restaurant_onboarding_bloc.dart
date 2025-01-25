import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/modules/dashboard/models/master_data_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/address_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/onboard_business_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/owner_info_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/model/submit_restaurant_response_model.dart';
import 'package:resturant_management/modules/resturant_onboarding/webservice/restaurant_onboard_repository.dart';
import 'package:resturant_management/storage/app_shared_preferences.dart';

part 'restaurant_onboarding_event.dart';

part 'restaurant_onboarding_state.dart';

class RestaurantOnboardingBloc
    extends Bloc<RestaurantOnboardingEvent, RestaurantOnboardingState> {
  final RestaurantOnboardRepository restaurantOnboardRepository;

  RestaurantOnboardingBloc({
    required this.restaurantOnboardRepository,
  }) : super(RestaurantOnboardingInitial()) {
    on<RestaurantOnboardFetchInitialData>(_fetchInitialData);
    on<OnLocationPicked>(_locationPicked);
    on<OnRestaurantNameInput>(_onRestaurantNameInput);
    on<OnRestaurantNoInput>(_onRestaurantNoInput);
    on<OwnerNameInput>(_ownerNameInput);
    on<OwnerNumberInput>(_ownerNumberInput);
    on<OwnerEmailInput>(_ownerEmailInput);
    on<SubmitRestaurantDetails>(_submitRestaurantDetails);
  }

  String? _restaurantName;
  String? _restaurantNo;
  String? _location;
  String? ownerName;
  String? ownerNo;
  String? ownerEmail;
  AddressModel? _addressModel;

  Future<void> _fetchInitialData(RestaurantOnboardFetchInitialData event,
      Emitter<RestaurantOnboardingState> emit) async {
    final Preferences prefs = AppDI.inject<Preferences>();
    final MasterDataModel? masterData = await prefs.getMasterDataModel();
    emit(RestaurantContentState());
  }

  Future<void> _locationPicked(
      OnLocationPicked event, Emitter<RestaurantOnboardingState> emit) async {
    AddressModel? address = await _getAddressFromLatLng(event.latLng);
    _location = address?.line1;
    emit((state as RestaurantContentState).copyWith(
      addressModel: address,
      showRestaurantButton: _isRestaurantFormValid(),
    ));
  }

  Future<AddressModel?> _getAddressFromLatLng(LatLng latLng) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude,
        latLng.longitude,
      );
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        _addressModel = AddressModel(
          country: place.country,
          district: place.locality,
          line1: place.name,
          line2: 'Street ${place.street}',
          pincode: place.postalCode,
          state: place.administrativeArea,
          landmark: "",
          location: LocationModel(
              latitude: latLng.latitude, longitude: latLng.longitude),
        );
        return _addressModel;
      } else {
        return null;
      }
    } catch (e) {
     debugPrint(e.toString());
      return null;
    }
  }

  void _onRestaurantNameInput(
      OnRestaurantNameInput event, Emitter<RestaurantOnboardingState> emit) {
    _restaurantName = event.name;
    emit((state as RestaurantContentState).copyWith(
      showRestaurantButton: _isRestaurantFormValid(),
    ));
  }

  void _onRestaurantNoInput(
      OnRestaurantNoInput event, Emitter<RestaurantOnboardingState> emit) {
    _restaurantNo = event.number;
    emit((state as RestaurantContentState).copyWith(
      showRestaurantButton: _isRestaurantFormValid(),
    ));
  }

  bool _isRestaurantFormValid() {
    return (_restaurantNo != null && _restaurantNo!.isNotEmpty) &&
        (_restaurantName != null && _restaurantName!.isNotEmpty) &&
        (_location != null && _location!.isNotEmpty);
  }

  bool _isOwnerDetailsValid() {
    return (ownerName != null && ownerName!.isNotEmpty) &&
        (ownerNo != null && ownerNo!.isNotEmpty) &&
        (ownerEmail != null && ownerEmail!.isNotEmpty);
  }

  void _ownerNameInput(
    OwnerNameInput event,
    Emitter<RestaurantOnboardingState> emit,
  ) {
    ownerName = event.name;
    emit((state as RestaurantContentState).copyWith(
      showOwnerButton: _isOwnerDetailsValid(),
    ));
  }

  void _ownerNumberInput(
    OwnerNumberInput event,
    Emitter<RestaurantOnboardingState> emit,
  ) {
    ownerNo = event.number;
    emit((state as RestaurantContentState).copyWith(
      showOwnerButton: _isOwnerDetailsValid(),
    ));
  }

  void _ownerEmailInput(
    OwnerEmailInput event,
    Emitter<RestaurantOnboardingState> emit,
  ) {
    ownerEmail = event.emailId;
    emit((state as RestaurantContentState).copyWith(
      showOwnerButton: _isOwnerDetailsValid(),
    ));
  }

  Future<void> _submitRestaurantDetails(
    SubmitRestaurantDetails event,
    Emitter<RestaurantOnboardingState> emit,
  ) async {
    try {
      OnBoardBusinessModel onBoardBusinessModel = OnBoardBusinessModel(
        type: BusinessType.restaurant.name,
        name: _restaurantName ?? '',
        address: _addressModel ?? AddressModel(),
        phoneNo: _restaurantNo ?? '',
        ownerInfo: OwnerInfoModel(
          name: ownerName,
          emailId: ownerEmail,
          mobileNo: ownerNo,
        ),
      );
      final SubmitRestaurantResponse? restaurantResponse =
          await restaurantOnboardRepository.submitRestaurantDetails(
        onboardBusinessModel: onBoardBusinessModel,
      );
      emit(RestaurantDetailsSubmittedState(
        restaurantResponse: restaurantResponse,
      ));
    } catch (e) {
     debugPrint("Error updating restaurant $e");
    }
  }
}
