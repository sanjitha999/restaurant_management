part of 'license_upload_bloc.dart';

@immutable
abstract class LicenseUploadState {}

class LicenseFetchLoading extends LicenseUploadState {}

class LicenseUploadLoading extends LicenseUploadState {}

class LicenseListFetchedState extends LicenseUploadState {
  final List<LicenseItemModel> licenses;

  LicenseListFetchedState({required this.licenses});
}

class NoLicensesState extends LicenseUploadState {}

class LicenseSubmittedState extends LicenseUploadState {
  final String businessId;

  LicenseSubmittedState({required this.businessId});
}

