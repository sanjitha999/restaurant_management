// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessItem _$BusinessItemFromJson(Map<String, dynamic> json) => BusinessItem(
      id: json['id'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      address: json['address'] == null
          ? null
          : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      approvalStatus: json['approvalStatus'] as String?,
      eligibleForSecondLevelApproval:
          json['eligibleForSecondLevelApproval'] as bool?,
      secondLevelApprovalStatus: json['secondLevelApprovalStatus'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BusinessItemToJson(BusinessItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'address': instance.address,
      'approvalStatus': instance.approvalStatus,
      'eligibleForSecondLevelApproval': instance.eligibleForSecondLevelApproval,
      'secondLevelApprovalStatus': instance.secondLevelApprovalStatus,
      'images': instance.images,
    };
