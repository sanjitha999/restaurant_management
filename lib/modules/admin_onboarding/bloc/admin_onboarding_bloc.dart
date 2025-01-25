import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/modules/admin_onboarding/models/user_onboard_request_model.dart';
import 'package:resturant_management/modules/admin_onboarding/webservices/admin_onboard_repository.dart';
import 'package:resturant_management/modules/admins_list_screen/models/admin_create_response_model.dart';
import 'package:resturant_management/utils/string_utils.dart';

part 'admin_onboarding_event.dart';

part 'admin_onboarding_state.dart';

class AdminOnboardingBloc
    extends Bloc<AdminOnboardingEvent, AdminOnboardingState> {
  final AdminOnboardRepository repository;

  AdminOnboardingBloc({required this.repository})
      : super(AdminContentState(showAdminButton: false)) {
    on<AdminNameInput>(_onNameInput);
    on<AdminPasswordInput>(_onPasswordInput);
    on<AdminFirstNameInput>(_onFirstNameInput);
    on<AdminLastNameInput>(_onLastNameInput);
    on<AdminMobileInput>(_onMobileInput);
    on<AdminGenderInput>(_onGenderInput);
    on<AdminDateOfBirthInput>(_onDataOfBirthInput);
    on<SubmitAdminDetails>(_submitAdminDetails);
  }

  String? _name;
  String? _password;
  String? _firstName;
  String? _lastName;
  String? _mobile;
  String? _gender;
  String? _dob;

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
        _dob!.isNotEmpty;
  }

  bool _isValidMobile(String mobile) {
    // Add your mobile number validation logic here (e.g., length check, regex check for valid format)
    return mobile.length == 10; // Example: checking if mobile has 10 digits
  }

  void _onNameInput(
    AdminNameInput event,
    Emitter<AdminOnboardingState> emit,
  ) {
    _name = event.adminName;
    emit((state as AdminContentState).copyWith(
      showAdminButton: _isDetailsValid(),
    ));
  }

  void _onPasswordInput(
    AdminPasswordInput event,
    Emitter<AdminOnboardingState> emit,
  ) {
    _password = event.password;
    emit((state as AdminContentState).copyWith(
      showAdminButton: _isDetailsValid(),
    ));
  }

  void _onFirstNameInput(
    AdminFirstNameInput event,
    Emitter<AdminOnboardingState> emit,
  ) {
    _firstName = event.firstName;
    emit((state as AdminContentState).copyWith(
      showAdminButton: _isDetailsValid(),
    ));
  }

  void _onLastNameInput(
    AdminLastNameInput event,
    Emitter<AdminOnboardingState> emit,
  ) {
    _lastName = event.lastName;
    emit((state as AdminContentState).copyWith(
      showAdminButton: _isDetailsValid(),
    ));
  }

  void _onMobileInput(
    AdminMobileInput event,
    Emitter<AdminOnboardingState> emit,
  ) {
    _mobile = event.mobile;
    emit((state as AdminContentState).copyWith(
      showAdminButton: _isDetailsValid(),
    ));
  }

  void _onGenderInput(
    AdminGenderInput event,
    Emitter<AdminOnboardingState> emit,
  ) {
    _gender = event.gender;
    emit((state as AdminContentState).copyWith(
      showAdminButton: _isDetailsValid(),
    ));
  }

  void _onDataOfBirthInput(
    AdminDateOfBirthInput event,
    Emitter<AdminOnboardingState> emit,
  ) {
    _dob = convertDateFormat(event.dob);
    emit((state as AdminContentState).copyWith(
      showAdminButton: _isDetailsValid(),
    ));
  }

  FutureOr<void> _submitAdminDetails(
    SubmitAdminDetails event,
    Emitter<AdminOnboardingState> emit,
  ) async {
    try {
      final UserOnboardRequestModel adminCreateRequestModel =
          UserOnboardRequestModel(
        userName: _name ?? '',
        password: _password ?? '',
        firstName: _firstName ?? '',
        mobileNumber: int.parse(_mobile ?? ''),
        gender: _gender ?? '',
        dateOfBirth: _dob ?? '',
        roles: ['ADMIN'],
      );

      final AdminCreateResponseModel? response =
          await repository.onboardAdmin(requestData: adminCreateRequestModel);
      emit(AdminDetailsSubmittedState(message: response?.message));
    } catch (e) {
     debugPrint("MyTEst :: admin create exception $e");
    }
  }
}
