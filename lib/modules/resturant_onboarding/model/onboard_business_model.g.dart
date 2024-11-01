// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard_business_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnBoardBusinessModel _$OnBoardBusinessModelFromJson(
        Map<String, dynamic> json) =>
    OnBoardBusinessModel(
      type: json['type'] as String,
      name: json['name'] as String,
      address: AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      phoneNo: json['phoneNo'] as String,
      ownerInfo:
          OwnerInfoModel.fromJson(json['ownerInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OnBoardBusinessModelToJson(
        OnBoardBusinessModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
      'address': instance.address.toJson(),
      'phoneNo': instance.phoneNo,
      'ownerInfo': instance.ownerInfo.toJson(),
    };
