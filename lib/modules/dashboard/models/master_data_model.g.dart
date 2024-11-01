// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterDataModel _$MasterDataModelFromJson(Map<String, dynamic> json) =>
    MasterDataModel(
      secondLevelCheckItemMap: json['SecondLevelCheckItemMap'] == null
          ? null
          : SecondLevelCheckItemMapModel.fromJson(
              json['SecondLevelCheckItemMap'] as Map<String, dynamic>),
      regions:
          (json['regions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      menuTypes: (json['MENU_TYPES'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      roles:
          (json['ROLES'] as List<dynamic>?)?.map((e) => e as String).toList(),
      filesRequiredByBusiness:
          (json['FILES_REQUIRED_BY_BUSINESS'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$LicenseCertificatesEnumMap, e))
              .toList(),
      scopes:
          (json['SCOPES'] as List<dynamic>?)?.map((e) => e as String).toList(),
      approvalItemMap: json['ApprovalItemMap'] == null
          ? null
          : ApprovalItemMapModel.fromJson(
              json['ApprovalItemMap'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MasterDataModelToJson(MasterDataModel instance) =>
    <String, dynamic>{
      'SecondLevelCheckItemMap': instance.secondLevelCheckItemMap,
      'regions': instance.regions,
      'MENU_TYPES': instance.menuTypes,
      'ROLES': instance.roles,
      'FILES_REQUIRED_BY_BUSINESS': instance.filesRequiredByBusiness
          ?.map((e) => _$LicenseCertificatesEnumMap[e]!)
          .toList(),
      'SCOPES': instance.scopes,
      'ApprovalItemMap': instance.approvalItemMap,
    };

const _$LicenseCertificatesEnumMap = {
  LicenseCertificates.GSTCertificate: 'GSTCertificate',
  LicenseCertificates.TradeLicenseCertificate: 'TradeLicenseCertificate',
  LicenseCertificates.WaterLicenseCertificate: 'WaterLicenseCertificate',
  LicenseCertificates.PestControlCertificate: 'PestControlCertificate',
  LicenseCertificates.FoodLicenseCertificate: 'FoodLicenseCertificate',
};

SecondLevelCheckItemMapModel _$SecondLevelCheckItemMapModelFromJson(
        Map<String, dynamic> json) =>
    SecondLevelCheckItemMapModel(
      checkList: (json['checkList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mandatoryList: (json['mandatoryList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SecondLevelCheckItemMapModelToJson(
        SecondLevelCheckItemMapModel instance) =>
    <String, dynamic>{
      'checkList': instance.checkList,
      'mandatoryList': instance.mandatoryList,
    };

ApprovalItemMapModel _$ApprovalItemMapModelFromJson(
        Map<String, dynamic> json) =>
    ApprovalItemMapModel(
      checkList: (json['checkList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      seatCapacity: (json['seatCapacity'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      carParkingCapacity: (json['carParkingCapacity'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      kitchenHygiene: (json['kitchenHygiene'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      feedbackItemsList: (json['feedbackItemsList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      feedbackPoints: (json['feedbackPoints'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ApprovalItemMapModelToJson(
        ApprovalItemMapModel instance) =>
    <String, dynamic>{
      'checkList': instance.checkList,
      'seatCapacity': instance.seatCapacity,
      'carParkingCapacity': instance.carParkingCapacity,
      'kitchenHygiene': instance.kitchenHygiene,
      'feedbackItemsList': instance.feedbackItemsList,
      'feedbackPoints': instance.feedbackPoints,
    };
