// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_onboard_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserOnboardRequestModel _$UserOnboardRequestModelFromJson(
        Map<String, dynamic> json) =>
    UserOnboardRequestModel(
      userName: json['userName'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String?,
      mobileNumber: (json['mobileNumber'] as num).toInt(),
      gender: json['gender'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      businessId: json['businessId'] as String?,
      businessType: json['businessType'] as String?,
    );

Map<String, dynamic> _$UserOnboardRequestModelToJson(
        UserOnboardRequestModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'mobileNumber': instance.mobileNumber,
      'gender': instance.gender,
      'dateOfBirth': instance.dateOfBirth,
      'roles': instance.roles,
      'businessType': instance.businessType,
      'businessId': instance.businessId,
    };
