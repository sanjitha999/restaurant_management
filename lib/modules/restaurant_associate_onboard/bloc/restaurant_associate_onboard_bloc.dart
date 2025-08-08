import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/modules/admin_onboarding/models/user_onboard_request_model.dart';
import 'package:resturant_management/modules/dashboard/models/master_data_model.dart';
import 'package:resturant_management/modules/restaurant_associate_onboard/model/restaurant_associate_response_model.dart';
import 'package:resturant_management/modules/restaurant_associate_onboard/webservices/restaurant_associate_onboard_repository.dart';
import 'package:resturant_management/storage/app_shared_preferences.dart';
import 'package:resturant_management/utils/string_utils.dart';

part 'restaurant_associate_onboard_event.dart';

part 'restaurant_associate_onboard_state.dart';

class RestaurantAssociateOnboardBloc extends Bloc<
    RestaurantAssociateOnboardEvent, RestaurantAssociateOnboardState> {
  final RestaurantAssociateOnboardRepository repository;
  final String businessId;

  RestaurantAssociateOnboardBloc({
    required this.repository,
    required this.businessId,
  }) : super(ContentState(showButton: false)) {
    on<FetchAssociateOnboardInitialData>(_onFetchInitialData);
    on<NameInput>(_onNameInput);
    on<PasswordInput>(_onPasswordInput);
    on<FirstNameInput>(_onFirstNameInput);
    on<LastNameInput>(_onLastNameInput);
    on<MobileInput>(_onMobileInput);
    on<GenderInput>(_onGenderInput);
    on<DateOfBirthInput>(_onDateOfBirthInput);
    on<RoleInput>(_onRoleInput);
    on<SubmitDetails>(_submitDetails);
  }

  String? _name;
  String? _password;
  String? _firstName;
  String? _lastName;
  String? _mobile;
  String? _gender;
  String? _dob;
  String? _role;

  bool _isDetailsValid() {
    return _name != null &&
        _name!.isNotEmpty &&
        _password != null &&
        _password!.isNotEmpty &&
        _firstName != null &&
        _firstName!.isNotEmpty &&
        _lastName != null &&
        _lastName!.isNotEmpty &&
        _mobile != null &&
        _mobile!.isNotEmpty &&
        _isValidMobile(_mobile!) &&
        _gender != null &&
        _gender!.isNotEmpty &&
        _dob != null &&
        _dob!.isNotEmpty &&
        _role != null &&
        _role!.isNotEmpty;
  }

  bool _isValidMobile(String mobile) {
    return mobile.length == 10; // Example: checking if mobile has 10 digits
  }

  void _onNameInput(
    NameInput event,
    Emitter<RestaurantAssociateOnboardState> emit,
  ) {
    _name = event.Name;
    emit((state as ContentState).copyWith(
      showButton: _isDetailsValid(),
    ));
  }

  void _onPasswordInput(
    PasswordInput event,
    Emitter<RestaurantAssociateOnboardState> emit,
  ) {
    _password = event.password;
    emit((state as ContentState).copyWith(
      showButton: _isDetailsValid(),
    ));
  }

  void _onFirstNameInput(
    FirstNameInput event,
    Emitter<RestaurantAssociateOnboardState> emit,
  ) {
    _firstName = event.firstName;
    emit((state as ContentState).copyWith(
      showButton: _isDetailsValid(),
    ));
  }

  void _onLastNameInput(
    LastNameInput event,
    Emitter<RestaurantAssociateOnboardState> emit,
  ) {
    _lastName = event.lastName;
    emit((state as ContentState).copyWith(
      showButton: _isDetailsValid(),
    ));
  }

  void _onMobileInput(
    MobileInput event,
    Emitter<RestaurantAssociateOnboardState> emit,
  ) {
    _mobile = event.mobile;
    emit((state as ContentState).copyWith(
      showButton: _isDetailsValid(),
    ));
  }

  void _onGenderInput(
    GenderInput event,
    Emitter<RestaurantAssociateOnboardState> emit,
  ) {
    _gender = event.gender;
    emit((state as ContentState).copyWith(
      showButton: _isDetailsValid(),
    ));
  }

  void _onDateOfBirthInput(
    DateOfBirthInput event,
    Emitter<RestaurantAssociateOnboardState> emit,
  ) {
    _dob = convertDateFormat(event.dob);
    emit((state as ContentState).copyWith(
      showButton: _isDetailsValid(),
    ));
  }

  void _onRoleInput(
    RoleInput event,
    Emitter<RestaurantAssociateOnboardState> emit,
  ) {
    _role = event.role;
    print("MyTEst :: is Valid? ${_isDetailsValid()}");
    emit((state as ContentState).copyWith(
      showButton: _isDetailsValid(),
    ));
  }

  FutureOr<void> _submitDetails(
    SubmitDetails event,
    Emitter<RestaurantAssociateOnboardState> emit,
  ) async {
    try {
      final UserOnboardRequestModel createRequestModel =
          UserOnboardRequestModel(
        userName: _name ?? '',
        password: _password ?? '',
        firstName: _firstName ?? '',
        lastName: _lastName,
        mobileNumber: int.parse(_mobile ?? ''),
        gender: _gender ?? '',
        dateOfBirth: _dob ?? '',
        roles: [_role ?? ''],
        // Use selected role
        businessType: 'RESTAURANT',
        businessId: businessId,
      );

      final RestaurantAssociateResponseModel? response = await repository
          .onboardRestaurantAssociate(requestData: createRequestModel);

      emit(DetailsSubmittedState(message: response?.message));
    } catch (e) {
      debugPrint("Error creating restaurant associate: $e");
    }
  }

  Future<void> _onFetchInitialData(
    FetchAssociateOnboardInitialData event,
    Emitter<RestaurantAssociateOnboardState> emit,
  ) async {
    try {
      final Preferences prefs = AppDI.inject<Preferences>();
      MasterDataModel? masterDataPrefs = await prefs.getMasterDataModel();
      List<String> roles = masterDataPrefs?.roles ?? [];
      // Filter roles that start with 'RESTAURANT'
      List<String> restaurantRoles =
          roles.where((role) => role.startsWith('RESTAURANT')).toList();
      emit(RolesFetchedState(roles: restaurantRoles));
      emit(ContentState(showButton: false));
    } catch (e) {}
  }
}
