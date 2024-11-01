part of 'license_upload_bloc.dart';

@immutable
abstract class LicenseUploadEvent {}

class FetchLicenseListEvent extends LicenseUploadEvent {}

class UploadLicenseEvent extends LicenseUploadEvent {
  final int index;

  UploadLicenseEvent({required this.index});
}

class LicenseIdInput extends LicenseUploadEvent {
  final int index;
  final String text;

  LicenseIdInput({
    required this.text,
    required this.index,
  });
}

class UploadAllDocuments extends LicenseUploadEvent {}
