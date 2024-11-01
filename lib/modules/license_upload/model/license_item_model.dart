import 'dart:io';

import 'package:resturant_management/modules/license_upload/model/license_enum.dart';

class LicenseItemModel {
  final LicenseCertificates licenseCertificate;
  String? certificateId;
  bool isLicenseUploaded;
  File? licenseFile;

  LicenseItemModel({
    required this.licenseCertificate,
    required this.isLicenseUploaded,
    this.certificateId,
    this.licenseFile,
  });
}
