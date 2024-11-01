// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'first_level_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FirstLevelRequestModel _$FirstLevelRequestModelFromJson(
        Map<String, dynamic> json) =>
    FirstLevelRequestModel(
      approvalRequest: ApprovalRequest.fromJson(
          json['ApprovalRequest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FirstLevelRequestModelToJson(
        FirstLevelRequestModel instance) =>
    <String, dynamic>{
      'ApprovalRequest': instance.approvalRequest,
    };

ApprovalRequest _$ApprovalRequestFromJson(Map<String, dynamic> json) =>
    ApprovalRequest(
      approvalData:
          ApprovalData.fromJson(json['approvalData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApprovalRequestToJson(ApprovalRequest instance) =>
    <String, dynamic>{
      'approvalData': instance.approvalData,
    };

ApprovalData _$ApprovalDataFromJson(Map<String, dynamic> json) => ApprovalData(
      kitchenHygiene: json['kitchenHygiene'] as String,
      ac: json['AC'] as String,
      purifiedWater: json['PurifiedWater'] as String,
      seatCapacity: json['seatCapacity'] as String,
      carParkingCapacity: json['carParkingCapacity'] as String,
      restRoomCapacity: json['restRoomCapacity'] as String,
      restaurantCleanliness: json['restaurantCleanliness'] as String,
      ambiance: json['ambiance'] as String,
    );

Map<String, dynamic> _$ApprovalDataToJson(ApprovalData instance) =>
    <String, dynamic>{
      'kitchenHygiene': instance.kitchenHygiene,
      'AC': instance.ac,
      'PurifiedWater': instance.purifiedWater,
      'seatCapacity': instance.seatCapacity,
      'carParkingCapacity': instance.carParkingCapacity,
      'restRoomCapacity': instance.restRoomCapacity,
      'restaurantCleanliness': instance.restaurantCleanliness,
      'ambiance': instance.ambiance,
    };
