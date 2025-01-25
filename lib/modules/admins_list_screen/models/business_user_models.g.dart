// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessUserListResponse _$BusinessUserListResponseFromJson(
        Map<String, dynamic> json) =>
    BusinessUserListResponse(
      code: json['code'] as String?,
      businessList: (json['businessList'] as List<dynamic>?)
          ?.map((e) => BusinessUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BusinessUserListResponseToJson(
        BusinessUserListResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'businessList': instance.businessList,
    };

BusinessUser _$BusinessUserFromJson(Map<String, dynamic> json) => BusinessUser(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      password: json['password'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      mobileNumber: (json['mobileNumber'] as num?)?.toInt(),
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      businessType: json['businessType'] as String?,
      region: json['region'] as String?,
      businessId: json['businessId'] as String?,
    );

Map<String, dynamic> _$BusinessUserToJson(BusinessUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobileNumber': instance.mobileNumber,
      'address': instance.address,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'roles': instance.roles,
      'businessType': instance.businessType,
      'region': instance.region,
      'businessId': instance.businessId,
    };
