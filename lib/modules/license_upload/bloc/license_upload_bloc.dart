import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:resturant_management/di/di_initializer.dart';
import 'package:resturant_management/modules/dashboard/models/master_data_model.dart';
import 'package:resturant_management/modules/license_upload/model/license_enum.dart';
import 'package:resturant_management/modules/license_upload/model/license_item_model.dart';
import 'package:resturant_management/modules/license_upload/webservice/certificate_upload_repository.dart';
import 'package:resturant_management/storage/app_shared_preferences.dart';

part 'license_upload_event.dart';

part 'license_upload_state.dart';

class LicenseUploadBloc extends Bloc<LicenseUploadEvent, LicenseUploadState> {
  final CertificateUploadRepository certificateUploadRepository;
  final String businessId;

  LicenseUploadBloc({
    required this.certificateUploadRepository,
    required this.businessId,
  }) : super(LicenseFetchLoading()) {
    on<FetchLicenseListEvent>(_fetchLicenseListEvent);
    on<UploadLicenseEvent>(_uploadLicense);
    on<UploadAllDocuments>(_uploadAllDocuments);
    on<LicenseIdInput>(_licenseIdInput);
  }

  final Preferences _prefs = AppDI.inject<Preferences>();
  List<LicenseItemModel> _licenseList = [];

  Future<void> _fetchLicenseListEvent(
    FetchLicenseListEvent event,
    Emitter<LicenseUploadState> emit,
  ) async {
    final MasterDataModel? masterData = await _prefs.getMasterDataModel();
    List<LicenseCertificates>? licenses = masterData?.filesRequiredByBusiness;
    if (licenses == null || licenses.isEmpty) {
      emit(NoLicensesState());
    } else {
      // Map each LicenseCertificates to a LicenseItem
      List<LicenseItemModel> licenseItems = licenses.map((license) {
        return LicenseItemModel(
          licenseCertificate: license,
          isLicenseUploaded: false,
        );
      }).toList();
      _licenseList = licenseItems;
      emit(LicenseListFetchedState(licenses: licenseItems));
    }
  }

  Future<void> _uploadAllDocuments(
    UploadAllDocuments event,
    Emitter<LicenseUploadState> emit,
  ) async {
    emit(LicenseUploadLoading());
    try {
      await certificateUploadRepository.uploadCertificates(
        certificates: _licenseList,
        id: businessId,
      );
      emit(LicenseSubmittedState(businessId: businessId));
    } catch (e) {
     debugPrint("MyTEst :: couldn't upload $e");
    }
  }

  Future<void> _uploadLicense(
    UploadLicenseEvent event,
    Emitter<LicenseUploadState> emit,
  ) async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(allowMultiple: true);

      if (result != null) {
        List<File> files = result.paths.map((path) => File(path!)).toList();
        _licenseList[event.index].isLicenseUploaded = true;
        _licenseList[event.index].licenseFile = files[0];
        emit(LicenseListFetchedState(licenses: _licenseList));
      } else {
        // User canceled the picker
      }
    } catch (e) {
     debugPrint("Exception uploading file $e");
    }
  }

  void _licenseIdInput(
    LicenseIdInput event,
    Emitter<LicenseUploadState> emit,
  ) {
    _licenseList[event.index].certificateId = event.text;
  }
}
