// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessDataModel _$BusinessDataModelFromJson(Map<String, dynamic> json) =>
    BusinessDataModel(
      id: json['id'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      phoneNo: json['phoneNo'] as String?,
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      ownerInfo: json['ownerInfo'] == null
          ? null
          : OwnerInfoModel.fromJson(json['ownerInfo'] as Map<String, dynamic>),
      approvalStatus: json['approvalStatus'] as String?,
      certificates: (json['certificates'] as List<dynamic>?)
          ?.map((e) => CertificateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      approvalData: json['approvalData'] == null
          ? null
          : ApprovalData.fromJson(json['approvalData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BusinessDataModelToJson(BusinessDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'phoneNo': instance.phoneNo,
      'address': instance.address,
      'ownerInfo': instance.ownerInfo,
      'approvalStatus': instance.approvalStatus,
      'certificates': instance.certificates,
      'approvalData': instance.approvalData,
    };

CertificateModel _$CertificateModelFromJson(Map<String, dynamic> json) =>
    CertificateModel(
      type: json['type'] as String?,
      fileName: json['fileName'] as String?,
      number: json['number'] as String?,
    );

Map<String, dynamic> _$CertificateModelToJson(CertificateModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'fileName': instance.fileName,
      'number': instance.number,
    };
